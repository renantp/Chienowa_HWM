/*
 * main.c
 *
 *  Created on: 29 Oct 2021
 *      Author: Renan
 */

#include "r_cg_macrodriver.h"
#include "r_cg_userdefine.h"
#include "usr_setting_sheet.h"
#include "usr_timer.h"
#include "r_cg_cgc.h"
#include "r_cg_port.h"
#include "r_cg_serial.h"
#include "r_cg_adc.h"
#include "r_cg_timer.h"
#include "r_cg_wdt.h"
#include "main.h"

#define VCC (24.0)

struct Timer_Setting_s g_timerSetting = { 1000, 15 };
struct Number_Setting_s g_numberSetting;
uint32_t g_neutralization_time_s;
enum HS_COLOR g_color, g_pre_color;
float g_flow_value;
union Alarm_Flag_u g_alarm;
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

void handSensorLED(enum HS_COLOR color) {
	g_color = color;
	if (g_color != g_pre_color) {
		switch (color) {
		case RED:
			O_HS_ICL_PIN = 1;
			O_HS_IDA_PIN = 0;
			break;
		case BLUE:
			O_HS_ICL_PIN = 0;
			O_HS_IDA_PIN = 0;
			break;
		case WHITE:
			O_HS_ICL_PIN = 0;
			O_HS_IDA_PIN = 1;
			break;
		default:
			O_HS_ICL_PIN = 1;
			O_HS_IDA_PIN = 1;
			break;
		}
		g_pre_color = g_color;
	}
}
void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
		g_color = g_color == color ? BLACK : color;
		handSensorLED(g_color);
	}
}
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

uint8_t isAcidTankFull(void) {
	if (I_ACID_H_PIN == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
				g_timerSetting.t28_onDelayHighLevel_s * 1000)
				|| (g_mean_io_status.refined.AcidHighLevel == 1)) {
			g_mean_io_status.refined.AcidHighLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[0] = g_systemTime;
		g_mean_io_status.refined.AcidHighLevel = 0;
	}
	return 0;
}
uint8_t isAcidTankAlmostFull(void) {
	if (I_ACID_M_PIN == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
				g_timerSetting.t27_onDelayLowLevel_s * 1000)
				|| (g_mean_io_status.refined.AcidLowLevel == 1)) {
			g_mean_io_status.refined.AcidLowLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[1] = g_systemTime;
		g_mean_io_status.refined.AcidLowLevel = 0;
	}
	return 0;
}
uint8_t isAcidTankHasSomething(void) {
	if (I_ACID_L_PIN == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.AcidEmptyLevel == 1)) {
			g_mean_io_status.refined.AcidEmptyLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[2] = g_systemTime;
		isAcidTankEmpty();
	}
	return 0;
}
uint8_t isAcidTankEmpty(void) {
	if (I_ACID_L_PIN == I_OFF) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.AcidEmptyLevel == 0)) {
			g_mean_io_status.refined.AcidEmptyLevel = 0;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[3] = g_systemTime;
		isAcidTankHasSomething();
	}
	return 0;
}
uint8_t isAlkalineTankFull(void) {
	if (I_ALKALI_H_PIN == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
				g_timerSetting.t28_onDelayHighLevel_s * 1000)
				|| (g_mean_io_status.refined.AlkalineHighLevel == 1)) {
			g_mean_io_status.refined.AlkalineHighLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[0] = g_systemTime;
		g_mean_io_status.refined.AlkalineHighLevel = 0;
	}
	return 0;
}
uint8_t isAlkalineTankAlmostFull(void) {
	if (I_ALKALI_M_PIN == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
				g_timerSetting.t27_onDelayLowLevel_s * 1000)
				|| (g_mean_io_status.refined.AlkalineLowLevel == 1)) {
			g_mean_io_status.refined.AlkalineLowLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[1] = g_systemTime;
		g_mean_io_status.refined.AlkalineLowLevel = 0;
	}
	return 0;
}
uint8_t isAlkalineTankHasSomething(void) {
	if (I_ALKALI_L_PIN == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 1)) {
			g_mean_io_status.refined.AlkalineEmptyLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[2] = g_systemTime;
		isAlkalineTankEmpty();
	}
	return 0;
}
uint8_t isAlkalineTankEmpty(void) {
	if (I_ALKALI_L_PIN == I_OFF) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 0)) {
			g_mean_io_status.refined.AlkalineEmptyLevel = 0;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[3] = g_systemTime;
		isAlkalineTankHasSomething();
	}
	return 0;
}

