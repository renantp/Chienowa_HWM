/***********************************************************************************************************************
* DISCLAIMER
* This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products.
* No other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
* applicable laws, including copyright laws. 
* THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING THIS SOFTWARE, WHETHER EXPRESS, IMPLIED
* OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY
* LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE FOR ANY DIRECT,
* INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR
* ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
* Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability 
* of this software. By using this software, you agree to the additional terms and conditions found by accessing the 
* following link:
* http://www.renesas.com/disclaimer
*
* Copyright (C) 2011, 2020 Renesas Electronics Corporation. All rights reserved.
***********************************************************************************************************************/

/***********************************************************************************************************************
* File Name    : r_cg_userdefine.h
* Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
* Device(s)    : R5F104ML
* Tool-Chain   : CCRL
* Description  : This file includes user definition.
* Creation Date: 30/11/2021
***********************************************************************************************************************/

#ifndef _USER_DEF_H
#define _USER_DEF_H

/***********************************************************************************************************************
User definitions
***********************************************************************************************************************/

/* Start user code for function. Do not edit comment generated here */
#include "crc8.h"
#define ON	(1U)
#define OFF (0U)
#define I_ON (0U)
#define I_OFF (1U)
#define GPIO_ON (1U)
#define GPIO_OFF (0U)

#define O_HS_IDA_PIN	(P1_bit.no5)
#define O_HS_ICL_PIN	(P1_bit.no6)
#define O_SUPPLY_WATER_PIN (P1_bit.no7) // Valve SV1

#define O_CTRL_OUT_PIN	(P3_bit.no1)

#define I_SALT_LID_PIN	(P5_bit.no2) // Cap salt tank sensor
#define I_SALT_H_PIN 		(P5_bit.no3) // High level salt sensor FL8
#define I_SALT_L_PIN 		(P5_bit.no4) // Low level salt sensor FL7
#define O_SPOUT_WATER_PIN	(P5_bit.no5) // Valve SV2

#define O_PUMP_SALT_PIN	(P6_bit.no0) // Pump SP
#define O_PUMP_ALK_PIN	(P6_bit.no1) // Pump P2
#define O_PUMP_ACID_PIN	(P6_bit.no2) // Pump P1
#define O_PUMP_PRESS_PIN	(P6_bit.no3) // Pressurized Pump (J37)
#define O_ALARM_OUT_PIN	(P6_bit.no4)
#define O_NEUTRALIZE_PIN	(P6_bit.no5)
#define O_DRAIN_ALK_PIN	(P6_bit.no6) // Valve SV6
#define O_DRAIN_ACID_PIN	(P6_bit.no7) // Valve SV7

#define I_ALKALI_L_PIN	(P0_bit.no5) // Low level Alkali sensor FL4
#define I_ALKALI_M_PIN	(P0_bit.no6) // Medium level Alkali sensor FL5
#define I_ALKALI_H_PIN	(P7_bit.no0) // High level Alkali sensor FL6
#define I_ACID_L_PIN		(P7_bit.no1) // Low level Acid sensor FL1
#define I_ACID_M_PIN		(P7_bit.no2) // Medium level Acid sensor FL2
#define I_ACID_H_PIN		(P7_bit.no3) // High level Acid sensor FL3
#define I_HS_OCL_PIN		(P7_bit.no4) // HandSensor (Gesture) Clock Pin
#define I_HS_ODA_PIN		(P7_bit.no5) // HandSensor (Gesture) Data pin
#define O_SPOUT_ACID_PIN	(P7_bit.no6) // Valve SV3
#define O_SPOUT_ALK_PIN	(P7_bit.no7) // Valve SV4

#define O_CVCC_ON_PIN		(P14_bit.no2) // CVCC On
#define I_CVCC_ALARM_IN	(P0_bit.no4)
#define O_CVCC_ALARM_RS	(P13_bit.no0)
#define I_FLOW_PLUSE_PIN	(P0_bit.no1)
#define O_RS485_MODE_PIN	(P0_bit.no0)

#define O_CS_LAN_PIN		(P4_bit.no2)
#define O_RST_LAN_PIN		(P4_bit.no1)
#define I_INT_LAN_PIN		(P13_bit.no7)

#define OPTION_1_PIN	(P11_bit.no0) //SV8
#define OPTION_2_PIN	(P11_bit.no1) //SV9
#define OPTION_3_PIN	(P14_bit.no6)
#define OPTION_4_PIN	(P14_bit.no7)
#define OPTION_5_PIN	(P10_bit.no0)
#define OPTION_6_PIN	(P15_bit.no3)

