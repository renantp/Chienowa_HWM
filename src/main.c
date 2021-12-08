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

struct Timer_Setting_s g_timerSetting = {1000, 15};
struct Number_Setting_s g_numberSetting;
enum HS_COLOR g_color, g_pre_color;
float g_cvcc_current, g_cvcc_voltge;
enum Control_status g_alarm;
float g_flow_value;
uint32_t g_neutralization_time = 0;
volatile uint8_t g_electrolytic_flag = 0;

//void electrolyticOperationON(void);
//void electrolyticOperationOFF(void);
void handSensorLED(enum HS_COLOR color){
	g_color = color;
	if(g_color != g_pre_color){
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
void setting_default(void){
	g_numberSetting.upperVoltage1 = 4.3;
	g_numberSetting.upperVoltage2 = 2.7;
	g_numberSetting.upperVoltage3 = 1.2;
	g_numberSetting.lowerVoltage = 0.5;
	g_numberSetting.upperCurrent = 2.2;
	g_numberSetting.lowerCurrent = 0.5;
	g_numberSetting.upperFlow = 1.2;
	g_numberSetting.lowerFlow = 0.2;
    g_timerSetting.t2_flowSensorStartTime = 0x0000ffff;
    g_timerSetting.t3_flowSensorMonitorTime = 0x0000aaaa;
    g_timerSetting.t6_drainageOffTime = 1000;
	g_timerSetting.t11_overVoltage1Time = 1000;
	g_timerSetting.t12_overVoltage2Time = 2000;
	g_timerSetting.t13_overVoltage3Time = 5000;
	g_timerSetting.t14_lowVoltageStartTime = 5000; //60000
	g_timerSetting.t15_lowVoltageDelayTime = 2000;
	g_timerSetting.t17_solenoidLeakageStartTime = 5000;
	g_timerSetting.t51 = 1;
	g_timerSetting.t52 = 2;
	g_timerSetting.t53 = 3;
}
#ifdef RENAN_CODE
void renanCode(void){
	//Power On Mode
	O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	do{
		O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN;	// Turn on SV5 if ACID tank empty
		O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN;	// Turn on SV6 if ALK tank empty
		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
		R_WDT_Restart();
	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	O_DRAIN_ACID_PIN = O_DRAIN_ALK_PIN = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty

	// Drainage operation
	O_SPOUT_WATER_PIN = ON;	// SV2 On
	delay(st[1]);			// Default 30 seconds
	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	delay_ms(500);
	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
}


void code_20211029(void){
	//---------------Electrolytic operation-----------------------------
	O_SUPPLY_WATER_PIN = ON; //SV1
	O_CVCC_ON_PIN = ON;
	O_PUMP_SALT_PIN = ON; //SP1
	delay(10);
	//TODO: Neutralization timer On

	overVoltage1Error();
}
#endif

//----------------------Begin code 11112021--------------------------------------
void sendToRasPi(enum UART_header_e head, enum Control_status type, float value){
	uint8_t state = g_uart2_sendend;
	g_control_buffer.head = head;
	g_control_buffer.set_number = type;
	g_control_buffer.set_value = value;
	R_UART2_Send((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	while(state == g_uart2_sendend);
}
/**
 * InitialOperationModeStart
 * 30/11/2021: Checked!
 */
void InitialOperationModeStart(void){
	OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	do{
		OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OPTION_1_PIN;	// Turn on SV5 if ACID tank empty
		OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OPTION_2_PIN;	// Turn on SV6 if ALK tank empty
		R_WDT_Restart();
	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
}
/**
 * FlowSensorCheck
 * 30/11/2021: Checked!
 * @return 0 is Error, 1 is OK
 */
uint8_t FlowSensorCheck(uint32_t *_time){
	delay(15);
	g_flow_value = measureFlowSensor(*_time);
	if((g_flow_value < g_numberSetting.upperFlow)
			&(g_flow_value > g_numberSetting.lowerFlow)){
		return 1;
	}else{
		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
		return 0;
	}
}
/**
 * WaterSupplyOperation
 * 30/11/2021: Checked by An, need to test with Raspberry Pi Adjust alarm
 */
void WaterSupplyOperation(void){
	O_SPOUT_WATER_PIN = ON;		// SV2 On
	delay(30);
	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	delay_ms(500);
	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	while(FlowSensorCheck(&g_timerSetting.t3_flowSensorMonitorTime) != 1){
		//TODO: RasPi - Adjust
		uint32_t _flow = g_flow_value*1000; // mL/minutes
		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, _flow);
	}
	delay(10);
}
/**
 * Alarm once when voltage fail. Stop until voltage valid.
 * 30/11/2021: Checked by An
 * @return 0 - OK; 1 - Error
 */
uint8_t Voltage1Check(void){
	if(g_cvcc_voltge>=g_numberSetting.upperVoltage1){
		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, (uint32_t)(g_cvcc_voltge*1000));
		electrolyticOperationOFF();
		//TODO: Wait to reset
		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_VOLTAGE_1)){
			R_WDT_Restart();
		}
		return 1;
	}
	return 0;
}
/**
 * Alarm every g_timerSetting.t12_overVoltage2Time second until voltage valid.
 * 30/11/2021: Checked by An
 * @return 0 - OK
 */
void Voltage2Check(void){
	uint16_t _time_count = 0;
	do{
		_time_count = 0;
		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
			delay_ms(1);
			_time_count++;
			if(_time_count == g_timerSetting.t12_overVoltage2Time){
				sendToRasPi(H_ALARM, OVER_VOLTAGE_2, (uint32_t)(g_cvcc_voltge*1000));
			}
			R_WDT_Restart();
		}
	}while(_time_count == g_timerSetting.t12_overVoltage2Time);
}
/**
 * Alarm after g_timerSetting.t13_overVoltage3Time second. Turn OFF electrolytic and stop until valid.
 * 30/11/2021: Checked by An
 * @return 0 - OK; 1 - Error
 */
uint8_t Voltage3Check(void){
	uint16_t _time_count = 0;
	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
		delay_ms(1);
		_time_count++;
		R_WDT_Restart();
	}
	if(_time_count == g_timerSetting.t13_overVoltage3Time){
		sendToRasPi(H_ALARM, OVER_VOLTAGE_3, (uint32_t)(g_cvcc_voltge*1000));
		electrolyticOperationOFF();
		//TODO: Wait to reset
		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_VOLTAGE_3)){
			R_WDT_Restart();
		}
		return 1;
	}
	return 0;
}
uint8_t LowVoltageCheck(void){
	uint16_t _time_count = 0;
	electrolyticOperationON();
	while((g_systemTime - g_neutralization_time < g_timerSetting.t14_lowVoltageStartTime)){
		R_WDT_Restart();
	}
	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < g_timerSetting.t15_lowVoltageDelayTime)){
		delay_ms(1);
		_time_count++;
		R_WDT_Restart();
	}
	if(_time_count == g_timerSetting.t15_lowVoltageDelayTime){
		sendToRasPi(H_ALARM, UNDER_VOLTAGE, (uint32_t)(g_cvcc_voltge*1000));
		electrolyticOperationOFF();
		//TODO: Wait to reset
		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != UNDER_VOLTAGE)){
			R_WDT_Restart();
		}
		return 1;
	}
	return 0;
}
uint8_t OverCurrentCheck(void){
	uint16_t _time_count = 0;
	const uint16_t _max_time = 5000;
	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
		sendToRasPi(H_ALARM, CURRENT_ABNORMAL, (uint32_t)(g_cvcc_current*1000));
		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < _max_time)){
			delay_ms(1);
			_time_count++;
			R_WDT_Restart();
//			electrolyticOperationOFF();
		}
		if(_time_count >= _max_time){
			sendToRasPi(H_ALARM, OVER_CURRENT, (uint32_t)(g_cvcc_current*1000));
			electrolyticOperationOFF();
			//TODO: Wait to reset
			while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_CURRENT)){
				R_WDT_Restart();
			}
			return 1;
		}
	}
	return 0;
}
void ElectrolyticOperation(void){
	WAIT_RESET:
	electrolyticOperationON();
	do{
		if(Voltage1Check()) goto WAIT_RESET;
		Voltage2Check();
		if(Voltage3Check()) goto WAIT_RESET;
		if(LowVoltageCheck()) goto WAIT_RESET;
		if(OverCurrentCheck()) goto WAIT_RESET;
		//----------CVCC Alarm Input-----------------
		if(I_CVCC_ALARM_IN == I_ON){
			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
			electrolyticOperationOFF();
			//TODO: Wait Reset
			while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != CVCC_ALARM)){
				R_WDT_Restart();
			}
			goto WAIT_RESET;
		}
	}while((I_ACID_H_PIN == 0)|(I_ALKALI_H_PIN == 0));
	electrolyticOperationOFF();
}
void solenoidCheck(void){
	uint32_t _time_count = 0;
	if((g_flow_value <= 0.1f)&(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000)){
		_time_count++;
		delay_ms(1);
	}
	if(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000){
		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	}
}
void saltWaterTankFullCheck(void){
	if(I_SALT_H_PIN == 1){
		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
		electrolyticOperationOFF();
		//TODO: Fault in the flowchart
	}
}
void saltWaterTankEmptyCheck(void){
	if(I_SALT_L_PIN == 0){
		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
		//TODO: Control OFF
	}
}
void acidWaterTankSkipCheck(void){
	if(((I_ACID_L_PIN == 0)&((I_ACID_M_PIN == 1)|(I_ACID_H_PIN == 1)))|
			((I_ACID_M_PIN == 0)&(I_ACID_H_PIN == 1))){
		sendToRasPi(H_ALARM, ACID_ERROR, 1);
		//TODO: Control OFF
	}
}
void alkalineWaterTankSkipCheck(void){
	if(((I_ALKALI_L_PIN == 0)&((I_ALKALI_M_PIN == 1)|(I_ALKALI_H_PIN == 1)))|
			((I_ALKALI_M_PIN == 0)&(I_ALKALI_H_PIN == 1))){
		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
		//TODO: Control OFF
	}
}

