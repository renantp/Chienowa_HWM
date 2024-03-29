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
* Copyright (C) 2011, 2021 Renesas Electronics Corporation. All rights reserved.
***********************************************************************************************************************/

/***********************************************************************************************************************
* File Name    : r_main.c
* Version      : CodeGenerator for RL78/G14 V2.05.06.02 [08 Nov 2021]
* Device(s)    : R5F104ML
* Tool-Chain   : CCRL
* Description  : This file implements main function.
* Creation Date: 8/23/2022
***********************************************************************************************************************/

/***********************************************************************************************************************
Includes
***********************************************************************************************************************/
#include "r_cg_macrodriver.h"
#include "r_cg_cgc.h"
#include "r_cg_port.h"
#include "r_cg_serial.h"
#include "r_cg_adc.h"
#include "r_cg_dac.h"
#include "r_cg_timer.h"
#include "r_cg_wdt.h"
#include "r_cg_rtc.h"
/* Start user code for include. Do not edit comment generated here */
#include "EEPROM.h"
#include "usr_timer.h"
#include "usr_setting_sheet.h"
#include "crc8.h"
#include "hwm/hwm_main.h"
#include "r_cg_userdefine.h"
#include <math.h>
/* End user code. Do not edit comment generated here */
#include "r_cg_userdefine.h"

/***********************************************************************************************************************
Pragma directive
***********************************************************************************************************************/
/* Start user code for pragma. Do not edit comment generated here */

//#define TESTING_FIRMWARE
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
Global variables and functions
***********************************************************************************************************************/
/* Start user code for global. Do not edit comment generated here */

volatile int g_adc_ch = 0;
union EEPROM_status_u g_e_status;
struct Number_Setting_s ret_number_setting;
uint8_t led_st = 0xff;
uint8_t flow_p, salt_h_p;
uint8_t g_eeprom_wren;
uint8_t send_data[2] = { 0x23, 0xab };
uint8_t receive_data[2];
struct Number_Setting_s receive_setting;
union EEPROM_status_u set;
uint32_t rx_data[3];
float data_f;
union byte_to_float data_f_test;
struct UART_Buffer_float_s g_control_buffer_f;
struct UART_Buffer_u32_s g_control_buffer_u32;
struct UART_Buffer_i32_s g_control_buffer_i32;

union {
	struct {
		uint8_t up_signal;
	};
	uint8_t status;
} handsensor_status;
uint8_t g_handsensor_status[2];
void nostop_checkHandSensor(void) {
	if (DETECT_U() == I_ON) {
		if (ns_delay_ms(&g_Tick.tickHandSensor[0], 500)) {
			g_handsensor_status[0] = g_handsensor_status[0] == 0 ? 1 : 0;
		}
	} else if (DETECT_D() == I_ON) {
		g_handsensor_status[1] = 1;
	} else if (DETECT_U() == I_OFF) {

	} else if (DETECT_D() == I_OFF) {

	}
}
uint8_t readHS(void) {
	if (DETECT_U()) {
		delay_ms(2);
		if (DETECT_U())
			return 1;
		return 0;
	} else
		return 0;
}

uint8_t this_size = sizeof(g_io_status);
uint8_t this_size_2 = sizeof(union IO_Status_u);
uint8_t send_buf[7] = { 8, 1, 2, 3, 4, 5, 6 };
char g_crc[8];
uint32_t g_crc_32[8];
uint32_t data_crc[2] = { 30500, 60200 };
uint8_t rx_count;
uint8_t dac_out[2] = { 0xff, 0xff };
uint8_t io_testsize;
/* End user code. Do not edit comment generated here */
void R_MAIN_UserInit(void);

