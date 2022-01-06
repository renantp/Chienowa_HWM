/*
 * main.c
 *
 *  Created on: 29 Oct 2021
 *      Author: Renan
 */

#include "main.h"

#include <iodefine.h>

#define VCC (24.0)

struct Timer_Setting_s g_timerSetting = { 1000, 15 };
struct Number_Setting_s g_numberSetting;
uint32_t g_neutralization_time_s;
enum HS_COLOR g_color, g_pre_color;
float g_flow_value;
struct Machine_State_u g_machine_state;
union IO_Status_u g_io_status, g_mean_io_status, g_res_io_status;

struct Timer_Setting_s _settingTime;
struct Number_Setting_s _settingNumber;

uint8_t g_machine_mode, g_machine_test_mode;
union BytesToDouble {
	struct {
		uint8_t data[4];
	} refined;
	uint32_t raw;
} btod;
struct Tick_s g_Tick;



void setting_default(void) {
	g_numberSetting.upperVoltage1 = 4.2;
	g_numberSetting.upperVoltage2 = 3.5;
	g_numberSetting.upperVoltage3 = 2.2;
	g_numberSetting.lowerVoltage = 0.5;
	g_numberSetting.upperCurrent = 4.3;
	g_numberSetting.lowerCurrent = 0.2;
	g_numberSetting.upperFlow = 3.5;
	g_numberSetting.lowerFlow = 0.4;

	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	g_timerSetting.t6_drainageOffTime_h = 1000;
	g_timerSetting.t11_overVoltage1Time_s = 1000;
	g_timerSetting.t12_overVoltage2Time_s = 2000;
	g_timerSetting.t13_overVoltage3Time_s = 5000;
	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
}



struct UART3_Buffer_s {
	uint8_t busy;
	uint8_t head; // 1 byte
	uint8_t set_number; // 1 byte
	uint8_t set_value[4]; // 4 byte
} water_solfner_buf;
void sendRS485(uint8_t busy, uint8_t head, uint8_t type, uint32_t value) {
	uint8_t state = g_uart3_sendend;
	btod.raw = value;
	water_solfner_buf.busy = busy;
	water_solfner_buf.head = head;
	water_solfner_buf.set_number = type;
	for (uint8_t i = 0; i < 4; i++) {
		water_solfner_buf.set_value[i] = btod.refined.data[i];
	}
	O_RS485_MODE_PIN = 1U;
	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	while (state == g_uart3_sendend)
		;

}
void sendR485_7byte(uint8_t addr, uint8_t head, uint8_t *val5) {
	uint8_t buf[7] = { addr, head };
	uint8_t state = g_uart3_sendend;
	for (uint8_t i = 2; i < 7; i++) {
		buf[i] = val5[i - 2];
	}
	O_RS485_MODE_PIN = 1U;
	R_UART3_Send(buf, 7);
	while (state == g_uart3_sendend)
		;

}
uint8_t isThisCommand(uint8_t *input_buf, enum UART_header_e header,
		enum Control_status control, uint32_t data) {
	for (uint8_t i = 0; i < 4; i++) {
		btod.refined.data[i] = input_buf[2 + i];
	}

	if ((input_buf[0] == header) && (input_buf[1] == control)
			&& (btod.raw == data))
		return 2;
	else if ((input_buf[0] == header) && (input_buf[1] == control))
		return 1;
	else
		return 0;
}

/**
 * Drain Tank 1 and Tank 2 if there are any liquid left
 * 13/12/2021: Checked!
 * @return: 0 - Done; 1 - Not done
 */
uint8_t DrainageAcidAndAlkalineTankStart_nostop(void) {
	O_DRAIN_ACID_PIN_SV5 = isAcidTankEmpty() ? OFF : ON;
	O_DRAIN_ALK_PIN_SV6 = isAlkalineTankEmpty() ? OFF : ON;
	return !(O_DRAIN_ACID_PIN_SV5 == OFF && O_DRAIN_ALK_PIN_SV6 == OFF);
}

