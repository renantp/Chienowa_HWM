#CC-RL Compiler RL78 Assembler Source
#@  CC-RL Version : V1.10.00 [20 Nov 2020]
#@  Commmand :
#@   -cpu=S3
#@   -c
#@   -dev=D:/Chieniwa/E2_Studio/.eclipse/com.renesas.platform_1435879475/DebugComp/RL78/RL78/Common/DR5F104ML.DVF
#@   -MAKEUD=D:\Chieniwa\E2_Studio\ControlPCB_HWM\HardwareDebug\src
#@   -I C:\Program Files (x86)\Renesas Electronics\CS+\CC\CC-RL\V1.10.00\inc
#@   -I D:\Chieniwa\E2_Studio\ControlPCB_HWM\generate
#@   -character_set=utf8
#@   -lang=c99
#@   -g
#@   -asmopt=-prn_path=src
#@   -asm_path=src/
#@   -pass_source
#@   -o src/r_main.obj
#@   ../src/r_main.c
#@  compiled at Tue Dec 07 09:52:21 2021

	.EXTERN _g_rtc
	.EXTERN _g_timerSetting
	.EXTERN _g_uart3_sendend
	.EXTERN _g_csi_rev_end
	.EXTERN _g_uart2_send
	.EXTERN _g_uart2_fault
	.EXTERN _g_rx_data
	.EXTERN _g_color
	.EXTERN _g_pre_color
	.PUBLIC _g_error
	.PUBLIC _g_adc_ch
	.PUBLIC __stamp
	.PUBLIC _g_e_status
	.PUBLIC _led_st
	.PUBLIC _flow_p
	.PUBLIC _salt_h_p
	.PUBLIC _e_send
	.PUBLIC _e_data
	.PUBLIC _g_eeprom_wren
	.PUBLIC _send_data
	.PUBLIC _receive_data
	.PUBLIC _receive_setting
	.PUBLIC _set
	.PUBLIC _rx_data
	.PUBLIC _data_f
	.PUBLIC _data_f_test
	.PUBLIC _g_control_buffer
	.PUBLIC _this_size
	.PUBLIC _rec_buf
	.PUBLIC _send_buf
	.PUBLIC _g_crc
	.PUBLIC _g_crc_32
	.PUBLIC _data_crc
	.PUBLIC _readHS
	.EXTERN _delay_ms
	.PUBLIC _main
	.PUBLIC _R_MAIN_UserInit
	.EXTERN _EEPROM_Init
	.EXTERN _setting_default
	.EXTERN _R_RTC_Set_CounterValue
	.EXTERN _R_RTC_Start
	.EXTERN _R_UART2_Receive
	.EXTERN _R_UART3_Receive
	.EXTERN _ns_delay_ms
	.EXTERN _R_UART2_Stop
	.EXTERN _R_UART2_Start
	.EXTERN _crc8_1
	.EXTERN _crc8_4
	.EXTERN _R_UART2_Send
	.EXTERN _R_WDT_Restart
	.EXTERN _R_UART3_Send
	.EXTERN _handSensorLED
	.EXTERN _R_TAU0_Create
	.EXTERN _R_SAU0_Create
	.EXTERN _R_SAU1_Create
	.EXTERN _R_UART1_Create
	.EXTERN _R_UART2_Create
	.EXTERN _R_UART3_Create
	.EXTERN _R_RTC_Create
	.EXTERN _R_PORT_Create_UserInit
	.EXTERN _R_CSI01_Create
	.EXTERN _R_CSI00_Create
	.EXTERN _R_TAU0_Channel0_Start
	.EXTERN _R_UART3_Start
	.EXTERN _R_UART1_Start
	.EXTERN _R_CSI00_Start
	.EXTERN _R_ADC_Create
	.EXTERN _R_ADC_Set_OperationOn
	.EXTERN _R_ADC_Start

	.SECTION .textf,TEXTF
