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
* File Name    : r_main.c
* Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
* Device(s)    : R5F104ML
* Tool-Chain   : CCRL
* Description  : This file implements main function.
* Creation Date: 30/11/2021
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
#include "main.h"
/* End user code. Do not edit comment generated here */
#include "r_cg_userdefine.h"

/***********************************************************************************************************************
Pragma directive
***********************************************************************************************************************/
/* Start user code for pragma. Do not edit comment generated here */
#define CVCC_Current_Set(a) R_DAC0_Set_ConversionValue(a)
#define Salt_Analog_Set(a) R_DAC1_Set_ConversionValue(a)
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
Global variables and functions
***********************************************************************************************************************/
/* Start user code for global. Do not edit comment generated here */
volatile int g_error = 0;
volatile int g_adc_ch = 0;
union EEPROM_status_u g_e_status;
struct Number_Setting_s ret_number_setting;
uint8_t led_st = 0xff;
uint8_t flow_p, salt_h_p;
uint8_t g_eeprom_wren;
uint8_t send_data[2] = { 0x23, 0xab};
uint8_t receive_data[2];
struct Number_Setting_s receive_setting;
union EEPROM_status_u set;
uint32_t rx_data[3];
float data_f;
union byte_to_float data_f_test;
struct UART_Buffer_s g_control_buffer;

union {
	struct{
		uint8_t up_signal;
	};
	uint8_t status;
}handsensor_status;
uint8_t g_handsensor_status[2];
void nostop_checkHandSensor(void){
	if(DETECT_U == I_ON){
		if(ns_delay_ms(&g_Tick.tickHandSensor[0], 500)){
			g_handsensor_status[0] = g_handsensor_status[0] == 0? 1:0;
		}
	}else if(DETECT_D == I_ON){
		g_handsensor_status[1] = 1;
	}else if(DETECT_U == I_OFF){

	}else if(DETECT_D == I_OFF){

	}
}
uint8_t readHS(void){
   if(DETECT_U){
	  delay_ms(2);
      if(DETECT_U) return 1;return 0;
   }else return 0;
}
uint8_t this_size = sizeof(g_io_status);
uint8_t this_size_2 = sizeof(union IO_Status_u);
uint8_t rec_buf[12];
uint8_t send_buf[7] = {8,1,2,3,4,5,6};
char g_crc[8];
uint32_t g_crc_32[8];
uint32_t data_crc[2] = {30500, 60200};
uint8_t rx_count;
uint8_t dac_out[2] = {0xff, 0xff};
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

    EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