/*!
 * Supply water to CVCC
 * @return 0 - Done, 1 - Not done yet
 */
uint8_t WaterSupplyStart_nostop(void) {
	uint8_t *state = &g_machine_state.waterSupply;
	uint32_t *tick = &g_Tick.tickWaterSupply;
	switch (*state) {
	case 0:
		*tick = g_systemTime;
		(*state)++;
		break;
	case 1:
		O_SPOUT_WATER_PIN_SV2 = ON;
		if (ns_delay_ms(tick, 30000)) {
			(*state)++;
		}
		break;
	case 2:
		O_SUPPLY_WATER_PIN_SV1 = ON;
		if (ns_delay_ms(tick, 500)) {
			(*state)++;
			g_Tick.tickFlowMeasurment = g_systemTime;
		}
		break;
	case 3:
		O_SPOUT_WATER_PIN_SV2 = OFF;
		if (ns_delay_ms(tick, 15000)) {
			(*state)++;
			g_machine_state.flowSensor = 0;
		}
		measureFlowSensor_nostop();
		break;
	case 4:
		measureFlowSensor(&g_timerSetting.t3_flowSensorMonitorTime_s);
		(*state)++;
		break;
	case 5:
		if (FlowSensorCheck_nonstop())
			(*state) = 3;
		else
			(*state)++;
		g_Tick.tickWaterSupply = g_systemTime;
		break;
	case 6:
		if (ns_delay_ms(&g_Tick.tickWaterSupply,
				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
			(*state) = 0;
		}
		break;
	default:
		(*state) = 0;
		break;
	}
	return (*state) == 0 ? 0 : 1;
}

uint8_t ElectrolyticOperation_nostop(void) {
	uint8_t *state = &g_machine_state.electrolyteOperation;
	switch (*state) {
	case 0:
		(*state)++;
		break;
	case 1:
		electrolyticOperationON();
		g_Tick.tickVoltage1Check = g_systemTime;
		g_Tick.tickVoltage2Check = g_systemTime;
		g_Tick.tickVoltage3Check = g_systemTime;
		g_Tick.tickVoltageLowCheck = g_systemTime;
		g_Tick.tickCurrentCheck = g_systemTime;
		(*state)++;
		break;
	case 2:
		Voltage2Check_nostop();
		if (Voltage1Check_waitReset()) {
			(*state)--;
			break;

		} else if (Voltage3Check_waitReset()) {
			(*state)--;
			break;
		} else if (LowVoltageCheck_waitReset()) {
			(*state)--;
			break;
		} else if (OverCurrentCheck_waitReset()) {
			(*state)--;
			break;
		} else if (I_CVCC_ALARM_IN == I_ON) {
			g_alarm.refined.cvcc = 1;
			g_Tick.tickElectrolyticOff = g_systemTime;
			g_machine_state.electrolyteOFF =
					g_machine_state.electrolyteOFF == 0 ?
							1 : g_machine_state.electrolyteOFF;
			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
			stop_waitAlarmConfirm(CVCC_ALARM, 0);
			g_alarm.refined.cvcc = 0;
			(*state)--;
			break;
		}
		if (isAcidTankFull() && isAlkalineTankFull())
			(*state)++;
		break;
	case 3:
		g_machine_state.electrolyteOFF =
				g_machine_state.electrolyteOFF == 0 ?
						1 : g_machine_state.electrolyteOFF;
		(*state) = 0;
		break;
	default:
		(*state) = 0;
		break;
	}
	return (*state) == 0 ? 1 : 0;
}


void acidWaterTankSkipCheck(void) {
	if (((I_ACID_L_PIN_FL1 == 0) & ((I_ACID_M_PIN_FL2 == 1) | (I_ACID_H_PIN_FL3 == 1)))
			| ((I_ACID_M_PIN_FL2 == 0) & (I_ACID_H_PIN_FL3 == 1))) {
		sendToRasPi_f(H_ALARM, ACID_SKIP_ERROR, 1);

	}
}
void alkalineWaterTankSkipCheck(void) {
	if (((I_ALKALI_L_PIN_FL4 == 0) & ((I_ALKALI_M_PIN_FL5 == 1) | (I_ALKALI_H_PIN_FL6 == 1)))
			| ((I_ALKALI_M_PIN_FL5 == 0) & (I_ALKALI_H_PIN_FL6 == 1))) {
		sendToRasPi_f(H_ALARM, ALKALINE_SKIP_ERROR, 1);
	}
}

uint8_t FilterReplacementCheck(void) {

	return 0;
}


// Newest
void main_init_20211111(void) {
	UpdateMachineStatus();
	while (DrainageAcidAndAlkalineTankStart_nostop()) {
		RaspberryResponse_nostop();
		UpdateMachineStatus();
		R_WDT_Restart();
	}

	UpdateMachineStatus();
	while (WaterSupplyStart_nostop()) {
		realTimeResponse();
	}
	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
		sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
				g_io_status.refined.FlowValue);
	}
	while (!ElectrolyticOperation_nostop()) {
		realTimeResponse();
	}

}