_readHS:
	.STACK _readHS = 4
	;***        1 : /***********************************************************************************************************************
	;***        2 : * DISCLAIMER
	;***        3 : * This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products.
	;***        4 : * No other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
	;***        5 : * applicable laws, including copyright laws. 
	;***        6 : * THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING THIS SOFTWARE, WHETHER EXPRESS, IMPLIED
	;***        7 : * OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	;***        8 : * NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY
	;***        9 : * LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE FOR ANY DIRECT,
	;***       10 : * INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR
	;***       11 : * ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
	;***       12 : * Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability 
	;***       13 : * of this software. By using this software, you agree to the additional terms and conditions found by accessing the 
	;***       14 : * following link:
	;***       15 : * http://www.renesas.com/disclaimer
	;***       16 : *
	;***       17 : * Copyright (C) 2011, 2020 Renesas Electronics Corporation. All rights reserved.
	;***       18 : ***********************************************************************************************************************/
	;***       19 : 
	;***       20 : /***********************************************************************************************************************
	;***       21 : * File Name    : r_main.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements main function.
	;***       26 : * Creation Date: 30/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_cgc.h"
	;***       34 : #include "r_cg_port.h"
	;***       35 : #include "r_cg_serial.h"
	;***       36 : #include "r_cg_adc.h"
	;***       37 : #include "r_cg_dac.h"
	;***       38 : #include "r_cg_timer.h"
	;***       39 : #include "r_cg_wdt.h"
	;***       40 : #include "r_cg_rtc.h"
	;***       41 : /* Start user code for include. Do not edit comment generated here */
	;***       42 : #include "EEPROM.h"
	;***       43 : #include "usr_timer.h"
	;***       44 : #include "usr_setting_sheet.h"
	;***       45 : #include "crc8.h"
	;***       46 : /* End user code. Do not edit comment generated here */
	;***       47 : #include "r_cg_userdefine.h"
	;***       48 : 
	;***       49 : /***********************************************************************************************************************
	;***       50 : Pragma directive
	;***       51 : ***********************************************************************************************************************/
	;***       52 : /* Start user code for pragma. Do not edit comment generated here */
	;***       53 : /* End user code. Do not edit comment generated here */
	;***       54 : 
	;***       55 : /***********************************************************************************************************************
	;***       56 : Global variables and functions
	;***       57 : ***********************************************************************************************************************/
	;***       58 : /* Start user code for global. Do not edit comment generated here */
	;***       59 : volatile int g_error = 0;
	;***       60 : volatile int g_adc_ch = 0;
	;***       61 : uint32_t _stamp[3];
	;***       62 : union EEPROM_status_u g_e_status;
	;***       63 : uint8_t led_st = 0xff;
	;***       64 : uint8_t flow_p, salt_h_p;
	;***       65 : uint8_t e_send[12] = {EEPROM_RDSR, 0b10100101, EEPROM_WRSR, 0x00, EEPROM_WRSR, 0x02, EEPROM_WREN, EEPROM_WRDI};
	;***       66 : uint8_t e_data[12] = {0,0};
	;***       67 : uint8_t g_eeprom_wren;
	;***       68 : uint8_t send_data[2] = { 0x23, 0xab};
	;***       69 : uint8_t receive_data[2];
	;***       70 : struct Number_Setting_s receive_setting;
	;***       71 : union EEPROM_status_u set;
	;***       72 : uint32_t rx_data[3];
	;***       73 : float data_f;
	;***       74 : union byte_to_float data_f_test;
	;***       75 : struct UART_Buffer_s g_control_buffer;
	;***       76 : #define DETECT I_HS_ODA_PIN
	;***       77 : uint8_t readHS(void){
	;***       78 :    if(DETECT){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 78
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_2
.BB@LABEL@1_1:	; bb18
	;***       79 : 	  delay_ms(2);
	;***       80 :       if(DETECT) return 1;return 0;
	;***       81 :    }else return 0;
	;***       82 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 82
	clrb a
	ret
.BB@LABEL@1_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 79
	clrw bc
	onew ax
	incw ax
	call !!_delay_ms
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 80
	mov a, 0xFFF07
	shr a, 0x05
	and a, #0x01
	ret
_main:
	.STACK _main = 14
	;***       83 : uint8_t this_size;
	;***       84 : uint8_t rec_buf[12];
	;***       85 : uint8_t send_buf[7] = {8,1,2,3,4,5,6};
	;***       86 : char g_crc[8];
	;***       87 : uint32_t g_crc_32[8];
	;***       88 : uint32_t data_crc[2] = {30500, 60200};
	;***       89 : /* End user code. Do not edit comment generated here */
	;***       90 : void R_MAIN_UserInit(void);
	;***       91 : 
	;***       92 : /***********************************************************************************************************************
	;***       93 : * Function Name: main
	;***       94 : * Description  : This function implements main function.
	;***       95 : * Arguments    : None
	;***       96 : * Return Value : None
	;***       97 : ***********************************************************************************************************************/
	;***       98 : void main(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 98
	push hl
	;***       99 : {
	;***      100 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 100
	call $!_R_MAIN_UserInit
	;***      101 :     /* Start user code. Do not edit comment generated here */
	;***      102 :     EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 102
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	;***      103 : //    O_RS485_MODE_PIN = 1U;
	;***      104 : //    EEPROM_SPI_WriteBuffer(e_send, 0x000f, 4);
	;***      105 : //    delay_ms(1000);
	;***      106 : //    EEPROM_SPI_ReadBuffer(e_data, 0x000f, 3);
	;***      107 : //    R_UART0_Send("Hello \r\n", sizeof("Hello \r\n") - 1);
	;***      108 : //    csi01_status = STATUS_COMPLETE;
	;***      109 :     //Power ON
	;***      110 :     setting_default();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 110
	call !!_setting_default
	;***      111 :     g_rtc.hour = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 111
	mov !LOWW(_g_rtc+0x00002), #0x0A
	;***      112 :     g_rtc.sec = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 112
	mov !LOWW(_g_rtc), #0x02
	;***      113 :     R_RTC_Set_CounterValue(g_rtc);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 113
	subw sp, #0x08
	movw ax, sp
	movw de, #0x0007
	movw bc, #LOWW(_g_rtc)
	call !!_memcpy
	call !!_R_RTC_Set_CounterValue
	addw sp, #0x08
	;***      114 :     R_RTC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 114
	call !!_R_RTC_Start
	;***      115 :     R_UART2_Receive(g_rx_data, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 115
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      116 : 
	;***      117 : //    Test nhan
	;***      118 :     O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 118
	clr1 0xFFF00.0
	;***      119 :     R_UART3_Receive(rec_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 119
	movw bc, #0x0007
	movw ax, #LOWW(_rec_buf)
	call !!_R_UART3_Receive
	;***      120 : 
	;***      121 : //    Test gui
	;***      122 : //    O_RS485_MODE_PIN = 1U;
	;***      123 : //    delay_ms(10);
	;***      124 : //    R_UART3_Send(send_buf, 7);
	;***      125 : //    EEPROM_PROTECT_EN();
	;***      126 : 
	;***      127 :     g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 127
	clrb !LOWW(_g_color)
	;***      128 :     g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 128
	mov !LOWW(_g_pre_color), #0x03
	;***      129 : 
	;***      130 :     this_size = sizeof(struct Timer_Setting_s);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 130
	mov !LOWW(_this_size), #0x46
.BB@LABEL@2_1:	; bb122
	;***      131 :     while (1U)
	;***      132 :     {
	;***      133 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      134 :     	if(ns_delay_ms(&_stamp[0], 200)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 134
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(__stamp)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_3
.BB@LABEL@2_2:	; if_then_bb
	;***      135 :     		P6_bit.no3 = ~P6_bit.no3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 135
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
.BB@LABEL@2_3:	; if_break_bb
	;***      136 : //    		R_UART3_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      137 : //    		R_UART1_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      138 : //    		g_e_status.raw = rEE_Status();
	;***      139 :     	}
	;***      140 :     	// Check
	;***      141 :     	if(g_uart2_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 141
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@2_5
.BB@LABEL@2_4:	; if_then_bb23
	;***      142 :     		R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 142
	call !!_R_UART2_Stop
	;***      143 :     		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      144 :     		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 144
	call !!_R_UART2_Start
	;***      145 :     		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@2_5:	; if_break_bb24
	;***      146 :     	}
	;***      147 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@2_6:	; bb32
	clrb a
.BB@LABEL@2_7:	; bb33
	mov !LOWW(_flow_p), a
	;***      148 :     	if(ns_delay_ms(&_stamp[1], 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 148
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(__stamp+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_13
.BB@LABEL@2_8:	; if_then_bb41
	;***      149 : //    		send_buf[1]++;
	;***      150 : //    		R_UART3_Send(send_buf, 7);
	;***      151 : //    		R_UART3_Receive(rec_buf, 7);
	;***      152 :     		O_CTRL_OUT_PIN = led_st&0x01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 152
	mov a, !LOWW(_led_st)
	mov x, a
	mov1 CY, a.0
	mov a, 0xFFF03
	mov1 a.1, CY
	mov 0xFFF03, a
	;***      153 :     		O_SPOUT_WATER_PIN = led_st&0x01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 153
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	;***      154 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 154
	cmp0 x
	mov a, #0xFF
	skz
.BB@LABEL@2_9:	; bb65
	clrb a
.BB@LABEL@2_10:	; bb67
	mov !LOWW(_led_st), a
	clrw ax
	;***      155 :     	    uint8_t state = g_uart2_send;
	;***      156 : //    	    g_timerSetting.t2_flowSensorStartTime = 0x24770000;
	;***      157 :     	    g_timerSetting.t2_flowSensorStartTime = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 157
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***      158 :     	    g_timerSetting.t3_flowSensorMonitorTime = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 158
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***      159 :     	    g_timerSetting.t6_drainageOffTime = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 159
	movw !LOWW(_g_timerSetting+0x0000A), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 155
	mov a, !LOWW(_g_uart2_send)
	mov [sp+0x00], a
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 157
	movw !LOWW(_g_timerSetting), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 158
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 159
	movw !LOWW(_g_timerSetting+0x00008), ax
	;***      160 : //    	    g_timerSetting.t51++;
	;***      161 :     	    g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, 36);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 161
	mov c, #0x24
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00044), a
	;***      162 : //    	    g_crc[0] = crc_8((unsigned char *)&g_timerSetting, 4);
	;***      163 : //    	    g_crc[1] = Fast_CRC_Cal8Bits(0x00, 4, (unsigned char *)&g_timerSetting);
	;***      164 : //    	    g_crc[2] = Quick_CRC_Cal8Bits(0x00, 4, (unsigned char *)&g_timerSetting);
	;***      165 : //    	    g_crc[3] = crc8x_simple(0x00, (unsigned char *)&g_timerSetting, 4);
	;***      166 : //    	    g_crc[4] = crc8x_fast(0x00, (unsigned char *)&g_timerSetting, 4);
	;***      167 : //    	    g_crc[5] = getCRC((unsigned char *)&g_timerSetting, 4);
	;***      168 :     	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, 36);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 168
	mov c, #0x24
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      169 :     	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, 36);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 169
	mov c, #0x24
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
	;***      170 : //    	    g_crc_32 = CRC32_function((uint8_t *)&g_timerSetting, 8);
	;***      171 : //    	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s));
	;***      172 :     	    R_UART2_Send((uint8_t *)&g_timerSetting, 36);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 172
	movw bc, #0x0024
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@2_11:	; bb77
	mov a, [sp+0x00]
	;***      173 : //    	    sendToRasPi(H_ALARM, CURRENT_ABNORMAL, 32);
	;***      174 :     	    while(state == g_uart2_send){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 174
	cmp a, !LOWW(_g_uart2_send)
	bnz $.BB@LABEL@2_13
.BB@LABEL@2_12:	; bb76
	;***      175 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 175
	call !!_R_WDT_Restart
	br $.BB@LABEL@2_11
.BB@LABEL@2_13:	; if_break_bb93
	;***      176 : 			}
	;***      177 : 
	;***      178 :     		if(led_st == 0x00){
	;***      179 : //    			O_HS_ICL_PIN = 0;
	;***      180 : //    			O_HS_IDA_PIN = 1;
	;***      181 : //    			handSensorLED(RED);
	;***      182 : //    			O_CVCC_ALARM_RS = 1;
	;***      183 : //    			O_PUMP_SALT_PIN = ON;
	;***      184 : //    			electrolyticOperationON();
	;***      185 : 
	;***      186 :     		}else{
	;***      187 : //    			O_HS_ICL_PIN = 1;
	;***      188 : //				O_HS_IDA_PIN = 0;
	;***      189 : //    			handSensorLED(WHITE);
	;***      190 : //    			O_CVCC_ALARM_RS = 0;
	;***      191 : //    			O_PUMP_SALT_PIN = OFF;
	;***      192 : //    			electrolyticOperationOFF();
	;***      193 :     		}
	;***      194 :     	}
	;***      195 : //--------------------------------End testing code---------------------------------------------------------
	;***      196 : //    	main_20211111();
	;***      197 : 
	;***      198 :     	switch (readHS()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 198
	call $!_readHS
	cmp0 a
	bz $.BB@LABEL@2_16
.BB@LABEL@2_14:	; if_break_bb93
	dec a
	bnz $.BB@LABEL@2_17
.BB@LABEL@2_15:	; switch_clause_bb96
	;***      199 : 			case 0:
	;***      200 : 				g_color = WHITE;
	;***      201 : 				break;
	;***      202 : 			case 1:
	;***      203 : 				g_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 203
	mov !LOWW(_g_color), #0x03
	br $.BB@LABEL@2_17
.BB@LABEL@2_16:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 200
	mov !LOWW(_g_color), #0x02
.BB@LABEL@2_17:	; switch_break_bb
	;***      204 : 				break;
	;***      205 : 			default:
	;***      206 : 
	;***      207 : 				break;
	;***      208 : 		}
	;***      209 :     	if(g_color != g_pre_color){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 209
	mov a, !LOWW(_g_color)
	cmp a, !LOWW(_g_pre_color)
	bz $.BB@LABEL@2_21
.BB@LABEL@2_18:	; if_then_bb105
	;***      210 : 			O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 210
	set1 0xFFF00.0
	;***      211 : 			uint8_t _uart3 = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 211
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	;***      212 : 			send_buf[3]++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 212
	inc !LOWW(_send_buf+0x00003)
	;***      213 : 			R_UART3_Send(send_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 213
	movw bc, #0x0007
	movw ax, #LOWW(_send_buf)
	call !!_R_UART3_Send
.BB@LABEL@2_19:	; bb111
	mov a, [sp+0x00]
	;***      214 : 			while(_uart3 == g_uart3_sendend);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 214
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@2_19
.BB@LABEL@2_20:	; bb119
	;***      215 : 			O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	clr1 0xFFF00.0
.BB@LABEL@2_21:	; if_break_bb120
	;***      216 :     	}
	;***      217 :     	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 217
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      218 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 218
	call !!_R_WDT_Restart
	br $!.BB@LABEL@2_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      219 :     }
	;***      220 :     /* End user code. Do not edit comment generated here */
	;***      221 : }
	;***      222 : 
	;***      223 : /***********************************************************************************************************************
	;***      224 : * Function Name: R_MAIN_UserInit
	;***      225 : * Description  : This function adds user code before implementing main function.
	;***      226 : * Arguments    : None
	;***      227 : * Return Value : None
	;***      228 : ***********************************************************************************************************************/
	;***      229 : void R_MAIN_UserInit(void)
	;***      230 : {
	;***      231 :     /* Start user code. Do not edit comment generated here */
	;***      232 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 232
	ei
	;***      233 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 233
	call !!_R_TAU0_Create
	;***      234 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 234
	call !!_R_SAU0_Create
	;***      235 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 235
	call !!_R_SAU1_Create
	;***      236 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 236
	call !!_R_UART1_Create
	;***      237 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 237
	call !!_R_UART2_Create
	;***      238 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 238
	call !!_R_UART3_Create
	;***      239 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 239
	call !!_R_RTC_Create
	;***      240 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 240
	call !!_R_PORT_Create_UserInit
	;***      241 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 241
	call !!_R_CSI01_Create
	;***      242 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 242
	call !!_R_CSI00_Create
	;***      243 : 
	;***      244 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 244
	call !!_R_TAU0_Channel0_Start
	;***      245 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 245
	call !!_R_UART3_Start
	;***      246 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 246
	call !!_R_UART1_Start
	;***      247 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 247
	call !!_R_UART2_Start
	;***      248 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 248
	call !!_R_CSI00_Start
	;***      249 : //    R_CSI01_Start();
	;***      250 : 
	;***      251 : 
	;***      252 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 252
	call !!_R_ADC_Create
	;***      253 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 253
	call !!_R_ADC_Set_OperationOn
	;***      254 : //    R_ADC_Set_ADChannel(ADCHANNEL0);
	;***      255 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 255
	br !!_R_ADC_Start
	;***      256 :     /* End user code. Do not edit comment generated here */
	;***      257 : }
	;***      258 : 
	;***      259 : /* Start user code for adding. Do not edit comment generated here */
	;***      260 : /* End user code. Do not edit comment generated here */
	.SECTION .data,DATA
	.ALIGN 2
_g_error:
	.DS (2)
	.ALIGN 2
_g_adc_ch:
	.DS (2)
_led_st:
	.DB 0xFF
_e_send:
	.DB 0x05,0xA5,0x01
	.DS (1)
	.DB 0x01,0x02,0x06,0x04
	.DS (4)
_e_data:
	.DS (12)
_send_data:
	.DB 0x23,0xAB
_send_buf:
	.DB 0x08,0x01,0x02,0x03,0x04,0x05,0x06
	.ALIGN 2
_data_crc:
	.DB4 0x00007724,0x0000EB28
	.SECTION .bss,BSS
	.ALIGN 2
__stamp:
	.DS (12)
_g_e_status:
	.DS (1)
_flow_p:
	.DS (1)
_salt_h_p:
	.DS (1)
_g_eeprom_wren:
	.DS (1)
_receive_data:
	.DS (2)
	.ALIGN 2
_receive_setting:
	.DS (34)
_set:
	.DS (1)
	.ALIGN 2
_rx_data:
	.DS (12)
	.ALIGN 2
_data_f:
	.DS (4)
	.ALIGN 2
_data_f_test:
	.DS (4)
	.ALIGN 2
_g_control_buffer:
	.DS (6)
_this_size:
	.DS (1)
_rec_buf:
	.DS (12)
_g_crc:
	.DS (8)
	.ALIGN 2
_g_crc_32:
	.DS (32)