//----------------------Begin code 11112021--------------------------------------
void sendToRasPi_f(enum UART_header_e head, enum Control_status type,
		float value) {
	uint8_t state = g_uart2_sendend;
	g_control_buffer_f.head = head;
	g_control_buffer_f.set_number = type;
	g_control_buffer_f.set_value = value;
	R_UART2_Send((uint8_t*) &g_control_buffer_f, 6);
	while (state == g_uart2_sendend)
		;
}
void sendToRasPi_u32(enum UART_header_e head, enum Control_status type,
		uint32_t value) {
	uint8_t state = g_uart2_sendend;
	g_control_buffer_u32.head = head;
	g_control_buffer_u32.set_number = type;
	g_control_buffer_u32.set_value = value;
	R_UART2_Send((uint8_t*) &g_control_buffer_u32, 6);
	while (state == g_uart2_sendend)
		;
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
 * Handle all response to Raspberry command.
 */
uint8_t *const time_setting_p = (uint8_t*) &_settingTime;
uint8_t *const number_setting_p = (uint8_t*) &_settingNumber;
struct UART_Buffer_float_s test_control_buf = { H_READ, READ_TIME, 0x000000ff };
void RaspberryResponse_nostop(void) {
	//TODO: I'm doing here
	if (commnunication_flag.send_response_flag) {
		uint8_t state = g_uart2_sendend;
		if (g_machine_state.user == 2) {
			g_machine_state.user = 1;
		}
		R_UART2_Send(g_rx_data, 6);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		commnunication_flag.send_response_flag = 0;
	}
	if (commnunication_flag.send_response_mode_flag == 1) {
		sendToRasPi_u32(H_READ, WASHING_MODE,
				(uint32_t) g_machine_mode << (8 * 3));
//		sendToRasPi_u32(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
		commnunication_flag.send_response_mode_flag = 0;
	}
	if (commnunication_flag.send_response_status_flag) {
		uint8_t state = g_uart2_sendend;
		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		commnunication_flag.send_response_status_flag = 0;
	}else if(commnunication_flag.recieve_status_flag == 2){
		uint8_t *const _io_p = (uint8_t *)&g_res_io_status;
		for(uint8_t i = 0; i < 5; i++){
			_io_p[i] = g_rx_data[i];
		}
		for (uint8_t i = 5; i < io_statusSize - 1; i++){

			switch (i % 4) {
			case 3:
				_io_p[i - 3] = g_rx_data[i];
				break;
			case 2:
				_io_p[i - 1] = g_rx_data[i];
				break;
			case 1:
				_io_p[1 + i] = g_rx_data[i];
				break;
			case 0:
				_io_p[3 + i] = g_rx_data[i];
				break;
			default:
				break;
			}
		}
		commnunication_flag.recieve_status_flag = 0;
	}
	if (commnunication_flag.send_response_time_flag) {
		uint8_t state = g_uart2_sendend;
		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
				timeSettingSize - 1);
		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		commnunication_flag.send_response_time_flag = 0;
	}
	if (commnunication_flag.send_response_number_flag) {
		uint8_t state = g_uart2_sendend;
		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
				numberSettingSize - 1);
		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		commnunication_flag.send_response_number_flag = 0;
	}
	if (commnunication_flag.recived_time_setting_flag == 2) {
//		//Do not Edit this, must keep!!!!
		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
			switch (i % 4) {
//			case 3:
//				pointer0[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
//				break;
//			case 2:
//				pointer0[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
//				break;
//			case 1:
//				pointer0[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
//				break;
//			case 0:
//				pointer0[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
//				break;
//			default:
//				break;
			case 3:
				time_setting_p[i - 3] = g_rx_data[i];
				break;
			case 2:
				time_setting_p[i - 1] = g_rx_data[i];
				break;
			case 1:
				time_setting_p[1 + i] = g_rx_data[i];
				break;
			case 0:
				time_setting_p[3 + i] = g_rx_data[i];
				break;
			default:
				break;
			}
		}
		_settingTime.crc = g_rx_data[timeSettingSize - 1];
		if (g_rx_data[timeSettingSize - 1]
				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
			g_timerSetting = _settingTime;
			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
					timeSettingSize);
			sendToRasPi_f(H_SET, OK_ALL, 0x0);
		} else {
			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
		}
