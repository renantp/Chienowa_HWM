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
/* End user code. Do not edit comment generated here */
#include "r_cg_userdefine.h"

/***********************************************************************************************************************
Pragma directive
***********************************************************************************************************************/
/* Start user code for pragma. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
Global variables and functions
***********************************************************************************************************************/
/* Start user code for global. Do not edit comment generated here */
volatile int g_error = 0;
volatile int g_adc_ch = 0;
union EEPROM_status_u g_e_status;
uint8_t led_st = 0xff;
uint8_t flow_p, salt_h_p;
uint8_t e_send[12] = {EEPROM_RDSR, 0b10100101, EEPROM_WRSR, 0x00, EEPROM_WRSR, 0x02, EEPROM_WREN, EEPROM_WRDI};
uint8_t e_data[12] = {0,0};
uint8_t g_eeprom_wren;
uint8_t send_data[2] = { 0x23, 0xab};
uint8_t receive_data[2];
struct Number_Setting_s receive_setting;
union EEPROM_status_u set;
uint32_t rx_data[3];
float data_f;
union byte_to_float data_f_test;
struct UART_Buffer_s g_control_buffer;
#define DETECT I_HS_ODA_PIN
uint8_t readHS(void){
   if(DETECT){
	  delay_ms(2);
      if(DETECT) return 1;return 0;
   }else return 0;
}
uint8_t this_size;
uint8_t rec_buf[12];
uint8_t send_buf[7] = {8,1,2,3,4,5,6};
char g_crc[8];
uint32_t g_crc_32[8];
uint32_t data_crc[2] = {30500, 60200};
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
//    O_RS485_MODE_PIN = 1U;
//    EEPROM_SPI_WriteBuffer(e_send, 0x000f, 4);
//    delay_ms(1000);
//    EEPROM_SPI_ReadBuffer(e_data, 0x000f, 3);
//    R_UART0_Send("Hello \r\n", sizeof("Hello \r\n") - 1);
//    csi01_status = STATUS_COMPLETE;
    //Power ON
    setting_default();
    g_rtc.hour = 10;
    g_rtc.sec = 2;
    R_RTC_Set_CounterValue(g_rtc);
    R_RTC_Start();
    R_UART2_Receive(g_rx_data, 6);

//    Test nhan
    O_RS485_MODE_PIN = 0U;
    R_UART3_Receive(rec_buf, 7);

//    Test gui
//    O_RS485_MODE_PIN = 1U;
//    delay_ms(10);
//    R_UART3_Send(send_buf, 7);
//    EEPROM_PROTECT_EN();

    g_color = BLACK;
    g_pre_color = BLUE;

    this_size = sizeof(struct Timer_Setting_s);
    while (1U)
    {
    	if(send_response_flag){
    		uint8_t state = g_uart2_sendend;
    		R_UART2_Send(g_rx_data, 6);
    		while(state == g_uart2_sendend){
				R_WDT_Restart();
			}
    		send_response_flag = 0;
    	}
    	if(send_response_time_flag){
			uint8_t state = g_uart2_sendend;
			g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
			R_UART2_Send((uint8_t *)&g_timerSetting, 69);
			while(state == g_uart2_sendend){
				R_WDT_Restart();
			}
			send_response_time_flag = 0;
    	}
//--------------------------------- Testing code---------------------------------------------------------------
    	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
    		P6_bit.no3 = ~P6_bit.no3;
//    		R_UART3_Send((uint8_t *)"Hello", sizeof("Hello")-1);
//    		R_UART1_Send((uint8_t *)"Hello", sizeof("Hello")-1);
//    		g_e_status.raw = rEE_Status();
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
    		if(O_SUPPLY_WATER_PIN == ON){
				g_TickKeeper.SV1_ON_minutes++;
				g_TickKeeper.SV1_OFF_minutes = 0;
			}else{
				g_TickKeeper.SV1_OFF_minutes++;
				g_TickKeeper.SV1_ON_minutes = 0;
			}
			if(O_SPOUT_WATER_PIN == ON){
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
    		O_CTRL_OUT_PIN = led_st&0x01;
    		O_SPOUT_WATER_PIN = led_st&0x01;
    		led_st = led_st == 0?0xff:0x00;
    	    uint8_t state = g_uart2_sendend;
//    	    g_timerSetting.t2_flowSensorStartTime = 0x24770000;
    	    g_timerSetting.t2_flowSensorStartTime = 0x0000ffff;
    	    g_timerSetting.t3_flowSensorMonitorTime = 0x0000aaaa;
    	    g_timerSetting.t6_drainageOffTime = 1000;
//			g_timerSetting.t51++;
    	    g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
//    	    g_crc[0] = crc_8((unsigned char *)&g_timerSetting, 4);
//    	    g_crc[1] = Fast_CRC_Cal8Bits(0x00, 4, (unsigned char *)&g_timerSetting);
//    	    g_crc[2] = Quick_CRC_Cal8Bits(0x00, 4, (unsigned char *)&g_timerSetting);
//    	    g_crc[3] = crc8x_simple(0x00, (unsigned char *)&g_timerSetting, 4);
//    	    g_crc[4] = crc8x_fast(0x00, (unsigned char *)&g_timerSetting, 4);
//    	    g_crc[5] = getCRC((unsigned char *)&g_timerSetting, 4);
    	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
    	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
//    	    g_crc_32 = CRC32_function((uint8_t *)&g_timerSetting, 8);
//    	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s));
//    	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 1);
//    	    sendToRasPi(H_ALARM, CURRENT_ABNORMAL, 32);
//    	    while(state == g_uart2_sendend){
//				R_WDT_Restart();
//			}

    		if(led_st == 0x00){

//    			O_HS_ICL_PIN = 0;
//    			O_HS_IDA_PIN = 1;
//    			handSensorLED(RED);
//    			O_CVCC_ALARM_RS = 1;
//    			O_PUMP_SALT_PIN = ON;
//    			electrolyticOperationON();

    		}else{
//    			O_HS_ICL_PIN = 1;
//				O_HS_IDA_PIN = 0;
//    			handSensorLED(WHITE);
//    			O_CVCC_ALARM_RS = 0;
//    			O_PUMP_SALT_PIN = OFF;
//    			electrolyticOperationOFF();
    		}
    	}
//--------------------------------End testing code---------------------------------------------------------
//    	main_20211111();

    	switch (readHS()) {
			case 0:
				g_color = WHITE;
				break;
			case 1:
				g_color = BLUE;
				break;
			default:

				break;
		}
    	if(g_color != g_pre_color){
			O_RS485_MODE_PIN = 1U;
			uint8_t _uart3 = g_uart3_sendend;
			send_buf[3]++;
			R_UART3_Send(send_buf, 7);
			while(_uart3 == g_uart3_sendend);
			O_RS485_MODE_PIN = 0U;
    	}
    	handSensorLED(g_color);
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
//    R_ADC_Set_ADChannel(ADCHANNEL0);
    R_ADC_Start();
    /* End user code. Do not edit comment generated here */
}

/* Start user code for adding. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