void userAuthHandler_nostop(void) {
	if (g_machine_state.user == 1) {
		switch (g_machine_mode) {
		case HAND_WASHING:
			HandWashingMode_nostop();
			break;
		case WATER_WASHING:
			WaterWashingMode_nostop();
			break;
		case ACID_WASHING:
			AcidWaterMode_nostop();
			break;
		case ALKALINE_WASHING:
			AlkalineWaterMode_nostop();
			break;
		default:
			break;
		}
	}
}
/*!
 * Tested!
 */
void ElectrolyzeWaterGeneration_nostop(void) {
	if ((g_machine_state.mode != ELECTROLYTIC_GENERATION)
			&& (g_machine_state.mode == INDIE)) {
		if (isAcidTankEmpty() || isAlkalineTankEmpty()) {
			// Start Electrolyte
			g_machine_state.mode = ELECTROLYTIC_GENERATION;
			//Stop what ever operation is happening
			g_machine_state.user = 0;
			g_machine_state.handwash = g_machine_state.water =
					g_machine_state.acid = g_machine_state.akaline = 0;
			O_PUMP_ACID_PIN = O_PUMP_ALK_PIN = OFF;
			O_SPOUT_WATER_PIN_SV2 = OFF;

		}
	} else if (g_machine_state.mode == ELECTROLYTIC_GENERATION) {
		// Start Loop Electrolyte
		if (ElectrolyticOperation_nostop()) {
			O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
			g_machine_state.mode = INDIE;
			g_machine_state.user = 0;
			handSensorLED(BLACK);
			// Start Electrolyte Operation Off time keeper
		} else if (!isAcidTankFull() && !isAlkalineTankFull()) {
			handSensorLEDBlink(WHITE, 100);
		} else if (!isAcidTankFull()) {
			handSensorLEDBlink(RED, 100);
		} else if (!isAlkalineTankFull()) {
			handSensorLEDBlink(BLUE, 100);
		}
	}
}
/*!
 * Tested!
 */
uint8_t isSV1andSV2Off8h(void) {
	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
		if (ns_delay_ms(&g_Tick.tickSV1SV2,
				(uint32_t) g_timerSetting.t61_curranCleaningIntervalTime_h * 60
						* 60 * 1000)) {
			return 1;
		}
	} else {
		g_Tick.tickSV1SV2 = g_systemTime;
	}
	return 0;
}
/*!
 * Tested!
 */