//		sendToRasPi(H_SET, OK_ALL, 0x0);
		commnunication_flag.recived_time_setting_flag = 0;
	}

	if (commnunication_flag.recived_number_setting_flag == 2) {
//		//Do not Edit this, must keep!!!!
		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
			switch (i % 4) {
			case 3:
				number_setting_p[i - 3] = g_rx_data[i];
				break;
			case 2:
				number_setting_p[i - 1] = g_rx_data[i];
				break;
			case 1:
				number_setting_p[1 + i] = g_rx_data[i];
				break;
			case 0:
				number_setting_p[3 + i] = g_rx_data[i];
				break;
			default:
				break;
			}
		}
		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
				numberSettingSize - 1);
		if (g_rx_data[numberSettingSize - 1]
				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
			sendToRasPi_f(H_SET, OK_ALL, 0x0);
			g_numberSetting = _settingNumber;
			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
					numberSettingSize);
			sendToRasPi_f(H_SET, OK_ALL, 0x0);
		} else {
			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
		}
//		sendToRasPi(H_SET, OK_ALL, 0x0);
		commnunication_flag.recived_number_setting_flag = 0;
	}
}
/**
 * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
 * 13/12/2021: Checked!
 * @return: 0 - Done; 1 - Not done
 */
uint8_t InitialOperationModeStart_nostop(void) {
//	O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7; // Turn on SV5 if ACID tank empty
//	O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6; // Turn on SV6 if ALK tank empty
	O_DRAIN_ACID_PIN_SV5 = isAcidTankEmpty() ? OFF : ON;
	O_DRAIN_ALK_PIN_SV6 = isAlkalineTankEmpty() ? OFF : ON;
//	return (!isAcidTankEmpty() || !isAcidTankEmpty());
	return !(O_DRAIN_ACID_PIN_SV5 == OFF && O_DRAIN_ALK_PIN_SV6 == OFF);
}
///**
// * FlowSensorCheck
// * 30/11/2021: Checked!
// * @return 0 is Error, 1 is OK, 2 Still taking
// */
//uint8_t FlowSensorCheck(uint32_t *_time) {
////	g_flow_value = measureFlowSensor();
//	if ((g_flow_value < g_numberSetting.upperFlow)
//			& (g_flow_value > g_numberSetting.lowerFlow)) {
//		return 1;
//	} else {
//		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
//		return 0;
//	}
//}
/**
 * WaterSupplyOperation
 * 30/11/2021: Checked by An
 */
uint8_t WaterSupplyOperation_nostop(void) {
	uint8_t *state = &g_machine_state.waterSupply;
	uint32_t *tick = &g_Tick.tickWaterSupply;
	switch (*state) {
	case 0:
		*tick = g_systemTime;
		(*state)++;
		break;
	case 1:
		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
		if (ns_delay_ms(tick, 30000)) {
			(*state)++;
		}
		break;
	case 2:
		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
		if (ns_delay_ms(tick, 500)) {
			(*state)++;
			g_Tick.tickFlowMeasurment = g_systemTime;
		}
		break;
	case 3:
		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
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
		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
				|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
			(*state) = 3;
			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
					g_io_status.refined.FlowValue);
		} else
			(*state)++;
		g_Tick.tickWaterSupply = g_systemTime;
		break;
	case 6:
		if (ns_delay_ms(&g_Tick.tickWaterSupply,
				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
			(*state)++;
		}
		break;
	default:
		(*state) = 0;
		break;
	}
	R_WDT_Restart();
