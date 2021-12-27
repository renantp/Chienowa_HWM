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
#include "EEPROM.h"
extern uint8_t rx_count;

#define NUMBER_SETTING_ADDRESS (0x000)
#define TIME_SETTING_ADDRESS (0x800)
#define ON	(1U)
#define OFF (0U)
#define I_ON (0U)
#define I_OFF (1U)
#define GPIO_ON (1U)
#define GPIO_OFF (0U)
#define WATER_HAMER_TIME_MS (10)
#define DETECT_U I_HS_ODA_PIN
#define DETECT_D I_HS_OCL_PIN

#define O_HS_IDA_PIN	(P1_bit.no5)
#define O_HS_ICL_PIN	(P1_bit.no6)
#define O_SUPPLY_WATER_PIN_SV1 (P1_bit.no7) // Valve SV1

#define O_CTRL_OUT_PIN	(P3_bit.no1)

#define I_SALT_LID_PIN	(P5_bit.no2) // Cap salt tank sensor
#define I_SALT_H_PIN 		(P5_bit.no3) // High level salt sensor FL8
#define I_SALT_L_PIN 		(P5_bit.no4) // Low level salt sensor FL7
#define O_SPOUT_WATER_PIN_SV2	(P5_bit.no5) // Valve SV2

#define O_PUMP_SALT_PIN	(P6_bit.no0) // Pump SP
#define O_PUMP_ALK_PIN	(P6_bit.no1) // Pump P2
#define O_PUMP_ACID_PIN	(P6_bit.no2) // Pump P1
#define O_PUMP_PRESS_PIN	(P6_bit.no3) // Pressurized Pump (J37)
#define O_ALARM_OUT_PIN	(P6_bit.no4)
#define O_NEUTRALIZE_PIN	(P6_bit.no5)
#define O_DRAIN_ALK_PIN_SV6	(P6_bit.no6) // Valve SV6
#define O_DRAIN_ACID_PIN_SV7	(P6_bit.no7) // Valve SV7

#define I_ALKALI_L_PIN	(P0_bit.no5) // Low level Alkali sensor FL4
#define I_ALKALI_M_PIN	(P0_bit.no6) // Medium level Alkali sensor FL5
#define I_ALKALI_H_PIN	(P7_bit.no0) // High level Alkali sensor FL6
#define I_ACID_L_PIN		(P7_bit.no1) // Low level Acid sensor FL1
#define I_ACID_M_PIN		(P7_bit.no2) // Medium level Acid sensor FL2
#define I_ACID_H_PIN		(P7_bit.no3) // High level Acid sensor FL3
#define I_HS_OCL_PIN		(P7_bit.no4) // HandSensor (Gesture) Clock Pin
#define I_HS_ODA_PIN		(P7_bit.no5) // HandSensor (Gesture) Data pin
#define O_SPOUT_ACID_PIN_SV3	(P7_bit.no6) // Valve SV3
#define O_SPOUT_ALK_PIN_SV4	(P7_bit.no7) // Valve SV4

#define O_CVCC_ON_PIN		(P14_bit.no2) // CVCC On
#define I_CVCC_ALARM_IN	(P0_bit.no4)
#define O_CVCC_ALARM_RS	(P13_bit.no0)
#define I_FLOW_PLUSE_PIN	(P0_bit.no1)
#define O_RS485_MODE_PIN	(P0_bit.no0)

#define O_CS_LAN_PIN		(P4_bit.no2)
#define O_RST_LAN_PIN		(P4_bit.no1)
#define I_INT_LAN_PIN		(P13_bit.no7)

#define OPTION_1_PIN_SV8	(P11_bit.no0) //SV8
#define OPTION_2_PIN_SV9	(P11_bit.no1) //SV9
#define OPTION_3_PIN	(P14_bit.no6)
#define OPTION_4_PIN	(P14_bit.no7)
#define OPTION_5_PIN	(P10_bit.no0)
#define OPTION_6_PIN	(P15_bit.no3)

#define FLOW_PULSE_PIN	(P0_bit.no1)