//    setting_default();
    EE_SPI_Read((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
    EE_SPI_Read((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
    g_rtc.hour = 10;
    g_rtc.sec = 2;
    R_RTC_Set_CounterValue(g_rtc);
    R_RTC_Start();
    R_UART2_Receive(g_rx_data, 6);
//    Test nhan
    O_RS485_MODE_PIN = 0U;
    R_UART3_Receive(rec_buf, 6);

//    Test gui
//    O_RS485_MODE_PIN = 1U;
//    delay_ms(10);
//    R_UART3_Send(send_buf, 7);
    EEPROM_PROTECT_EN();

    g_pre_color = BLUE;
    handSensorLED(BLACK);
//    g_machine_state.mode = INDIE; // Set as indie-mode
    g_timerSetting.t26_onDelayEmptyLevel_s = g_timerSetting.t26_onDelayEmptyLevel_s = 5000;
    main_init_20211111();

    while (1U)
    {
    	RaspberryResponse_nostop();



    	handSensorLED(g_color);
		UpdateMachineStatus();
//--------------------------------- Testing code---------------------------------------------------------------
    	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
    		P6_bit.no3 = ~P6_bit.no3;
    	}
    	if((g_rx_data[0] == H_SET)&(g_rx_data[1] == OK_USER)){
    		g_machine_state.user = 1;
    	}
    	if(g_machine_state.user == 1){
    		HandWashingMode_nostop();
    	}else{
    		g_Tick.tickCustom[1] = g_systemTime;
    	}

    	// Check
    	if(g_uart2_fault == 1){
    		R_UART2_Stop();
    		delay_ms(10);
    		R_UART2_Start();
    		g_uart2_fault = 0;
    	}
    	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
    	if(ns_delay_ms(&g_Tick.tickCustom[1], 60000)){
    		if(O_SUPPLY_WATER_PIN_SV1 == ON){
				g_TickKeeper.SV1_ON_minutes++;
				g_TickKeeper.SV1_OFF_minutes = 0;
			}else{
				g_TickKeeper.SV1_OFF_minutes++;
				g_TickKeeper.SV1_ON_minutes = 0;
			}
			if(O_SPOUT_WATER_PIN_SV2 == ON){
				g_TickKeeper.SV2_ON_minutes++;
				g_TickKeeper.SV2_OFF_minutes = 0;
			}else{
				g_TickKeeper.SV2_OFF_minutes++;
				g_TickKeeper.SV2_ON_minutes = 0;
			}
    	}
    	if(ns_delay_ms(&g_Tick.tick1s, 1000)){

//    		send_buf[1]++;
//    		R_UART3_Send(send_buf, 7);
//    		R_UART3_Receive(rec_buf, 7);
//    		O_CTRL_OUT_PIN = led_st&0x01;
//    		O_SPOUT_WATER_PIN = led_st&0x01;

    		led_st = led_st == 0?0xff:0x00;
    	    uint8_t state = g_uart2_sendend;
    	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
    	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
//    	    switch (g_color) {
//				case BLACK:
//					g_color = RED;
//					break;
//				case RED:
//					g_color = BLUE;
//					break;
//				case BLUE:
//					g_color = WHITE;
//					break;
//				default:
//					g_color = BLACK;
//					break;
//			}
//    	    dac_out[0]+= 10;
			CVCC_Current_Set(dac_out[0]);
//			dac_out[1]+= 10;
			Salt_Analog_Set(dac_out[1]);
    		if(led_st == 0x00){

//    			O_CVCC_ON_PIN = ON;
//    			O_HS_ICL_PIN = 0;
//    			O_HS_IDA_PIN = 1;
//    			handSensorLED(RED);
//    			O_CVCC_ALARM_RS = 1;
//    			O_PUMP_SALT_PIN = ON;
//    			electrolyticOperationON();
//    			g_io_status.refined.Valve.SV4 = 1;
//				g_io_status.refined.Pump2 = 1;
//				g_io_status.refined.Valve.SV5 = 0;
//				g_io_status.refined.Pump1 = 0;
//				g_io_status.refined.SaltLowLevel = 1;
//    			e_send[0]++;
//    			g_numberSetting.upperVoltage1++;
//    			g_numberSetting.crc--;
//    			g_numberSetting.crc2++;
//    			g_numberSetting.lowerFlow++;
//    			g_numberSetting.hello++;
//    			EE_SPI_Write((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
//    			EE_SPI_Write((uint8_t *)&g_numberSetting.crc, 0x800, 6);
//    			EE_SPI_Write((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
    		}else{
//    			O_CVCC_ON_PIN = OFF;
//    			O_HS_ICL_PIN = 1;
//				O_HS_IDA_PIN = 0;
//    			handSensorLED(WHITE);
//    			O_CVCC_ALARM_RS = 0;
//    			O_PUMP_SALT_PIN = OFF;
//    			electrolyticOperationOFF();
//    			g_io_status.refined.Valve.SV4 = 0;
//				g_io_status.refined.Pump2 = 0;
//				g_io_status.refined.Valve.SV5 = 1;
//				g_io_status.refined.Pump1 = 1;
//				g_io_status.refined.SaltLowLevel = 0;
//    			EE_SPI_Read((uint8_t *)&ret_number_setting, 0x000, sizeof(g_numberSetting));

    		}
    	}
//--------------------------------End testing code---------------------------------------------------------
    	if(g_machine_state.mode == BUSY){
    		g_machine_state.user = 0;
    		if(ns_delay_ms(&g_Tick.tickDebouceHandSensor, 800)){
    			g_machine_state.mode = INDIE;
    		}
    	}else{
    		g_Tick.tickDebouceHandSensor = g_systemTime;
    	}
		if((g_machine_state.mode == WATER_WASHING)|(g_machine_state.mode == INDIE)){
//			nostop_WaterWashingMode();
		}
//    	InitialOperationModeStart();

//    	if(g_color != g_pre_color){
//			O_RS485_MODE_PIN = 1U;
//			uint8_t _uart3 = g_uart3_sendend;
//			send_buf[3]++;
//			R_UART3_Send(send_buf, 7);
//			while(_uart3 == g_uart3_sendend);
//			O_RS485_MODE_PIN = 0U;
//    	}
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
	CVCC_Current_Set(0x0);
	Salt_Analog_Set(0x0);
    R_DAC0_Start();
    R_DAC1_Start();
    /* End user code. Do not edit comment generated here */
}

/* Start user code for adding. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