//	if (*state == 6 + 1) {
//		g_machine_state.flowSensor = 0;
//		*state = 0;
//		return 0;
//	} else
//		return 1;
	return (*state) == 0 ? 0 : 1;
}
void stop_waitAlarmConfirm(enum Control_status alarm, uint8_t timeout_s) {
	uint32_t _tick = g_systemTime;
	while (commnunication_flag.alarm_clear_flag != alarm) {
		realTimeResponse();
		if ((ns_delay_ms(&_tick, timeout_s * 1000)) && (timeout_s != 0)) {
			break;
		}
	}
	commnunication_flag.alarm_clear_flag = 0;
}
uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	if (commnunication_flag.alarm_clear_flag != alarm) {
		return 1;
	}
	commnunication_flag.alarm_clear_flag = OK_ALL;
	return 0;
}
void resetAlarm(void) {
	commnunication_flag.alarm_clear_flag = 1;
}

/**
 * Alarm once when voltage fail. Stop until voltage valid.
 * 30/11/2021: Checked by An
 * @return 0 - OK; 1 - Error
 */
uint8_t Voltage1Check_waitReset(void) {
	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
			resetAlarm();
			sendToRasPi_f(H_ALARM, OVER_VOLTAGE_1,
					g_io_status.refined.CVCCVoltage);
			g_alarm.refined.overVoltage1 = 1;
			electrolyticOperationOFF();
			stop_waitAlarmConfirm(OVER_VOLTAGE_1, 0);
			g_alarm.refined.overVoltage1 = 0;
			return 1;
		}
	} else
		g_Tick.tickVoltage1Check = g_systemTime;
	return 0;
}
/**
 * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
 * 16/12/2021: Checked by An
 * @return 0 - OK
 */
void Voltage2Check_nostop(void) {
	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
			if (!(g_io_status.refined.CVCCVoltage
					>= g_numberSetting.upperVoltage1)) {
				resetAlarm();
				g_alarm.refined.overVoltage2 = 1;
				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
						g_io_status.refined.CVCCVoltage);
			}
		}
	} else {
		g_Tick.tickVoltage2Check = g_systemTime;
		g_alarm.refined.overVoltage2 = 0;
	}
}
/**
 * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
 * 16/12/2021: Checked by An
 * @return 0 - OK; 1 - Error
 */
uint8_t Voltage3Check_waitReset(void) {
	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
			if (!(g_io_status.refined.CVCCVoltage
					>= g_numberSetting.upperVoltage2)) {
				resetAlarm();
				g_alarm.refined.overVoltage3 = 1;
				g_Tick.tickElectrolyticOff = g_systemTime;
//				g_machine_state.electrolyteOFF =
//						g_machine_state.electrolyteOFF == 0 ?
//								1 : g_machine_state.electrolyteOFF;
				electrolyticOperationOFF();
				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
						g_io_status.refined.CVCCVoltage);
				stop_waitAlarmConfirm(OVER_VOLTAGE_3, 0);
				g_alarm.refined.overVoltage3 = 0;
				return 1;
			}
		}
	} else {
		g_Tick.tickVoltage3Check = g_systemTime;
	}
	return 0;
}
/**
 * Checked 16/12/2021
 * @return
 */