void OpenSV1(void){
	O_SUPPLY_WATER_PIN = ON;
}
void CloseSV1(void){
	O_SUPPLY_WATER_PIN = OFF;
}
void OpenSV2(void){
	O_SPOUT_WATER_PIN = ON;
}
void CloseSV2(void){
	O_SPOUT_WATER_PIN = OFF;
}
uint8_t FilterReplacementCheck(void){

	return 0;
}
void ElectrolyzeWaterGeneration(void){
	if((I_ACID_L_PIN == I_OFF)|(I_ALKALI_L_PIN = I_OFF)){
		electrolyticOperationON();
	}else if((I_ACID_H_PIN = I_ON)&(I_ALKALI_H_PIN = I_ON)){
		electrolyticOperationOFF();
	}
}
void WaterWashingMode(void){
	uint8_t _state = 0;
	if(readHS() == 1){
		O_SPOUT_WATER_PIN = ON;
		g_color = WHITE;
		handSensorLED(g_color);
		_state = 1;
	}
	while(readHS() == 1) R_WDT_Restart();
	if(_state){
		delay(2);
		O_SPOUT_WATER_PIN = OFF;
		g_color = BLACK;
		handSensorLED(g_color);
	}
}
void HandWashingMode(void){
	uint8_t *flag = &g_machine_flag.handwash;
	uint32_t *tick = &g_Tick.tickHandWash;
	const uint32_t delayPump_ms = 50;
	switch (*flag) {
		case 0:
			*flag = readHS() == 1?1:0;
			*tick = g_systemTime;
			break;
		case 1:
			O_SPOUT_ALK_PIN = ON;
			g_color = BLUE;
			handSensorLED(g_color);
			if(ns_delay_ms(tick, delayPump_ms)){
				O_PUMP_ALK_PIN = ON;
				sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
				(*flag)++;
			}
			break;
		case 2:
			if(ns_delay_ms(tick, (g_timerSetting.t51 - g_timerSetting.t54)*1000)){
				O_PUMP_ACID_PIN = ON;
				(*flag)++;
			}
			break;
		case 3:
			if(ns_delay_ms(tick, WATER_HAMER_TIME_MS)){
				O_SPOUT_ACID_PIN = OFF;
				g_color = BLACK;
				handSensorLED(g_color);
				(*flag)++;
			}
			break;
		default:
			*flag = 0;
			break;
	}
//	uint8_t _state = 0;
//	const uint32_t _waterHamerTime = 1000;
//	if(readHS() == 1){
//		_state = 1;
//		g_color = BLUE;
//		handSensorLED(g_color);
//		O_SPOUT_ALK_PIN = ON;
//		delay_ms(10);
//		O_PUMP_ALK_PIN = ON;
//		delay_ms(g_timerSetting.t51 - g_timerSetting.t54);
//		g_color = RED;
//		handSensorLED(g_color);
//		O_SPOUT_ACID_PIN = ON;
//		delay_ms(10);
//		O_PUMP_ACID_PIN = ON;
//		delay_ms(g_timerSetting.t54);
//		O_PUMP_ALK_PIN = OFF;
//		delay_ms(_waterHamerTime);
//		O_SPOUT_ALK_PIN = OFF;
//		delay_ms(g_timerSetting.t52 - g_timerSetting.t54);
//		g_color = WHITE;
//		handSensorLED(g_color);
//		O_SPOUT_WATER_PIN = ON;
//		delay_ms(g_timerSetting.t54);
//		O_PUMP_ACID_PIN = OFF;
//		delay_ms(_waterHamerTime);
//		O_SPOUT_ACID_PIN = OFF;
//		delay_ms(g_timerSetting.t53 - g_timerSetting.t54);
//		O_SPOUT_WATER_PIN = OFF;
//	}
//	while(readHS() == 1) R_WDT_Restart();
//	if(_state == 1){
//		g_color = BLACK;
//		handSensorLED(g_color);
//	}
}
void AcidWaterMode(void){
	uint8_t *flag = &g_machine_flag.acid;
	uint32_t *tick = &g_Tick.tickAcid;
	const uint32_t delayPump_ms = 50;
	switch (*flag) {
		case 0:
			*flag = readHS() == 1?1:0;
			*tick = g_systemTime;
			break;
		case 1:
			O_SPOUT_ACID_PIN = ON;
			g_color = RED;
			handSensorLED(g_color);
			if(ns_delay_ms(tick, delayPump_ms)){
				O_PUMP_ACID_PIN = ON;
				(*flag)++;
			}
			break;
		case 2:
			if(ns_delay_ms(tick, g_timerSetting.t56*1000)&(readHS() == 1)){
				O_PUMP_ACID_PIN = OFF;
				(*flag)++;
			}
			break;
		case 3:
			if(ns_delay_ms(tick, WATER_HAMER_TIME_MS)){
				O_SPOUT_ACID_PIN = OFF;
				g_color = BLACK;
				handSensorLED(g_color);
				(*flag)++;
			}
			break;
		default:
			*flag = 0;
			break;
	}
}
void nostop_AlkalineWaterMode(void){
	uint8_t *flag = &g_machine_flag.akaline;
	uint32_t *tick = &g_Tick.tickAlkaline;
	const uint32_t delayPump_ms = 50;
	switch (*flag) {
		case 0:
			*flag = readHS() == 1?1:0;
			*tick = g_systemTime;
			break;
		case 1:
			O_SPOUT_ALK_PIN = ON;
			g_color = BLUE;
			handSensorLED(g_color);
			if(ns_delay_ms(tick, delayPump_ms)){
				O_PUMP_ALK_PIN = ON;
				(*flag)++;
			}
			break;
		case 2:
			if(ns_delay_ms(tick, g_timerSetting.t56*1000)&(readHS() == 1)){
				O_PUMP_ALK_PIN = OFF;
				(*flag)++;
			}
			break;
		case 3:
			if(ns_delay_ms(tick, WATER_HAMER_TIME_MS)){
				O_SPOUT_ALK_PIN = OFF;
				g_color = BLACK;
				handSensorLED(g_color);
				(*flag)++;
			}
			break;
		default:
			*flag = 0;
			break;
	}
}
void nostop_CallanCleaningMode(void){
	if((g_TickKeeper.SV1_OFF_minutes >= g_timerSetting.t61) &
			(g_TickKeeper.SV2_OFF_minutes >= g_timerSetting.t61)){
		g_callan_clear_flag = 1;
		g_Tick.tickCustom[6] = g_Tick.tickCustom[7] = g_systemTime;
		O_SPOUT_WATER_PIN = ON;
	}
	if(g_callan_clear_flag){
		if(ns_delay_ms(&g_Tick.tickCustom[6], 500)){
			g_color = g_color == WHITE ? BLACK:WHITE;
			handSensorLED(g_color);
		}
		if(ns_delay_ms(&g_Tick.tickCustom[7], g_timerSetting.t62*1000)){
			g_callan_clear_flag = 0;
			O_SPOUT_WATER_PIN = OFF;
			g_color = BLACK;
			handSensorLED(g_color);
		}
	}
}
// Newest
void main_20211111(void){
	InitialOperationModeStart();
	WaterSupplyOperation();
	ElectrolyticOperation();

//	Test section
//	electrolyticOperationON();
//	delay_ms(500);
//	Voltage1Check();
//	Voltage2Check();
//	Voltage3Check();
//	LowVoltageCheck();
//	if(OverCurrentCheck() == 0) electrolyticOperationOFF();
}
void main_20211111_while(void){
	ElectrolyzeWaterGeneration();
	WaterWashingMode();

}