void CallanCleaningMode_nostop(void) {
	uint8_t *state = &g_machine_state.callan;
	uint32_t *tick = &g_Tick.tickCallan;
	if (isSV1andSV2Off8h() || (*state) != 0) {
		switch (*state) {
		case 0:
			(*state)++;
			*tick = g_systemTime;
			O_SPOUT_WATER_PIN_SV2 = ON;
			g_machine_state.mode = CALLAN_MODE;
			break;
		case 1:
			handSensorLEDBlink(WHITE, 500);
			if (ns_delay_ms(tick,
					g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
				(*state)++;
				O_SPOUT_WATER_PIN_SV2 = OFF;
				handSensorLED(BLACK);
			}
			break;
		default:
			(*state) = 0;
			break;
		}
	}
}
/*!
 * Tested!
 */
void DrainageMode_nostop(void) {
	uint8_t *state = &g_machine_state.drainage;
	uint32_t *tick = &g_Tick.tickDrainage;
	if (g_machine_state.mode == DRAINAGE_MODE) {
		// Start Drainage Loop
		switch (*state) {
		case 0:
			if (DrainageAcidAndAlkalineTankStart_nostop() == 0) {
				O_SUPPLY_WATER_PIN_SV1 = ON;
				(*state)++;
			}
			break;
		case 1:
			if (ns_delay_ms(tick, 15 * 1000)) {
				(*state)++;
			}
			break;
		case 2:
			if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
					|| (g_io_status.refined.FlowValue
							> g_numberSetting.upperFlow)) {
				(*state)--;
				rx_count++;
			} else {
				(*state)++;
			}
			(*tick) = g_systemTime;
			break;
		case 3:
			if (ns_delay_ms(tick, 10 * 1000)) {
				electrolyticOperationON();
				(*state)++;
			}
			break;
		case 4:
			if (isAcidTankFull() && isAlkalineTankFull()) {
				electrolyticOperationOFF();
				(*state)++;
			}
			break;
		default:
			(*state) = 0;
			g_machine_state.mode = INDIE;
			break;
		}
	} else if ((g_TimeKeeper.electrolyteOff_h
			>= g_timerSetting.t6_drainageOffTime_h)
			&& (g_machine_state.isMidNight != 0)
			&& (g_machine_state.mode == INDIE)) {
		g_machine_state.mode = DRAINAGE_MODE;
		(*tick) = g_systemTime;
	}
}
/*!
 * Tested!
 */
void NormalMode_nostop(void) {
	if ((g_machine_state.mode != BUSY)
			&& (g_machine_state.mode != ELECTROLYTIC_GENERATION)
			&& (g_machine_state.mode != CALLAN_MODE)
			&& (g_machine_state.mode != DRAINAGE_MODE)) {
		userAuthHandler_nostop();
		g_Tick.tickDebouceHandSensor = g_systemTime;
	} else if (g_machine_state.mode == BUSY) {
		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
				g_timerSetting.t55_waterDischargeDelay_s * 1000)) {
			g_machine_state.mode = INDIE;
			g_machine_state.user = 0;
		}
	}
}
/*!
 * Power ON test mode, state 0 - 1, end at 2
 * @param state: Machine state
 * @param tick: Tick for no stop delay
 * @return 0 when done
 */