uint8_t LowVoltageCheck_waitReset(void) {
	if ((g_systemTime - g_TimeKeeper.neutralization
			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
				resetAlarm();
				g_alarm.refined.underVoltage = 1;
				g_Tick.tickElectrolyticOff = g_systemTime;
//				g_machine_state.electrolyteOFF =
//						g_machine_state.electrolyteOFF == 0 ?
//								1 : g_machine_state.electrolyteOFF;
				electrolyticOperationOFF();
				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
						g_io_status.refined.CVCCVoltage);
				stop_waitAlarmConfirm(UNDER_VOLTAGE, 0);
				g_alarm.refined.underVoltage = 0;
				return 1;
			}
		} else
			g_Tick.tickVoltageLowCheck = g_systemTime;
	} else
		g_Tick.tickVoltageLowCheck = g_systemTime;
	return 0;
}
uint8_t OverCurrentCheck_waitReset(void) {
	uint32_t _time_count = g_systemTime;
	const uint16_t _max_time = 10000;
	if (g_systemTime - g_TimeKeeper.neutralization >= 5000) {
		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
				|| (g_io_status.refined.CVCCCurrent
						>= g_numberSetting.upperCurrent)) {
			if ((g_alarm.refined.underCurrent == 0)
					&& (g_alarm.refined.overCurrent == 0)
					&& (g_io_status.refined.CVCCCurrent
							<= g_numberSetting.lowerCurrent)) {
				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
						g_io_status.refined.CVCCCurrent);
			}
			g_alarm.refined.underCurrent =
					g_io_status.refined.CVCCCurrent
							<= g_numberSetting.lowerCurrent ? 1 : 0;

			if (g_io_status.refined.CVCCCurrent
					>= g_numberSetting.upperCurrent) {
				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
					resetAlarm();
					g_alarm.refined.overCurrent = 1;
					g_Tick.tickElectrolyticOff = g_systemTime;
//					g_machine_state.electrolyteOFF =
//							g_machine_state.electrolyteOFF == 0 ?
//									1 : g_machine_state.electrolyteOFF;
					electrolyticOperationOFF();
					sendToRasPi_f(H_ALARM, OVER_CURRENT,
							g_io_status.refined.CVCCCurrent);
					stop_waitAlarmConfirm(OVER_CURRENT, 10);
					g_alarm.refined.overCurrent = 0;
					return 1;
				}
			} else {
				g_Tick.tickCurrentCheck = g_systemTime;
			}
		}
	}
	return 0;
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
//	WAIT_RESET: electrolyticOperationON();
//	g_Tick.tickVoltage1Check = g_systemTime;
//	g_Tick.tickVoltage2Check = g_systemTime;
//	g_Tick.tickVoltage3Check = g_systemTime;
//	g_Tick.tickVoltageLowCheck = g_systemTime;
//	g_Tick.tickCurrentCheck = g_systemTime;
//	do {
//		realTimeResponse();
//		if (Voltage1Check_waitReset())
//			goto WAIT_RESET;
//		Voltage2Check_nostop();
//		if (Voltage3Check_waitReset())
//			goto WAIT_RESET;
//		if (LowVoltageCheck_waitReset())
//			goto WAIT_RESET;
//		if (OverCurrentCheck_waitReset())
//			goto WAIT_RESET;
//		//----------CVCC Alarm Input-----------------
//		if (I_CVCC_ALARM_IN == I_ON) {
//			g_alarm.refined.cvcc = 1;
//			g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
//			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
//			stop_waitAlarmConfirm(CVCC_ALARM, 0);
//			g_alarm.refined.cvcc = 0;
//			goto WAIT_RESET;
//		}
//		R_WDT_Restart();
//	} while (!isAcidTankFull() || !isAlkalineTankFull());
//	g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
}
void solenoidCheck(void) {
	uint32_t _time_count = 0;
	if ((g_flow_value <= 0.1f)
			& (_time_count
					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
		_time_count++;
		delay_ms(1);
	}
	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
		sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	}
}
void saltWaterTankFullCheck(void) {
	if (I_SALT_H_PIN == 1) {
		sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
		g_Tick.tickElectrolyticOff = g_systemTime;
		g_machine_state.electrolyteOFF =
				g_machine_state.electrolyteOFF == 0 ?
						1 : g_machine_state.electrolyteOFF;
	}
}
void saltWaterTankEmptyCheck(void) {
	if (I_SALT_L_PIN == 0) {
		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	}
}
void acidWaterTankSkipCheck(void) {
	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
		sendToRasPi_f(H_ALARM, ACID_ERROR, 1);

	}
}
void alkalineWaterTankSkipCheck(void) {
	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
		sendToRasPi_f(H_ALARM, ALKALINE_ERROR, 1);
	}
}