/**
 * 30/11/2021: Checked by An, missing Neutralization timer ON
 */
void electrolyticOperationON(void){
	//Electrolytic operation ON
	O_SUPPLY_WATER_PIN = ON;
	O_CVCC_ON_PIN = ON;
	O_PUMP_SALT_PIN = ON; //SP1
	g_electrolytic_flag = 1;
	g_neutralization_time = g_neutralization_time == 0 ? g_systemTime:g_neutralization_time;
	//TODO: Add Neutralization timer ON
}
/**
 * 30/11/2021: Checked by An, missing Neutralization timer OFF
 */
void electrolyticOperationOFF(void){
	//TODO: Add Neutralization timer OFF
	g_neutralization_time = 0;
	//Electrolytic operation OFF
	O_CVCC_ON_PIN = OFF;
	O_PUMP_SALT_PIN = OFF; //SP1
	delay(5);
	O_SUPPLY_WATER_PIN = OFF;
	g_electrolytic_flag = 0;

}
/**
 *
 * @param s: Period time take measurement in mills second
 * @return L/minutes
 */
float measureFlowSensor(uint32_t s){
	uint32_t stamp_flow_sensor = g_systemTime;
	float flow_pluse = 0.0;
	uint8_t flow_pulse_state = 1;
	while(!ns_delay_ms(&stamp_flow_sensor, s)){
		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
			if(I_FLOW_PLUSE_PIN == 0)
				flow_pluse++;
			flow_pulse_state = I_FLOW_PLUSE_PIN;
		}
		R_WDT_Restart();
	}
	float flow_value = (flow_pluse*0.7*60)/s; // L/minutes
	return flow_value;
}