uint8_t TestPowerOn_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	switch (*state) {
	case 0:
		O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 = O_SPOUT_ACID_PIN_SV3 =
		O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 = O_DRAIN_ALK_PIN_SV6 =
		O_DRAIN_ALK_PIN_SV6 = OPTION_1_PIN_SV8 = OPTION_2_PIN_SV9 = ON;
		O_PUMP_SALT_PIN_SP1 = ON;
		(*tick) = g_systemTime;
		break;
	case 1:
		if (ns_delay_ms(tick, 30 * 1000)) {
			O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 =
			O_SPOUT_ACID_PIN_SV3 =
			O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 =
			O_DRAIN_ALK_PIN_SV6 =
			O_DRAIN_ALK_PIN_SV6 = OPTION_1_PIN_SV8 =
			OPTION_2_PIN_SV9 = OFF;
			O_PUMP_SALT_PIN_SP1 = OFF;
			(*state)++;
		}
		break;
	default:
		break;
	}
	return (*state) == 2 ? 1 : 0;
}
uint8_t FlowRateAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	measureFlowSensor_nostop();
	switch (*state) {
	case 2:
		O_SPOUT_WATER_PIN_SV2 = ON;
		(*state)++;
		(*tick) = g_systemTime;
		break;
	case 3:
		if (ns_delay_ms(tick, 30 * 1000)) {
			O_SUPPLY_WATER_PIN_SV1 = ON;
			(*state)++;
		}
		break;
	case 4:
		if (ns_delay_ms(tick, 500)) {
			(*state)++;
			O_SPOUT_WATER_PIN_SV2 = OFF;
		}
		break;
	case 5:
		if (ns_delay_ms(tick,
				(uint32_t) 15 * 1000 + (uint32_t) 10 * 60 * 1000)) {
			(*state)++;
		}
		break;
	default:
		break;
	}
	return (*state) == 6 ? 1 : 0;
}
uint8_t CurrentAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	switch (*state) {
	case 6:
		electrolyticOperationON();
		(*state)++;
		break;
	case 7:
		if (ElectrolyticOperation_nostop()) {
			(*state)++;
			(*tick) = g_systemTime;
		}
		break;
	case 8:
		if (ns_delay_ms(tick,
				(uint32_t) 15 * 1000 + (uint32_t) 10 * 60 * 1000)) {
			(*state)++;
		}
		break;
	default:
		break;
	}
	return (*state) == 9 ? 1 : 0;
}
uint8_t ElectrolyteAdjustmentOperation(uint8_t *state, uint32_t *tick) {
	switch (*state) {
	case 9:
		electrolyticOperationON();
		(*state)++;
		break;
	case 10:
		if (isAcidTankFull() && isAlkalineTankFull()) {
			electrolyticOperationOFF();
			(*tick) = g_systemTime;
			(*state)++;
		}
		break;
	case 11:
		if (ns_delay_ms(tick, (uint32_t) 10 * 60 * 1000)) {
			(*state)++;
		}
		break;
	default:
		break;
	}
	return (*state);
}
void TestOperation_nostop(void) {
	uint8_t *state = &g_machine_state.test;
	uint32_t *tick = &g_Tick.tickTestOperation;
	switch (commnunication_flag.test_flag) {
	case TEST_POWER_ON:
		if (TestPowerOn_nostop_keepstate(state, &g_Tick.tickTestOperation)) {
			commnunication_flag.test_flag = 0;
			*state = 0;
		}
		break;
	case TEST_FLOW_RATE:
		if (FlowRateAdjustmentMode_nostop_keepstate(state, tick)) {
			commnunication_flag.test_flag = 0;
			*state = 0;
		}
		break;
	case TEST_CURRENT:
		if (CurrentAdjustmentMode_nostop_keepstate(state, tick)) {
			commnunication_flag.test_flag = 0;
			*state = 0;
		}
		break;
	case TEST_INDIVIDUAL:

		break;
	case TEST_ELECTROLYTIC:
		if (ElectrolyteAdjustmentOperation(state, tick)) {
			commnunication_flag.test_flag = 0;
			*state = 0;
		}
		break;
	default:
		break;
	}
}
void NeutralizationTreatment(uint32_t *tick) {
	if (g_neutralization_time_s
			>= g_timerSetting.t33_t63_neutralizationStartTime_h * 60 * 60) {
		g_machine_state.neutrlization = 1;
		O_NEUTRALIZE_PIN_SV7 = ON;
		g_neutralization_time_s = 0;
	}
	if (ns_delay_ms(tick,
			g_timerSetting.t34_t64_neutralizationOpenTime_s * 1000)
			&& (g_machine_state.neutrlization != 0)) {
		O_NEUTRALIZE_PIN_SV7 = ON;
		g_machine_state.neutrlization = 0;
	}

}
void main_loop_20211111(void) {
	measureFlowSensor_nostop();
	DrainageMode_nostop();
	ElectrolyzeWaterGeneration_nostop();
	CallanCleaningMode_nostop();
	NormalMode_nostop();
}