uint8_t FilterReplacementCheck(void) {

	return 0;
}

/**
 * Tested: 10/12/2021 by Mr.An
 */
void WaterWashingMode_nostop(void) {
	uint8_t *state = &g_machine_state.water;
	uint32_t *tick = &g_Tick.tickWater;
	switch (*state) {
	case 0:
		g_machine_state.mode = WATER_WASHING;
		O_SPOUT_WATER_PIN_SV2 = ON;
		g_color = WHITE;
		*tick = g_systemTime;
		(*state)++;
		handSensorLED(g_color);
		break;
	case 1:
		if (ns_delay_ms(tick, 50)) {
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
			(*state)++;
		}
		break;
	case 2:
		if (DETECT_U == I_ON) {
			O_SPOUT_WATER_PIN_SV2 = OFF;
			g_color = BLACK;
			(*state) = 0;
			g_machine_state.mode = BUSY;
			handSensorLED(g_color);
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
		}
		break;
	default:
		(*state) = 0;
		break;
	}
}

/**
 * Tested: 24/12/2021 by Mr.An
 */
void HandWashingMode_nostop(void) {
	uint8_t *state = &g_machine_state.handwash;
	uint32_t *tick = &g_Tick.tickHandWash;
	const uint32_t delayPump_ms = 50;
	if ((*state) == 0) {
		g_timerSetting.t54_overLapTime_ms =
				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
		g_timerSetting.t54_overLapTime_ms =
				g_timerSetting.t54_overLapTime_ms > 1000 ?
						1000 : g_timerSetting.t54_overLapTime_ms;
	} else {
//		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
//			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
//		}
	}
	switch (*state) {
	case 0:
		*state = 1;
		*tick = g_systemTime;
		break;
	case 1:
		g_machine_state.mode = HAND_WASHING;
		O_SPOUT_ALK_PIN_SV4 = ON;
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ALK_PIN = ON;
			handSensorLED(BLUE);
			(*state)++;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
//			g_Tick.tickAnimation = g_systemTime;
//			g_machine_state.waitAnimationRes = 1;
		}
		break;
	case 2:
		if (ns_delay_ms(tick,
				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
						- g_timerSetting.t54_overLapTime_ms)) {
			O_PUMP_ALK_PIN = OFF;
			O_SPOUT_ACID_PIN_SV3 = ON;
			(*state)++;
		}
		break;
	case 3:
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ACID_PIN = ON;
			handSensorLED(RED);
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
			(*state)++;
		}
		break;
	case 4:
		if (ns_delay_ms(tick,
				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
			O_SPOUT_ALK_PIN_SV4 = OFF;
			(*state)++;
		}
		break;
	case 5:
		if (ns_delay_ms(tick,
				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
						- g_timerSetting.t54_overLapTime_ms)) {
			O_PUMP_ACID_PIN = OFF;
			handSensorLED(WHITE);
			O_SPOUT_WATER_PIN_SV2 = ON;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
			(*state)++;
		}
		break;
	case 6:
		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
			O_SPOUT_ACID_PIN_SV3 = OFF;
			(*state)++;
		}
		break;
	case 7:
		if (ns_delay_ms(tick,
				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
			O_SPOUT_WATER_PIN_SV2 = OFF;
			handSensorLED(BLACK);
			(*state) = 0;
			g_machine_state.mode = BUSY;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		}
		break;
	default:
		(*state) = 0;
		break;
	}

}
/**
 * Tested: 24/12/2021 by Mr.An
 */
