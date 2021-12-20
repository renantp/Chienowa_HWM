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
enum HS_COLOR g_color, g_pre_color;
float g_flow_value;
volatile uint8_t g_electrolytic_flag = 0;
union Alarm_Flag_u g_alarm;
struct Machine_State_u g_machine_state;
union IO_Status_u g_io_status, g_pre_io_status;
//const uint8_t io_statusSize = sizeof(union IO_Status_u);
const uint8_t io_statusSize = 5;
//const uint8_t timeSettingSize = sizeof(struct Timer_Setting_s);
const uint8_t timeSettingSize = 69;
//const uint8_t numberSettingSize = sizeof(struct Number_Setting_s);
const uint8_t numberSettingSize = 33;

//struct Tick_s g_Tick;

//void electrolyticOperationON(void);
//void electrolyticOperationOFF(void);
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
#ifdef RENAN_CODE
void renanCode(void){
	//Power On Mode
	O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	do{
		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN_SV7;	// Turn on SV5 if ACID tank empty
		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN_SV6;	// Turn on SV6 if ALK tank empty
		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
		R_WDT_Restart();
	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	O_DRAIN_ACID_PIN_SV7 = O_DRAIN_ALK_PIN_SV6 = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty

	// Drainage operation
	O_SPOUT_WATER_PIN_SV2 = ON;	// SV2 On
	delay(st[1]);			// Default 30 seconds
	O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	delay_ms(500);
	O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
}


void code_20211029(void){
	//---------------Electrolytic operation-----------------------------
	O_SUPPLY_WATER_PIN_SV1 = ON; //SV1
	O_CVCC_ON_PIN = ON;
	O_PUMP_SALT_PIN = ON; //SP1
	delay(10);
	//TODO: Neutralization timer On

	overVoltage1Error();
}
#endif


uint8_t isAcidHigh(void){
	if(g_io_status.refined.AcidHighLevel != g_pre_io_status.refined.AcidHighLevel){
		if(I_ACID_H_PIN == I_ON){
			if(ns_delay_ms(&g_Tick.tickAcidLevel[0], g_timerSetting.t28_onDelayHighLevel_s*1000)){
				g_pre_io_status.refined.AcidHighLevel = g_io_status.refined.AcidHighLevel;
				return 1;
			}
			return 0;
		}
	}else{
		g_Tick.tickAcidLevel[0] = g_systemTime;
	}
	return 0;
}
uint8_t isAcidLow(void){
	if(g_io_status.refined.AcidLowLevel != g_pre_io_status.refined.AcidLowLevel){
		if(I_ACID_M_PIN == I_ON){
			if(ns_delay_ms(&g_Tick.tickAcidLevel[1], g_timerSetting.t27_onDelayLowLevel_s*1000)){
				g_pre_io_status.refined.AcidLowLevel = g_io_status.refined.AcidLowLevel;
				return 1;
			}
			return 0;
		}
	}else{
		g_Tick.tickAcidLevel[1] = g_systemTime;
	}
	return 0;
}
uint8_t isAcidEmpty(void){
	if(g_io_status.refined.AcidEmptyLevel!= g_pre_io_status.refined.AcidEmptyLevel){
		if(I_ACID_L_PIN == I_ON){
			if(ns_delay_ms(&g_Tick.tickAcidLevel[2], g_timerSetting.t26_onDelayEmptyLevel_s*1000)){
				return 1;
			}
			return 0;
		}
	}else{
		g_Tick.tickAcidLevel[2] = g_systemTime;
	}
	return 0;
}

uint8_t isAlkalineHigh(void){
	if(g_io_status.refined.AlkalineHighLevel != g_pre_io_status.refined.AlkalineHighLevel){
		if(I_ALKALI_H_PIN == I_ON){
			if(ns_delay_ms(&g_Tick.tickAlkalineLevel[0], g_timerSetting.t28_onDelayHighLevel_s*1000)){
				g_pre_io_status.refined.AlkalineHighLevel = g_io_status.refined.AlkalineHighLevel;
				return 1;
			}
			return 0;
		}
	}else{
		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	}
	return 0;
}
uint8_t isAlkalineLow(void){
	if(g_io_status.refined.AlkalineLowLevel != g_pre_io_status.refined.AlkalineLowLevel){
		if(I_ALKALI_M_PIN == I_ON){
			if(ns_delay_ms(&g_Tick.tickAlkalineLevel[1], g_timerSetting.t27_onDelayLowLevel_s*1000)){
				g_pre_io_status.refined.AlkalineLowLevel = g_io_status.refined.AlkalineLowLevel;
				return 1;
			}
			return 0;
		}
	}else{
		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	}
	return 0;
}
uint8_t isAlkalineEmpty(void){
	if(g_io_status.refined.AlkalineEmptyLevel!= g_pre_io_status.refined.AlkalineEmptyLevel){
		if(I_ALKALI_L_PIN == I_ON){
			if(ns_delay_ms(&g_Tick.tickAlkalineLevel[2], g_timerSetting.t26_onDelayEmptyLevel_s*1000)){
				return 1;
			}
			return 0;
		}
	}else{
		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	}
	return 0;
}

//----------------------Begin code 11112021--------------------------------------
void sendToRasPi(enum UART_header_e head, enum Control_status type, float value) {
	uint8_t state = g_uart2_sendend;
	g_control_buffer.head = head;
	g_control_buffer.set_number = type;
	g_control_buffer.set_value = value;
	R_UART2_Send((uint8_t*) &g_control_buffer, sizeof(struct UART_Buffer_s));
	while (state == g_uart2_sendend)
		;
}
void sendToWaterSolfner(enum UART_header_e head, enum Control_status type,
		uint32_t value) {
	uint8_t state = g_uart3_sendend;
	g_control_buffer.head = head;
	g_control_buffer.set_number = type;
	g_control_buffer.set_value = value;
	R_UART3_Send((uint8_t*) &g_control_buffer, sizeof(struct UART_Buffer_s));
	while (state == g_uart3_sendend)
		;
}
void RaspberryResponse_nostop(void) {
	if (commnunication_flag.send_response_flag) {
		uint8_t state = g_uart2_sendend;
		R_UART2_Send(g_rx_data, 6);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		commnunication_flag.send_response_flag = 0;
	}
	if (commnunication_flag.send_respone_status_flag) {
		uint8_t state = g_uart2_sendend;
		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		commnunication_flag.send_respone_status_flag = 0;
	}
	if (commnunication_flag.send_response_time_flag) {
		uint8_t state = g_uart2_sendend;
		rx_count++;
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
		rx_count++;
		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
				numberSettingSize - 1);
		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		commnunication_flag.send_response_number_flag = 0;
	}
	if (commnunication_flag.recived_time_setting_flag == 2) {
		uint8_t *p = (uint8_t*) &_settingTime;
		//Do not Edit this, must keep!!!!
		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
			switch (i % 4) {
			case 4:
				p[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
				break;
			case 2:
				p[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
				break;
			case 1:
				p[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
				break;
			case 0:
				p[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
				break;
			default:
				break;
			}
		}
		_settingTime.crc = g_rx_data[timeSettingSize - 1];
		if (g_rx_data[timeSettingSize - 1]
				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 2)) {
			sendToRasPi(H_SET, OK_ALL, 0x0);
			g_timerSetting = _settingTime;
			EE_SPI_Write((uint8_t*) &g_timerSetting, 0x040,
					sizeof(g_timerSetting));
		} else {
			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
//				R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
		}
		commnunication_flag.recived_time_setting_flag = 0;
	}
	if (commnunication_flag.recived_number_setting_flag == 2) {
		uint8_t *p = (uint8_t*) &_settingNumber;
		//Do not Edit this, must keep!!!!
		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
//				p[i] = g_rx_data[i];
			switch (i % 4) {
			case 4:
				p[i - 3] = g_rx_data[i];
				break;
			case 2:
				p[i - 1] = g_rx_data[i];
				break;
			case 1:
				p[1 + i] = g_rx_data[i];
				break;
			case 0:
				p[3 + i] = g_rx_data[i];
				break;
			default:
				break;
			}
		}
		_settingNumber.crc = g_rx_data[numberSettingSize - 1];
		if (g_rx_data[numberSettingSize - 1]
				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 2)) {
			sendToRasPi(H_SET, OK_ALL, 0x0);
			g_numberSetting = _settingNumber;
			EE_SPI_Write((uint8_t*) &g_numberSetting, 0x000,
					sizeof(g_numberSetting));
		} else {
			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
//				R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
		}
		commnunication_flag.recived_number_setting_flag = 0;
	}
}
/**
 * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
 * 13/12/2021: Checked!
 */