/***********************************************************************************************************************
* Function Name: main
* Description  : This function implements main function.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
void main(void)
{
    R_MAIN_UserInit();
    /* Start user code. Do not edit comment generated here */

	//TODO: EEPROM Initialize and read Setting
	EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	EE_SPI_Read((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
			numberSettingSize);
	EE_SPI_Read((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
			timeSettingSize);
	EE_SPI_Read((uint8_t*) &g_control_setting.data,
	NUMBER_SETTING_ADDRESS + numberSettingSize, sizeof(g_control_setting.data));
	// Set to default valve
//	g_timerSetting.t1_initialWaterDrainageOperation_s > 180
	io_testsize = sizeof(g_io_status);
	if (isnan(g_numberSetting.saltPumpVoltage)) {
		manufactureReset();
	}
//	manufactureReset();
	_settingNumber = g_numberSetting;
	_settingTime = g_timerSetting;
	EEPROM_PROTECT_EN();
	//TODO: Start receive command from Raspberry Pi
	R_UART2_Receive(g_rx_data, 6);

	//TODO: Start receive data from RS485
	O_RS485_MODE_PIN = 1U;
	R_UART3_Receive(g_uart3_rx_data, 7);
	uint8_t wts, vpcb, vpcb_v = 1;
	sendRS485(0xff, 82, 2, 12);

	//TODO: Turn off Hand Sensor LED
	g_pre_color = BLUE;
	handSensorLED(BLACK);

	//TODO: Set default washing mode
	g_machine_mode = HAND_WASHING;
//    sendToRasPi_f(H_SET, OK_ALL, 0x0);

//TODO: Run Initialize Operation
	if (g_control_setting.raw.power_on == ON) {
		main_init_20211111();
	}
	//TODO: Output CVCC and Salt pump voltage
	CVCC_Current_Set(
			(uint8_t) (g_numberSetting.cvccCurrent/CVCC_MAX_VOLTAGE*255));
	Salt_Analog_Set(
			(uint8_t) (g_numberSetting.saltPumpVoltage/SALT_PUMP_MAX_VOLTAGE*255));

	while (1U) {

		realTimeResponse();
		main_loop_20211111();

		handSensorLED(g_color);
		UpdateMachineStatus();
//		if (g_uart2_fault == 1) {
//			R_UART2_Stop();
//			delay_ms(10);
//			R_UART2_Start();
//			g_uart2_fault = 0;
//		}

		// Communication with WaterSoftener
		if (g_commnunication_flag.rs485_send_to_watersolfner_response_flag) {
			sendRS485(0xff, 82, 2, 5);
//    		rx_count++;
			wts = 1; //Test flag = 1
			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 0;
		}
		if (g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag == 1) {
			// Sand to Water softener SV state
			sendRS485(0xff, 82, 24,
					(uint32_t) g_io_status.refined.io.Valve.SV1 == 1 ? 1 : 0);
			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 0;
		}
		// Test SV1 for Water Softener
		if (wts != 0) {
			if (ns_delay_ms(&g_Tick.tickWaterSoftenerPCB, 5000)) {
				if (wts == 1) {
					O_SUPPLY_WATER_PIN_SV1 = ON;
//					sendRS485(1, 82, 24,(uint32_t) 1);
//					sendRS485(0xff, 82, 24,(uint32_t) 1);
					wts = 2;
				} else {
					O_SUPPLY_WATER_PIN_SV1 = OFF;
//    				sendRS485(1, 82, 24,(uint32_t) 0);
//					sendRS485(0xff, 82, 24,(uint32_t) 0);
					wts = 0;
				}
			}
		} else {
			g_Tick.tickWaterSoftenerPCB = g_systemTime;
		}

		//---------------------------------Valve PCB------------------------------------
		if (g_commnunication_flag.rs485_send_to_valve_response_flag == 1) {
			// 0xff, 12, {Mode, Valve 1, Valve 2, Valve 3, 1}
			// 0 - Stand alone 1 - Control Valve
			uint8_t _b[5] = { vpcb_v, g_uart3_sendend % 2, g_systemTime % 2, 0,
					1 };
			sendR485_7byte(0xff, 12, _b);
			vpcb++;
			g_commnunication_flag.rs485_send_to_valve_response_flag = 0;
		} else if (g_commnunication_flag.rs485_get_valve_gesture_flag == 1) {
			uint8_t _b[5] = { 0, 1, 0, 0, 1 };
			sendR485_7byte(0xff, 1, _b);
			g_commnunication_flag.rs485_get_valve_gesture_flag = 0;
		}

		if (vpcb != 0) {
			if (ns_delay_ms(&g_Tick.tickValvePCB, 5000)) {
				vpcb_v = vpcb_v == 1 ? 0 : 1;
				vpcb = 0;
			}
		} else {
			g_Tick.tickValvePCB = g_systemTime;
		}

		//RS485 fault check
		if (g_commnunication_flag.rs485_fault == 1) {
			R_UART3_Stop();
			g_commnunication_flag.rs485_fault++;
			g_Tick.tickRS485 = g_systemTime;
		} else if (g_commnunication_flag.rs485_fault == 2) {
			if (ns_delay_ms(&g_Tick.tickRS485, 500)) {
				R_UART3_Start();
				R_UART3_Receive(g_uart3_rx_data, 7);
				g_commnunication_flag.rs485_fault = 0;
			}
		}
//--------------------------------- Testing code---------------------------------------------------------------

		flow_p = I_FLOW_PLUSE_PIN == 1 ? 1 : 0;
		if (ns_delay_ms(&g_Tick.tickCustom[1], 60000)) {

		}

		if (ns_delay_ms(&g_Tick.tick1s, 1000)) {
//			rx_count++;
//			O_PUMP_PRESS_PIN = ~O_PUMP_PRESS_PIN;
			led_st = led_st == 0 ? 0xff : 0x00;
			uint8_t state = g_uart2_sendend;
			g_crc[6] = crc8_4((uint8_t*) &g_timerSetting,
					sizeof(struct Timer_Setting_s) - 2);
			g_crc[7] = crc8_1((uint8_t*) &g_timerSetting,
					sizeof(struct Timer_Setting_s) - 2);
//			}
			if (led_st == 0x00) {

			} else {


			}
		}

//--------------------------------End testing code---------------------------------------------------------
		if ((g_machine_state.mode == WATER_WASHING)
				|| (g_machine_state.mode == INDIE)) {

		}
		R_WDT_Restart();
	}
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
* Function Name: R_MAIN_UserInit
* Description  : This function adds user code before implementing main function.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
void R_MAIN_UserInit(void)
{
    /* Start user code. Do not edit comment generated here */
	EI();
	R_TAU0_Create();
	R_SAU0_Create();
	R_SAU1_Create();
	R_UART1_Create();
	R_UART2_Create();
	R_UART3_Create();
	R_RTC_Create();
	R_PORT_Create_UserInit();
	R_CSI01_Create();
	R_CSI00_Create();

	R_TAU0_Channel0_Start();
	R_UART3_Start();
	R_UART1_Start();
	R_UART2_Start();
	R_CSI00_Start();
//    R_CSI01_Start();

	R_ADC_Create();
	R_ADC_Set_OperationOn();
	R_ADC_Start();

	R_DAC_Create();
//	CVCC_Current_Set(0x0);
//	Salt_Analog_Set(0x0);
	R_DAC0_Start();
	R_DAC1_Start();
	/* End user code. Do not edit comment generated here */
}

/* Start user code for adding. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