extern struct Timer_Setting_s{
	uint32_t t1_initialWaterDrainageOperation_s;
	uint32_t t2_flowSensorStartTime_s; // 4 byte
	uint32_t t3_flowSensorMonitorTime_s; // 4 byte
	uint32_t t4_electrolysisOperationStart_s;
	uint32_t t5_electrolysisStopDelay_s;
	uint32_t t6_drainageOffTime_h; // 4 byte
	uint32_t t7_powerOnPreparation_s;
	uint32_t t8_flowRateAdjustmentRelease_s;
	uint32_t t9_currentAdjustmentRelease_s;
	uint32_t t10_electrolysisCurrentAlarmSpecified_s;
	uint32_t t11_overVoltage1Time_s; // 4 byte
	uint32_t t12_overVoltage2Time_s;
	uint32_t t13_overVoltage3Time_s;
	uint32_t t14_lowVoltageStartTime_s;
	uint32_t t15_lowVoltageDelayTime_s;
	uint32_t t16_currentMonitoringStart_s;
	uint32_t t17_solenoidLeakageStartTime_s;
	uint32_t t18_fullWaterMonitoringStart_h;
	uint32_t t19_waterFilterAlarm_h;
	uint32_t t20_waterFilterAlarmIgnore_h;
	uint32_t t26_onDelayEmptyLevel_s;
	uint32_t t27_onDelayLowLevel_s;
	uint32_t t28_onDelayHighLevel_s;
	uint32_t t30_offDelayEmptyLevel_s;
	uint32_t t31_saltLowLevelDelay_s;
	uint32_t t32_saltHighLevelDelay_s;
	uint32_t t51_alkalineWaterSpoutingTime_s;
	uint32_t t52_acidWaterSpoutingTime_s;
	uint32_t t53_washingWaterSpoutingTime_s;
	uint32_t t54_overLapTime_ms;
	uint32_t t55_waterDischargeDelay_s;
	uint32_t t56_acidWaterDownTime_s;
	uint32_t t59_alkalineWaterDownTime_s;
	uint32_t t61_curranCleaningIntervalTime_h;
	uint32_t t62_callanWashSpoutingTime_s;
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
	float cvccCurrent;
	char crc;
}g_numberSetting;

/**
 * IO_Status Union content:
 *  - Input/Output of  MCU
 *  - Machine mode
 *  - Flow sensor value (l/minutes)
 */
extern union IO_Status_u{
	struct{
		uint8_t AlkalineEmptyLevel: 1;
		uint8_t AlkalineLowLevel: 1;
		uint8_t AlkalineHighLevel: 1;
		uint8_t AcidEmptyLevel: 1;
		uint8_t AcidLowLevel: 1;
		uint8_t AcidHighLevel: 1;
		uint8_t SaltLowLevel: 1;
		uint8_t SaltHighLevel: 1;

		struct{
			uint8_t SV1: 1;
			uint8_t SV2: 1;
			uint8_t SV3: 1;
			uint8_t SV4: 1;
			uint8_t SV5: 1;
			uint8_t SV6: 1;
			uint8_t SV7: 1;
			uint8_t SV8: 1;

			uint8_t SV9: 1;
			uint8_t RSVD: 7; //	Reserved
		}Valve; // 2 byte

		uint8_t Pump1: 1;
		uint8_t Pump2: 1;
		uint8_t SaltPump: 1;
		uint8_t RSVD1: 4; // Reserved

		uint8_t MachineMode; //1 byte

		float FlowValue; // 4 bytes
		float CVCCVoltage; // 4 bytes
		float CVCCCurrent; // 4 bytes
	}refined;
}g_io_status, g_pre_io_status;

extern union Alarm_Flag_u{
	struct{
		uint8_t overVoltage1 : 1;
		uint8_t overVoltage2 : 1;
		uint8_t overVoltage3 : 1;
		uint8_t overCurrent : 1;
		uint8_t overFlow : 1;
		uint8_t underVoltage : 1;
		uint8_t underCurrent : 1;

		uint8_t cvcc : 1;
		uint8_t underFlow : 1;
	}refined;
}g_alarm;


enum Machine_Mode_e{
	INDIE, HAND_WASHING, WATER_WASHING, ACID_WASHING, ALKALINE_WASHING,
	TEST_MODE, POWER_ON_MODE, BUSY, ELECTROLYTIC_GENERATION
};