void InitialOperationModeStart(void) {
	uint32_t _tick[2];
//	uint8_t pre_acid, pre_akaline;
	g_pre_io_status.refined.Valve.SV7 = O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7;	// Turn on SV5 if ACID tank NOT empty
	g_pre_io_status.refined.Valve.SV6 = O_DRAIN_ALK_PIN_SV6 =
	I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6;// Turn on SV6 if ALK tank NOT empty
	UpdateMachineStatus();
	while (1) {
		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7;// Turn on SV5 if ACID tank empty
		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6;// Turn on SV6 if ALK tank empty
		g_pre_io_status.refined.Valve.SV7 = I_ACID_L_PIN == I_ON ? ON : OFF;
		g_pre_io_status.refined.Valve.SV6 = I_ALKALI_L_PIN == I_ON ? ON : OFF;
		if (g_pre_io_status.refined.Valve.SV7 != O_DRAIN_ACID_PIN_SV7) {
			if (ns_delay_ms(&_tick[0], g_timerSetting.t26_onDelayEmptyLevel_s)) {
				O_DRAIN_ACID_PIN_SV7 = g_pre_io_status.refined.Valve.SV7;
			}
		} else
			_tick[0] = g_systemTime;
		if (g_pre_io_status.refined.Valve.SV6 != O_DRAIN_ALK_PIN_SV6) {
			if (ns_delay_ms(&_tick[1], g_timerSetting.t26_onDelayEmptyLevel_s)) {
				O_DRAIN_ALK_PIN_SV6 = g_pre_io_status.refined.Valve.SV6;
			}
		} else
			_tick[1] = g_systemTime;
		if ((O_DRAIN_ACID_PIN_SV7 == OFF) & (O_DRAIN_ALK_PIN_SV6 == OFF)) {
			break;
		}
		UpdateMachineStatus();
		R_WDT_Restart();
	}
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
uint8_t nostop_WaterSupplyOperation(void) {
	uint8_t *state = &g_machine_state.waterSupply;
	uint32_t *tick = &g_Tick.tickWaterSupply;
	switch (*state) {
	case 0:
		*tick = g_systemTime;
		(*state)++;
		break;
	case 1:
		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
		if (ns_delay_ms(&g_Tick.tickWaterSupply, 30000)) {
			(*state)++;
		}
		break;
	case 2:
		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
		if (ns_delay_ms(&g_Tick.tickWaterSupply, 500)) {
			(*state)++;
		}
		break;
	case 3:
		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
//			nostop_measureFlowSensor();
		if (ns_delay_ms(&g_Tick.tickWaterSupply, 15000)) {
			(*state)++;
		}
		break;
	case 4:
		measureFlowSensor();
		(*state)++;
		break;
	default:
		(*state) = 0;
		break;
	}
	R_WDT_Restart();
	return *state == 5 ? 0 : 1;
}
void stop_waitAlarmConfirm(enum Control_status alarm) {
	while ((g_rx_data[0] != H_CLEAR) & (g_rx_data[1] != alarm)) {
		R_WDT_Restart();
	}
	g_rx_data[0] = g_rx_data[1] = OK_ALL;
}
uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	if ((g_rx_data[0] != H_CLEAR) & (g_rx_data[1] != alarm)) {
		return 1;
	}
	g_rx_data[0] = g_rx_data[1] = OK_ALL;
	return 0;
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
			sendToRasPi(H_ALARM, OVER_VOLTAGE_1,
					(uint32_t) (g_io_status.refined.CVCCVoltage));
			electrolyticOperationOFF();
			g_alarm.refined.overVoltage1 = 1;
			stop_waitAlarmConfirm(OVER_VOLTAGE_1);
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
void Voltage2Check_loop(void) {
	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
			g_alarm.refined.overVoltage2 = 1;
			sendToRasPi(H_ALARM, OVER_VOLTAGE_2,
					g_io_status.refined.CVCCVoltage);
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
			g_alarm.refined.overVoltage3 = 1;
			sendToRasPi(H_ALARM, OVER_VOLTAGE_3,
					(uint32_t) (g_io_status.refined.CVCCVoltage));
			stop_waitAlarmConfirm(OVER_VOLTAGE_3);
			g_alarm.refined.overVoltage3 = 0;
			return 1;
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
	if ((g_systemTime - g_TickKeeper.neutralization
			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
				electrolyticOperationOFF();
				g_alarm.refined.underVoltage = 1;
				sendToRasPi(H_ALARM, UNDER_VOLTAGE,
						(uint32_t) (g_io_status.refined.CVCCVoltage));
				stop_waitAlarmConfirm(UNDER_VOLTAGE);
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
	const uint16_t _max_time = 60000;
	if (g_systemTime - g_TickKeeper.neutralization >= 5000) {
		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
				| (g_io_status.refined.CVCCCurrent
						>= g_numberSetting.upperCurrent)) {
			if ((g_alarm.refined.underCurrent == 0)
					& (g_alarm.refined.overCurrent == 0)) {
				sendToRasPi(H_ALARM, CURRENT_ABNORMAL,
						(uint32_t) (g_io_status.refined.CVCCCurrent));
				g_alarm.refined.underCurrent =
						g_io_status.refined.CVCCCurrent
								<= g_numberSetting.lowerCurrent ? 1 : 0;
			}
			if (g_io_status.refined.CVCCCurrent
					>= g_numberSetting.upperCurrent) {
				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
					g_alarm.refined.overCurrent = 1;
					sendToRasPi(H_ALARM, OVER_CURRENT,
							(uint32_t) (g_io_status.refined.CVCCCurrent));
					stop_waitAlarmConfirm(OVER_CURRENT);
					g_alarm.refined.overCurrent = 0;
					return 1;
				}
				R_WDT_Restart();
			} else
				g_Tick.tickCurrentCheck = g_systemTime;
		}
	}
	return 0;
}
void ElectrolyticOperation(void) {
	WAIT_RESET: electrolyticOperationON();
	do {
		if (Voltage1Check_waitReset())
			goto WAIT_RESET;
		Voltage2Check_loop();
		if (Voltage3Check_waitReset())
			goto WAIT_RESET;
		if (LowVoltageCheck_waitReset())
			goto WAIT_RESET;
		if (OverCurrentCheck_waitReset())
			goto WAIT_RESET;
		//----------CVCC Alarm Input-----------------
		if (I_CVCC_ALARM_IN == I_ON) {
			g_alarm.refined.cvcc = 1;
			electrolyticOperationOFF();
			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
			stop_waitAlarmConfirm(CVCC_ALARM);
			g_alarm.refined.cvcc = 0;
			goto WAIT_RESET;
		}
		R_WDT_Restart();
	} while ((I_ACID_H_PIN == I_OFF) | (I_ALKALI_H_PIN == I_OFF));
	electrolyticOperationOFF();
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
		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	}
}
void saltWaterTankFullCheck(void) {
	if (I_SALT_H_PIN == 1) {
		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
		electrolyticOperationOFF();
		//TODO: Fault in the flowchart
	}
}
void saltWaterTankEmptyCheck(void) {
	if (I_SALT_L_PIN == 0) {
		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
		//TODO: Control OFF
	}
}
void acidWaterTankSkipCheck(void) {
	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
		sendToRasPi(H_ALARM, ACID_ERROR, 1);
		//TODO: Control OFF
	}
}
void alkalineWaterTankSkipCheck(void) {
	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
		//TODO: Control OFF
	}
}