void AcidWaterMode_nostop(void) {
	uint8_t *state = &g_machine_state.acid;
	uint32_t *tick = &g_Tick.tickAcid;
	const uint32_t delayPump_ms = 50;
	switch (*state) {
	case 0:
//		*state = DETECT_U == I_ON ? 1 : 0;
		g_machine_state.mode = ACID_WASHING;
		*state = 1;
		*tick = g_systemTime;
		break;
	case 1:
		O_SPOUT_ACID_PIN_SV3 = ON;
		g_color = RED;
		handSensorLED(g_color);
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ACID_PIN = ON;
			(*state)++;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		}
		break;
	case 2:
		//TODO: Change turn OFF signal here
		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
				|| (DETECT_U == I_ON)) {
			O_PUMP_ACID_PIN = OFF;
			(*state)++;
		}
		break;
	case 3:
		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
			O_SPOUT_ACID_PIN_SV3 = OFF;
			g_color = BLACK;
			handSensorLED(g_color);
			(*state)++;
		}
		break;
	default:
		g_machine_state.mode = BUSY;
		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		*state = 0;
		break;
	}
}
/**
 * Tested: 24/12/2021 by Mr.An
 */
void AlkalineWaterMode_nostop(void) {
	uint8_t *state = &g_machine_state.akaline;
	uint32_t *tick = &g_Tick.tickAlkaline;
	const uint32_t delayPump_ms = 50;
	switch (*state) {
	case 0:
//		*state = DETECT_U == I_ON ? 1 : 0;
		g_machine_state.mode = ALKALINE_WASHING;
		*state = 1;
		*tick = g_systemTime;
		break;
	case 1:
		O_SPOUT_ALK_PIN_SV4 = ON;
		g_color = BLUE;
		handSensorLED(g_color);
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ALK_PIN = ON;
			(*state)++;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		}
		break;
	case 2:
		//TODO: Change turn OFF signal here
		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
				|| (DETECT_U == I_ON)) {
			O_PUMP_ALK_PIN = OFF;
			(*state)++;
		}
		break;
	case 3:
		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
			O_SPOUT_ALK_PIN_SV4 = OFF;
			g_color = BLACK;
			handSensorLED(g_color);
			(*state)++;
		}
		break;
	default:
		g_machine_state.mode = BUSY;
		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		*state = 0;
		break;
	}
}