/**
 * 30/11/2021: Checked by An
 */
void electrolyticOperationON(void) {
	//Electrolytic operation ON
	O_SUPPLY_WATER_PIN_SV1 = ON;
	O_CVCC_ON_PIN = ON;
	O_PUMP_SALT_PIN_SP1 = ON; //SP1
	g_machine_state.electrolyteOperation = 1;
	g_TimeKeeper.electrolyteOff_h = 0;
	g_TimeKeeper.neutralization =
			g_TimeKeeper.neutralization == 0 ?
					g_systemTime : g_TimeKeeper.neutralization;
}
void isElectrolyticOperationOFF_nostop(void) {
	uint8_t *state = &g_machine_state.electrolyteOFF;
	uint32_t *tick = &g_Tick.tickElectrolyticOff;
	switch (*state) {
	case 0:
		// Set g_machine_state.electrolyteOFF = 1 to start OFF
		// This case run when electrolyte is ON or already OFF
		if (ns_delay_ms(tick, (uint32_t) 60000 * 60)
				&& g_machine_state.electrolyteOperation == 0) {
			sendToRasPi_u32(H_READ, MID_NIGHT, 0x00);
			g_TimeKeeper.electrolyteOff_h++;
		} else if (g_machine_state.electrolyteOperation == 1) {
			if (ns_delay_ms(&g_TimeKeeper.neutralization, 1000)) {
				g_neutralization_time_s++;
			}
			(*tick) = g_systemTime;
		}
		break;
	case 1:
		g_TimeKeeper.neutralization = 0;
		O_CVCC_ON_PIN = OFF;
		O_PUMP_SALT_PIN_SP1 = OFF; //SP1
		(*state)++;
		break;
	case 2:
		if (ns_delay_ms(tick,
				g_timerSetting.t5_electrolysisStopDelay_s * 1000)) {
			(*state) = 0;
			O_SUPPLY_WATER_PIN_SV1 = OFF;
			g_machine_state.electrolyteOperation = 0;
		}
		break;
	default:
		break;
	}

}
void realTimeResponse(void) {
	UpdateMachineStatus();
	RaspberryResponse_nostop();
	isElectrolyticOperationOFF_nostop();
	R_WDT_Restart();
	if (ns_delay_ms(&g_Tick.tickCustom[0], 200)) {
		P6_bit.no3 = ~P6_bit.no3;
	}
}

void UpdateMachineStatus(void) {
	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
		pre_machine_washing_mode = g_machine_state.mode;
	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN_FL1 == I_ON ? 1 : 0;
	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN_FL2 == I_ON ? 1 : 0;
	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN_FL3 == I_ON ? 1 : 0;
	g_mean_io_status.refined.AcidLowLevel =
	I_ACID_M_PIN_FL2 == I_ON ? g_mean_io_status.refined.AcidLowLevel : 0;
	g_mean_io_status.refined.AcidHighLevel =
	I_ACID_H_PIN_FL3 == I_ON ? g_mean_io_status.refined.AcidHighLevel : 0;

	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN_FL4 == I_ON ? 1 : 0;
	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN_FL5 == I_ON ? 1 : 0;
	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN_FL6 == I_ON ? 1 : 0;
	g_mean_io_status.refined.AlkalineLowLevel =
	I_ALKALI_M_PIN_FL5 == I_ON ? g_mean_io_status.refined.AlkalineLowLevel : 0;
	g_mean_io_status.refined.AlkalineHighLevel =
	I_ALKALI_H_PIN_FL6 == I_ON ? g_mean_io_status.refined.AlkalineHighLevel : 0;

	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;

	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	O_DRAIN_ACID_PIN_SV5;
	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	O_DRAIN_ALK_PIN_SV6;
	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN_SV7;

	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN_SP1;
}