#define FLOW_PULSE_PIN	(P0_bit.no1)
static struct Tick_s{
	uint32_t tick1s;
	uint32_t tick500ms;
	uint32_t tick5s;
	uint32_t tickBlink;
	uint32_t tickCustom[8]; //Use: 6,7 in Callan
}g_Tick;
static struct Tick_Keeper_s{
	uint32_t SV1_ON_minutes;
	uint32_t SV1_OFF_minutes;
	uint32_t SV2_ON_minutes;
	uint32_t SV2_OFF_minutes;
}g_TickKeeper;
extern struct Timer_Setting_s{
	uint32_t t2_flowSensorStartTime; // 4 byte
	uint32_t t3_flowSensorMonitorTime; // 4 byte
	uint32_t t6_drainageOffTime; // 4 byte
	uint32_t t11_overVoltage1Time; // 4 byte
	uint32_t t12_overVoltage2Time;
	uint32_t t13_overVoltage3Time;
	uint32_t t14_lowVoltageStartTime;
	uint32_t t15_lowVoltageDelayTime;
	uint32_t t17_solenoidLeakageStartTime;
	uint32_t t51;
	uint32_t t52;
	uint32_t t53;
	uint32_t t54;
	uint32_t t56;
	uint32_t t59;
	uint32_t t61;
	uint32_t t62;
	char crc;
}g_timerSetting;
extern struct Number_Setting_s{
	float upperVoltage1;
	float upperVoltage2;
	float upperVoltage3;
	float lowerVoltage;
	float upperCurrent;
	float lowerCurrent;
	float upperFlow;
	float lowerFlow;
	char crc;
}g_numberSetting;
extern union Alarm_register{
	struct{
		uint8_t flow:1;
		uint8_t overvoltage:2; //0~3: OK-Over1-Over2-Over3
		uint8_t undervoltage:1;
		uint8_t current:1;
		uint8_t rsvd1:3;

		uint8_t solenoid:1;
		uint8_t water:1;
		uint8_t salt:2; //0~2: OK-Empty-Full
		uint8_t acid:1;
		uint8_t alka:1;
		uint8_t rsvd2:2;
	}refined;
	struct{
		uint8_t fristAlarm;
		uint8_t secondAlarm;
	}raw;
}g_alarm_u;
extern struct UART_Buffer_s{
	uint8_t head; // 1 byte
	uint8_t set_number; // 1 byte
	uint32_t set_value; // 4 byte
}g_control_buffer;
enum Control_status{
	OK_ALL, OK_USER, READ_TIME, READ_NUMBER, FLOW_SENSOR_ERROR, OVER_VOLTAGE_1, OVER_VOLTAGE_2, OVER_VOLTAGE_3, UNDER_VOLTAGE,
	CURRENT_ABNORMAL, OVER_CURRENT, SOLENOID_VALVE_ERROR, SALT_WATER_FULL_ERROR, SALT_WATER_EMPTY_ERROR,
	ACID_ERROR, ALKALINE_ERROR, WATER_FULL_ERROR, WATER_EMPTY_ERROR, CVCC_ALARM, NEXT_ANIMATION
};
enum UART_header_e{
	 H_READ =	82, //0x52
	 H_SET = 	83,
	 H_ALARM = 	65,
	 H_ERROR = 	69,
	 H_CLEAR = 	67
};
extern enum Control_status g_alarm;

static uint8_t g_callan_clear_flag;
extern volatile uint32_t g_systemTime;
extern volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end;
extern volatile uint8_t g_uart1_sendend;
extern volatile uint8_t g_uart2_fault, g_uart2_sendend;
extern volatile uint8_t g_uart3_sendend;
extern volatile uint8_t timer0_ch0_flag, timer0_ch1_flag, timer0_ch2_flag;
extern volatile int g_error, g_status;
extern float g_flow_value;
extern uint16_t g_adc_value[2];
extern float g_cvcc_current, g_cvcc_voltge;
extern uint8_t rec_buf[12];
extern void adc_int_handle(void);

extern void setting_default(void);
extern void main_20211111(void);
extern void sendToRasPi(enum UART_header_e head, enum Control_status type, float value);
extern float measureFlowSensor(uint32_t s);
//extern int overVoltage1Check(void);
extern void callAlarm(int _error);


void overVoltage1Error(void);

extern uint8_t g_rx_data[32];
union byte_to_float{
	struct{
		uint8_t b[4];
	}refined;
	float raw;
};
/* Hand Sensor Function */
enum HS_COLOR{
	BLACK, RED, WHITE, BLUE
};
extern enum HS_COLOR g_color, g_pre_color;
extern volatile uint8_t send_response_flag, send_response_time_flag, send_response_number_flag;
void OpenSV1(void);
void OpenSV2(void);
void CloseSV1(void);
void CloseSV2(void);
void electrolyticOperationOFF(void);
void electrolyticOperationON(void);
uint8_t readHS(void);
void handSensorLED(enum HS_COLOR color);
void sendToRasPi(enum UART_header_e head, enum Control_status type, float value);
/* End user code. Do not edit comment generated here */
#endif