uint8_t FilterReplacementCheck(void) {

	return 0;
}
void ElectrolyzeWaterGeneration(void) {
	if ((I_ACID_L_PIN == I_OFF) | (I_ALKALI_L_PIN = I_OFF)) {
		g_machine_state.mode = ELECTROLYTIC_GENERATION;
		electrolyticOperationON();
	} else if ((I_ACID_H_PIN = I_ON) & (I_ALKALI_H_PIN = I_ON)) {
		g_machine_state.mode = pre_machine_mode;
		electrolyticOperationOFF();
	}
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
		break;
	case 1:
		if (DETECT_U == I_ON) {
			O_SPOUT_WATER_PIN_SV2 = OFF;
			g_color = BLACK;
			(*state)++;
			g_machine_state.mode = BUSY;
		}
		break;
	default:
		(*state) = 0;
		break;
	}
	handSensorLED(g_color);
}
/**
 * Tested: 10/12/2021 by Mr.An
 */
void HandWashingMode_nostop(void) {
	uint8_t *state = &g_machine_state.handwash;
	uint32_t *tick = &g_Tick.tickHandWash;
	const uint32_t delayPump_ms = 50;
	switch (*state) {
	case 0:
//			*state = DETECT_U == I_ON?1:0;
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
			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
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
			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
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
			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
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
			(*state)++;
			g_machine_state.mode = BUSY;
			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
		}
		break;
	default:
		g_machine_state.user = 0;
		(*state) = 0;
		break;
	}

}
/**
 * Tested: 10/12/2021 by Mr.An
 */