extern struct Tick_s{
	uint32_t tick500ms;
	uint32_t tick1s;
	uint32_t tick5s;
	uint32_t tickBlink;
	uint32_t tickAlkaline;
	uint32_t tickAcid;
	uint32_t tickWater;
	uint32_t tickHandWash;
	uint32_t tickWaterSupply;
	uint32_t tickFlowMeasurment;
	uint32_t tickDebouceHandSensor;
	uint32_t tickVoltage1Check;
	uint32_t tickVoltage2Check;
	uint32_t tickVoltage3Check;
	uint32_t tickVoltageLowCheck;
	uint32_t tickCurrentCheck;
	uint32_t tickElectrolyticOff;
	uint32_t tickAcidLevel[3];
	uint32_t tickAlkalineLevel[3];
	uint32_t tickHandSensor[2];
	uint32_t tickCustom[8]; //Use: 6,7 in Callan
}g_Tick;
static struct Tick_Keeper_s{
	uint32_t SV1_ON_minutes;
	uint32_t SV1_OFF_minutes;
	uint32_t SV2_ON_minutes;
	uint32_t SV2_OFF_minutes;
	uint32_t neutralization;
}g_TickKeeper;
enum Control_status{
	OK_ALL, OK_USER, READ_TIME, READ_NUMBER, FLOW_SENSOR_ERROR, OVER_VOLTAGE_1, OVER_VOLTAGE_2, OVER_VOLTAGE_3, UNDER_VOLTAGE,
	CURRENT_ABNORMAL, OVER_CURRENT, SOLENOID_VALVE_ERROR, SALT_WATER_FULL_ERROR, SALT_WATER_EMPTY_ERROR,
	ACID_ERROR, ALKALINE_ERROR, WATER_FULL_ERROR, WATER_EMPTY_ERROR, CVCC_ALARM, NEXT_ANIMATION, SAVE_TIME, SAVE_NUMBER, SAVE_ERROR, READ_MACHINE_STATUS,
	WASHING_MODE, GET_MODE
};
extern struct Machine_State_u{
	uint8_t akaline;
	uint8_t acid;
	uint8_t water;
	uint8_t handwash;
	uint8_t waterSupply;
	uint8_t flowSensor;
	/**
	 * 0 - Non user
	 * 1 - Valid
	 * 2 - Guest
	 * 3 - Root
	 */
	uint8_t user;
	/**
	 * Mode:
	 * 0 - Indie-Mode
	 * 1 - Hand Wash Mode
	 * 2 - Water Mode
	 * 3 - Acid Mode
	 * 4 - Alkaline Mode
	 * 5 - Test Mode
	 * 6 - Power On Mode
	 * 7 - Busy
	 * 8 - Electrolytic Water Generation (Control OFF)
	 */
	uint8_t mode;
}g_machine_state;
static uint8_t pre_machine_mode;

extern struct UART_Buffer_s{
	uint8_t head; // 1 byte
	uint8_t set_number; // 1 byte
	float set_value; // 4 byte
}g_control_buffer;
enum UART_header_e{
	 H_READ =	82, //0x52
	 H_SET = 	83,
	 H_ALARM = 	65,
	 H_ERROR = 	69,
	 H_CLEAR = 	67
};

//static struct Timer_Setting_s _settingTime;
//static struct Number_Setting_s _settingNumber;
extern uint8_t g_machine_mode;
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
extern void adc_int_handle(void);

extern void setting_default(void);
extern void main_init_20211111(void);
void sendToRasPi(enum UART_header_e head, enum Control_status type, float value);
void sendRS485(uint8_t busy, uint8_t head, uint8_t type, uint32_t value);
void sendR485_7byte(uint8_t addr, uint8_t head, uint8_t *val);
extern void callAlarm(int _error);


void overVoltage1Error(void);

extern uint8_t g_rx_data[4*40];
extern uint8_t g_uart3_rx_data[8];
static uint8_t * const rs485_rx_p = &g_uart3_rx_data[1];
static uint32_t * const water_solfner_time_p = (uint32_t *)&g_uart3_rx_data[2];
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
extern volatile struct Communicaition_flag_s{
	volatile uint8_t send_response_flag, send_response_time_flag,
	send_response_number_flag, recived_number_setting_flag,
	recived_time_setting_flag, send_respone_status_flag, send_response_mode_flag,
	alarm_clear_flag;
	volatile uint8_t rs485_send_to_watersolfner_response_flag, rs485_send_to_watersolfner_SV1_flag,
	rs485_send_to_valve_response_flag, rs485_get_valve_gesture_flag,
	rs485_fault;
}commnunication_flag;
extern volatile uint8_t send_response_flag, send_response_time_flag,
send_response_number_flag, recived_number_setting_flag,
recived_time_setting_flag,
send_respone_status_flag;
extern uint8_t g_handsensor_status[2];
void OpenSV1(void);
void OpenSV2(void);
void CloseSV1(void);
void CloseSV2(void);
uint8_t electrolyticOperationOFF(void);
void electrolyticOperationON(void);
uint8_t readHS(void);
void handSensorLED(enum HS_COLOR color);
void sendToRasPi(enum UART_header_e head, enum Control_status type, float value);
/* End user code. Do not edit comment generated here */
#endif