// Newest
void main_init_20211111(void) {
	UpdateMachineStatus();
	while (InitialOperationModeStart_nostop()) {
		RaspberryResponse_nostop();
		UpdateMachineStatus();
		R_WDT_Restart();
	}

	UpdateMachineStatus();
	while (WaterSupplyOperation_nostop()) {
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
			if (InitialOperationModeStart_nostop() == 0) {
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
	return (*state) == 2? 1:0;
}
uint8_t FlowRateAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick){
	measureFlowSensor_nostop();
	switch (*state) {
		case 2:
			O_SPOUT_WATER_PIN_SV2 = ON;
			(*state)++;
			(*tick) = g_systemTime;
			break;
		case 3:
			if(ns_delay_ms(tick, 30*1000)){
				O_SUPPLY_WATER_PIN_SV1 = ON;
				(*state)++;
			}
			break;
		case 4:
			if(ns_delay_ms(tick, 500)){
				(*state)++;
				O_SPOUT_WATER_PIN_SV2 = OFF;
			}
			break;
		case 5:
			if(ns_delay_ms(tick, (uint32_t)15*1000 + (uint32_t)10*60*1000)){
				(*state)++;
			}
			break;
		default:
			break;
	}
	return (*state) == 6 ? 1:0;
}
uint8_t CurrentAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick){
	switch (*state) {
		case 6:
			electrolyticOperationON();
			(*state)++;
			break;
		case 7:
			if(ElectrolyticOperation_nostop()){
				(*state)++;
				(*tick) = g_systemTime;
			}
			break;
		case 8:
			if(ns_delay_ms(tick, (uint32_t)15*1000 + (uint32_t)10*60*1000)){
				(*state)++;
			}
			break;
		default:
			break;
	}
	return (*state) == 9 ? 1:0;
}
uint8_t ElectrolyteAdjustmentOperation(uint8_t *state, uint32_t *tick){
	switch (*state) {
		case 9:
			electrolyticOperationON();
			(*state)++;
			break;
		case 10:
			if(isAcidTankFull() && isAlkalineTankFull()){
				electrolyticOperationOFF();
				(*tick) = g_systemTime;
				(*state)++;
			}
			break;
		case 11:
			if(ns_delay_ms(tick, (uint32_t)10*60*1000)){
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
			if(TestPowerOn_nostop_keepstate(state, &g_Tick.tickTestOperation)){
				commnunication_flag.test_flag = 0;
				*state = 0;
			}
			break;
		case TEST_FLOW_RATE:
			if(FlowRateAdjustmentMode_nostop_keepstate(state, tick)){
				commnunication_flag.test_flag = 0;
				*state = 0;
			}
			break;
		case TEST_CURRENT:
			if(CurrentAdjustmentMode_nostop_keepstate(state, tick)){
				commnunication_flag.test_flag = 0;
				*state = 0;
			}
			break;
		case TEST_INDIVIDUAL:

			break;
		case TEST_ELECTROLYTIC:
			if(ElectrolyteAdjustmentOperation(state, tick)){
				commnunication_flag.test_flag = 0;
				*state = 0;
			}
			break;
		default:
			break;
	}
}
void NeutralizationTreatment(uint32_t *tick){
	if(g_neutralization_time_s >= g_timerSetting.t33_t63_neutralizationStartTime_h*60*60){
		g_machine_state.neutrlization = 1;
		O_NEUTRALIZE_PIN_SV7 = ON;
		g_neutralization_time_s = 0;
	}
	if(ns_delay_ms(tick, g_timerSetting.t34_t64_neutralizationOpenTime_s*1000) && (g_machine_state.neutrlization != 0)){
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
			if(ns_delay_ms(&g_TimeKeeper.neutralization, 1000)){
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
float measureFlowSensor(uint32_t *s) {
	uint32_t stamp_flow_sensor = g_systemTime;
	float flow_pluse = 0.0;
	uint8_t flow_pulse_state = I_OFF;
	while (!ns_delay_ms(&stamp_flow_sensor, (*s) * 1000)) {
		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
			if (I_FLOW_PLUSE_PIN == 0)
				flow_pluse++;
			flow_pulse_state = I_FLOW_PLUSE_PIN;
		}
		R_WDT_Restart();
	}
	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*s); // L/minutes
	return g_io_status.refined.FlowValue;
}

uint8_t _pre_flow_state = I_OFF;
float _flow_pulse;
float measureFlowSensor_nostop(void) {
	uint8_t *state = &g_machine_state.flowSensor;
	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	switch (*state) {
	case 0:
		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
			(*state)++;
		}
		break;
	case 1:
		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
			_pre_flow_state = I_FLOW_PLUSE_PIN;
			if (I_FLOW_PLUSE_PIN == I_ON) {
				_flow_pulse++;
			}
		}
		if (ns_delay_ms(tick,
				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
			(*state)++;
		}
		break;
	case 2:
		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
				/ g_timerSetting.t3_flowSensorMonitorTime_s;
		_flow_pulse = 0;
		(*state) = 0;
		break;
	default:
		(*state) = 0;
		break;
	}
	return g_io_status.refined.FlowValue;
}
void UpdateMachineStatus(void) {
	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
		pre_machine_washing_mode = g_machine_state.mode;
	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	g_mean_io_status.refined.AcidLowLevel =
	I_ACID_M_PIN == I_ON ? g_mean_io_status.refined.AcidLowLevel : 0;
	g_mean_io_status.refined.AcidHighLevel =
	I_ACID_H_PIN == I_ON ? g_mean_io_status.refined.AcidHighLevel : 0;

	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	g_mean_io_status.refined.AlkalineLowLevel =
	I_ALKALI_M_PIN == I_ON ? g_mean_io_status.refined.AlkalineLowLevel : 0;
	g_mean_io_status.refined.AlkalineHighLevel =
	I_ALKALI_H_PIN == I_ON ? g_mean_io_status.refined.AlkalineHighLevel : 0;

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