void AcidWaterMode_nostop(void) {
	uint8_t *state = &g_machine_state.acid;
	uint32_t *tick = &g_Tick.tickAcid;
	const uint32_t delayPump_ms = 50;
	switch (*state) {
	case 0:
		*state = DETECT_U == I_ON ? 1 : 0;
		*tick = g_systemTime;
		break;
	case 1:
		O_SPOUT_ACID_PIN_SV3 = ON;
		g_color = RED;
		handSensorLED(g_color);
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ACID_PIN = ON;
			(*state)++;
		}
		break;
	case 2:
		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
				| (DETECT_D == I_ON)) {
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
		*state = 0;
		break;
	}
}
/**
 * Tested: 10/12/2021 by Mr.An
 */
void AlkalineWaterMode_nostop(void) {
	uint8_t *state = &g_machine_state.akaline;
	uint32_t *tick = &g_Tick.tickAlkaline;
	const uint32_t delayPump_ms = 50;
	switch (*state) {
	case 0:
		*state = DETECT_U == I_ON ? 1 : 0;
		*tick = g_systemTime;
		break;
	case 1:
		O_SPOUT_ALK_PIN_SV4 = ON;
		g_color = BLUE;
		handSensorLED(g_color);
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ALK_PIN = ON;
			(*state)++;
		}
		break;
	case 2:
		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
				| (DETECT_D == I_ON)) {
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
		*state = 0;
		break;
	}
}

