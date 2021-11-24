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
* Creation Date: 17/11/2021
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
uint32_t _stamp[3];
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
    R_UART2_Receive(g_rx_data, sizeof(struct UART_Buffer_s));
//    EEPROM_PROTECT_EN();
    while (1U)
    {
//--------------------------------- Testing code---------------------------------------------------------------
    	if(ns_delay_ms(&_stamp[0], 200)){
////    		P6_bit.no3 = ~P6_bit.no3;
//    		R_UART3_Send((uint8_t *)"Hello", sizeof("Hello")-1);
//    		R_UART1_Send((uint8_t *)"Hello", sizeof("Hello")-1);
//    		g_e_status.raw = rEE_Status();
    	}
    	if(g_uart2_fault == 1){
    		R_UART2_Stop();
    		delay_ms(10);
    		R_UART2_Start();
    		g_uart2_fault = 0;
    	}
    	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
    	if(ns_delay_ms(&_stamp[1], 1000)){
    		O_CTRL_OUT_PIN = led_st&0x01;
    		led_st = led_st == 0?0xff:0x00;
    	    uint8_t state = g_uart2_send;
    	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(g_timerSetting));
			while(state == g_uart2_send){
				R_WDT_Restart();
			}
    		if(led_st == 0x00){
    		}else{
    		}
    	}
//--------------------------------End testing code---------------------------------------------------------
//    	main_20211111();
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
