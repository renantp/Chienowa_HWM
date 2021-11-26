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

float g_cvcc_current, g_cvcc_voltge;
enum Control_header g_alarm;
float g_flow_value;
uint32_t g_neutralization_time = 0;
volatile uint8_t g_electrolytic_flag = 0;

//void electrolyticOperationON(void);
//void electrolyticOperationOFF(void);

void setting_default(void){
	g_numberSetting.upperVoltage1 = 23.2;
	g_numberSetting.upperVoltage2 = 18.4;
	g_numberSetting.upperVoltage3 = 15.7;
	g_numberSetting.upperCurrent = 12.0;
	g_numberSetting.lowerCurrent = 4.0;
	g_numberSetting.upperFlow = 1.2;
	g_numberSetting.lowerFlow = 0.2;
	g_timerSetting.t2_flowSensorStartTime = 30000;
	g_timerSetting.t3_flowSensorMonitorTime = 23000;
	g_timerSetting.t11_overVoltage1Time = 10000;
	g_timerSetting.t12_overVoltage2Time = 10000;
	g_timerSetting.t13_overVoltage3Time = 20000;
	g_timerSetting.t17_solenoidLeakageStartTime = 5000;
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
void sendToRasPi(enum UART_header_e head, enum Control_header type, float value){
	uint8_t state = g_uart2_send;
	g_control_buffer.head = head;
	g_control_buffer.set_number = type;
	g_control_buffer.set_value = value;
	R_UART2_Send((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	while(state == g_uart2_send);
}
void InitialOperationModeStart(void){
	OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	do{
		OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OPTION_1_PIN;	// Turn on SV5 if ACID tank empty
		OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OPTION_2_PIN;	// Turn on SV6 if ALK tank empty
		R_WDT_Restart();
	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
}
uint8_t FlowSensorCheck(void){
	delay(15);
	g_flow_value = measureFlowSensor(5);
	if((g_flow_value < g_numberSetting.upperFlow)
			&(g_flow_value > g_numberSetting.lowerFlow)){
		return 1;
	}else{
		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
		return 0;
	}
}
void WaterSupplyOperation(void){
	O_SPOUT_WATER_PIN = ON;		// SV2 On
	delay(30);
	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	delay_ms(500);
	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	while(FlowSensorCheck() != 1){
		//TODO: Adjust

	}
	delay(10);
}
void Voltage1Check(void){
	g_cvcc_voltge = (float)g_adc_value[1]/512;
	if(g_cvcc_voltge>=g_numberSetting.upperVoltage1){
		//Alarm
		electrolyticOperationOFF();
		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, 1);
		//TODO: Wait to reset
	}
}
void Voltage2Check(void){
	uint16_t _time_count = 0;
	do{
		_time_count = 0;
		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
			delay_ms(1);
			_time_count++;
			if(_time_count == g_timerSetting.t12_overVoltage2Time){
				sendToRasPi(H_ALARM, OVER_VOLTAGE_2, 1);
			}
			R_WDT_Restart();
		}
	}while(_time_count == g_timerSetting.t12_overVoltage2Time);
}
void Voltage3Check(void){
	uint16_t _time_count = 0;
	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
		delay_ms(1);
		_time_count++;
		if(_time_count == g_timerSetting.t13_overVoltage3Time){
			sendToRasPi(H_ALARM, OVER_VOLTAGE_3, 1);
			electrolyticOperationOFF();
			//TODO: Wait to reset
		}
		R_WDT_Restart();
	}

}
void LowVoltageCheck(void){
	electrolyticOperationON();
//	while(g_neutralization_time > 60000);
	delay(60);
	uint16_t _time_count = 0;
	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < g_timerSetting.t15_lowVoltageDelayTime)){
		delay_ms(1);
		_time_count++;
		if(_time_count == g_timerSetting.t15_lowVoltageDelayTime){
			sendToRasPi(H_ALARM, UNDER_VOLTAGE, 1);
			electrolyticOperationOFF();
			//TODO: Wait to reset
		}
		R_WDT_Restart();
	}

}
void LowCurrentCheck(void){
	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
		sendToRasPi(H_ALARM, CURRENT_INVALID, 1);
		uint16_t _time_count = 0;
		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < 10000)){
			delay_ms(1);
			_time_count++;
		}
		if(_time_count == 10000){
			sendToRasPi(H_ALARM, OVER_CURRENT, 1);
			electrolyticOperationOFF();
			//TODO: Wait to reset
		}
	}
}
void ElectrolyticOperation(void){
	do{
		O_SUPPLY_WATER_PIN = ON; //SV1
		O_CVCC_ON_PIN = ON;
		O_PUMP_SALT_PIN = ON; //SP1
		//-----------Voltage 1 check----------------
		Voltage1Check();
		//-----------Voltage 2 check----------------
		Voltage2Check();
		//-----------Voltage 3 check----------------
		Voltage3Check();
		//----------Low voltage error check--------------
		LowVoltageCheck();
		//----------Current Error check------------------
		LowCurrentCheck();
		//----------CVCC Alarm Input---------------------
		if(I_CVCC_ALARM_IN == 0U){
			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
			electrolyticOperationOFF();
			//TODO: Wait Reset
		}
	}while((I_ACID_H_PIN == 0)|(I_ALKALI_H_PIN == 0));
	O_CVCC_ON_PIN = GPIO_ON;
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
void waterTankFullCheck(void){
	electrolyticOperationOFF();
	//TODO: Hand Sensor Off

}
// Newest
void main_20211111(void){
	InitialOperationModeStart();
	WaterSupplyOperation();
	do{
		ElectrolyticOperation();
	}while((I_ALKALI_H_PIN == 0U)|(I_ACID_H_PIN == 0U));
	electrolyticOperationOFF();
	O_CVCC_ON_PIN = ON;
	O_PUMP_SALT_PIN = OFF; 		//SP1
	delay(5);
	O_SUPPLY_WATER_PIN = OFF;	// SV1 On
}

void waitReset(void){
	while(g_error != 0){
		R_WDT_Restart();
	}
}
void electrolyticOperationON(void){
	//Electrolytic operation ON
	O_CVCC_ON_PIN = ON;
	O_PUMP_SALT_PIN = ON; //SP1
	g_electrolytic_flag = 1;
}
void electrolyticOperationOFF(void){
	//Electrolytic operation OFF
	O_CVCC_ON_PIN = OFF;
	O_PUMP_SALT_PIN = OFF; //SP1
	g_electrolytic_flag = 0;
}
float measureFlowSensor(uint32_t s){
	uint32_t stamp_flow_sensor = g_systemTime;
	float flow_pluse = 0.0;
	uint8_t flow_pulse_state = 1;
	while(!ns_delay_ms(&stamp_flow_sensor, (s*1000))){
		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
			if(I_FLOW_PLUSE_PIN == 0)
				flow_pluse++;
			flow_pulse_state = I_FLOW_PLUSE_PIN;
		}
		R_WDT_Restart();
	}
	float flow_value = (flow_pluse*0.7*60)/(1000*s); // L/minutes
	return flow_value;
}
char CRC8(const char *data,int length)
{
   char crc = 0x00;
   char extract;
   char sum;
   for(int i=0;i<length;i++)
   {
      extract = *data;
      for (char tempI = 8; tempI; tempI--)
      {
         sum = (crc ^ extract) & 0x01;
         crc >>= 1;
         if (sum)
            crc ^= 0x8C;
         extract >>= 1;
      }
      data++;
   }
   return crc;
}