void CallanCleaningMode_nostop(void) {
	if ((g_TickKeeper.SV1_OFF_minutes
			>= g_timerSetting.t61_curranCleaningIntervalTime_h)
			& (g_TickKeeper.SV2_OFF_minutes
					>= g_timerSetting.t61_curranCleaningIntervalTime_h)) {
		g_callan_clear_flag = 1;
		g_Tick.tickCustom[6] = g_Tick.tickCustom[7] = g_systemTime;
		O_SPOUT_WATER_PIN_SV2 = ON;
	}
	if (g_callan_clear_flag) {
		if (ns_delay_ms(&g_Tick.tickCustom[6], 500)) {
			g_color = g_color == WHITE ? BLACK : WHITE;
			handSensorLED(g_color);
		}
		if (ns_delay_ms(&g_Tick.tickCustom[7],
				g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
			g_callan_clear_flag = 0;
			O_SPOUT_WATER_PIN_SV2 = OFF;
			g_color = BLACK;
			handSensorLED(g_color);
		}
	}
}
// Newest
void main_init_20211111(void) {

	UpdateMachineStatus();
	InitialOperationModeStart(); //Worked!!;

	UpdateMachineStatus();
	while (nostop_WaterSupplyOperation()) {
//		if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
//			P6_bit.no3 = ~P6_bit.no3;
//		}
	}
	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, g_io_status.refined.FlowValue);
	}

	UpdateMachineStatus();
	ElectrolyticOperation();
	UpdateMachineStatus();

}
void main_loop_20211111(void) {
	ElectrolyzeWaterGeneration();

//	WaterWashingMode_nostop();

}

/**
 * 30/11/2021: Checked by An
 */
void electrolyticOperationON(void) {
	//Electrolytic operation ON
	O_SUPPLY_WATER_PIN_SV1 = ON;
	O_CVCC_ON_PIN = ON;
	O_PUMP_SALT_PIN = ON; //SP1
	g_electrolytic_flag = 1;
	g_TickKeeper.neutralization =
			g_TickKeeper.neutralization == 0 ?
					g_systemTime : g_TickKeeper.neutralization;
	//TODO: Add Neutralization timer ON
}
/**
 * 30/11/2021: Checked by An, missing Neutralization timer OFF
 */
void electrolyticOperationOFF(void) {
	//TODO: Add Neutralization timer OFF
	g_TickKeeper.neutralization = 0;
	//Electrolytic operation OFF
	O_CVCC_ON_PIN = OFF;
	O_PUMP_SALT_PIN = OFF; //SP1
	delay(5);
	O_SUPPLY_WATER_PIN_SV1 = OFF;
	g_electrolytic_flag = 0;
}

float measureFlowSensor(void) {
	uint32_t stamp_flow_sensor = g_systemTime;
	float flow_pluse = 0.0;
	uint8_t flow_pulse_state = I_OFF;
	while (!ns_delay_ms(&stamp_flow_sensor,
			g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
			if (I_FLOW_PLUSE_PIN == 0)
				flow_pluse++;
			flow_pulse_state = I_FLOW_PLUSE_PIN;
		}
		R_WDT_Restart();
	}
	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000)
			/ g_timerSetting.t3_flowSensorMonitorTime_s; // L/minutes
	return g_io_status.refined.FlowValue;
}

uint8_t _pre_flow_state = I_OFF;
float _flow_pulse;
float nostop_measureFlowSensor(void) {
	uint8_t *state = &g_machine_state.flowSensor;
	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	switch (*state) {
	case 0:
		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s)) {
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
	if(g_machine_state.mode != ELECTROLYTIC_GENERATION)
		pre_machine_mode = g_machine_state.mode;
	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;

	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;

	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;

	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	O_DRAIN_ACID_PIN_SV7;
	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	O_DRAIN_ALK_PIN_SV6;
	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN;

	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN;
}
