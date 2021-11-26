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
#@  compiled at Fri Nov 26 15:54:56 2021

	.EXTERN _g_rtc
	.EXTERN _g_timerSetting
	.EXTERN _g_csi_rev_end
	.EXTERN _g_uart2_send
	.EXTERN _g_uart2_fault
	.EXTERN _g_rx_data
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
	.PUBLIC _hi
	.PUBLIC _hiSetup
	.PUBLIC _main
	.PUBLIC _R_MAIN_UserInit
	.EXTERN _EEPROM_Init
	.EXTERN _setting_default
	.EXTERN _R_RTC_Set_CounterValue
	.EXTERN _R_RTC_Start
	.EXTERN _R_UART2_Receive
	.EXTERN _handSensorLED
	.EXTERN _ns_delay_ms
	.EXTERN _R_UART2_Stop
	.EXTERN _delay_ms
	.EXTERN _R_UART2_Start
	.EXTERN _CRC8
	.EXTERN _R_UART2_Send
	.EXTERN _R_WDT_Restart
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
_hiSetup:
	.STACK _hiSetup = 4
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
	;***       26 : * Creation Date: 24/11/2021
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
	;***       45 : /* End user code. Do not edit comment generated here */
	;***       46 : #include "r_cg_userdefine.h"
	;***       47 : 
	;***       48 : /***********************************************************************************************************************
	;***       49 : Pragma directive
	;***       50 : ***********************************************************************************************************************/
	;***       51 : /* Start user code for pragma. Do not edit comment generated here */
	;***       52 : /* End user code. Do not edit comment generated here */
	;***       53 : 
	;***       54 : /***********************************************************************************************************************
	;***       55 : Global variables and functions
	;***       56 : ***********************************************************************************************************************/
	;***       57 : /* Start user code for global. Do not edit comment generated here */
	;***       58 : volatile int g_error = 0;
	;***       59 : volatile int g_adc_ch = 0;
	;***       60 : uint32_t _stamp[3];
	;***       61 : union EEPROM_status_u g_e_status;
	;***       62 : uint8_t led_st = 0xff;
	;***       63 : uint8_t flow_p, salt_h_p;
	;***       64 : uint8_t e_send[12] = {EEPROM_RDSR, 0b10100101, EEPROM_WRSR, 0x00, EEPROM_WRSR, 0x02, EEPROM_WREN, EEPROM_WRDI};
	;***       65 : uint8_t e_data[12] = {0,0};
	;***       66 : uint8_t g_eeprom_wren;
	;***       67 : uint8_t send_data[2] = { 0x23, 0xab};
	;***       68 : uint8_t receive_data[2];
	;***       69 : struct Number_Setting_s receive_setting;
	;***       70 : union EEPROM_status_u set;
	;***       71 : uint32_t rx_data[3];
	;***       72 : float data_f;
	;***       73 : union byte_to_float data_f_test;
	;***       74 : struct UART_Buffer_s g_control_buffer;
	;***       75 : struct LED{
	;***       76 : 	void (*led)(enum HS_COLOR);
	;***       77 : };
	;***       78 : struct LED hi;
	;***       79 : void hiSetup(struct LED *_led, void (*led)(enum HS_COLOR)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 79
	movw hl, ax
	movw ax, de
	;***       80 : 	_led->led = led;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 80
	movw [hl], ax
	mov a, c
	mov [hl+0x02], a
	ret
_main:
	.STACK _main = 14
	;***       81 : }
	;***       82 : /* End user code. Do not edit comment generated here */
	;***       83 : void R_MAIN_UserInit(void);
	;***       84 : 
	;***       85 : /***********************************************************************************************************************
	;***       86 : * Function Name: main
	;***       87 : * Description  : This function implements main function.
	;***       88 : * Arguments    : None
	;***       89 : * Return Value : None
	;***       90 : ***********************************************************************************************************************/
	;***       91 : void main(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 91
	push hl
	;***       92 : {
	;***       93 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 93
	call $!_R_MAIN_UserInit
	;***       94 :     /* Start user code. Do not edit comment generated here */
	;***       95 :     EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 95
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	;***       96 : //    O_RS485_MODE_PIN = 1U;
	;***       97 : //    EEPROM_SPI_WriteBuffer(e_send, 0x000f, 4);
	;***       98 : //    delay_ms(1000);
	;***       99 : //    EEPROM_SPI_ReadBuffer(e_data, 0x000f, 3);
	;***      100 : //    R_UART0_Send("Hello \r\n", sizeof("Hello \r\n") - 1);
	;***      101 : //    csi01_status = STATUS_COMPLETE;
	;***      102 :     //Power ON
	;***      103 :     setting_default();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 103
	call !!_setting_default
	;***      104 :     g_rtc.hour = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 104
	mov !LOWW(_g_rtc+0x00002), #0x0A
	;***      105 :     g_rtc.sec = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 105
	mov !LOWW(_g_rtc), #0x02
	;***      106 :     R_RTC_Set_CounterValue(g_rtc);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 106
	subw sp, #0x08
	movw ax, sp
	movw de, #0x0007
	movw bc, #LOWW(_g_rtc)
	call !!_memcpy
	call !!_R_RTC_Set_CounterValue
	addw sp, #0x08
	;***      107 :     R_RTC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 107
	call !!_R_RTC_Start
	;***      108 :     R_UART2_Receive(g_rx_data, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 108
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      109 : //    EEPROM_PROTECT_EN();
	;***      110 :     hiSetup(&hi, handSensorLED);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 110
	movw de, #LOWW(_handSensorLED)
	mov c, #LOW(HIGHW(_handSensorLED))
	movw ax, #LOWW(_hi)
	call $!_hiSetup
.BB@LABEL@2_1:	; bb75
	;***      111 :     while (1U)
	;***      112 :     {
	;***      113 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      114 :     	if(ns_delay_ms(&_stamp[0], 200)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 114
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(__stamp)
	call !!_ns_delay_ms
	;***      115 : ////    		P6_bit.no3 = ~P6_bit.no3;
	;***      116 : //    		R_UART3_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      117 : //    		R_UART1_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      118 : //    		g_e_status.raw = rEE_Status();
	;***      119 :     	}
	;***      120 :     	if(g_uart2_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 120
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@2_3
.BB@LABEL@2_2:	; if_then_bb13
	;***      121 :     		R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 121
	call !!_R_UART2_Stop
	;***      122 :     		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 122
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      123 :     		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 123
	call !!_R_UART2_Start
	;***      124 :     		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 124
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@2_3:	; if_break_bb14
	;***      125 :     	}
	;***      126 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 126
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@2_4:	; bb22
	clrb a
.BB@LABEL@2_5:	; bb24
	mov !LOWW(_flow_p), a
	;***      127 :     	if(ns_delay_ms(&_stamp[1], 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 127
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(__stamp+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_14
.BB@LABEL@2_6:	; if_then_bb32
	;***      128 :     		O_CTRL_OUT_PIN = led_st&0x01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 128
	mov a, !LOWW(_led_st)
	mov x, a
	mov1 CY, a.0
	mov a, 0xFFF03
	mov1 a.1, CY
	mov 0xFFF03, a
	;***      129 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 129
	cmp0 x
	mov a, #0xFF
	skz
.BB@LABEL@2_7:	; bb47
	clrb a
.BB@LABEL@2_8:	; bb50
	mov !LOWW(_led_st), a
	;***      130 :     	    uint8_t state = g_uart2_send;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 130
	mov a, !LOWW(_g_uart2_send)
	mov [sp+0x00], a
	;***      131 :     	    g_timerSetting.crc = CRC8((char *)&g_timerSetting, sizeof(g_timerSetting)-1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 131
	mov c, #0x25
	movw ax, #LOWW(_g_timerSetting)
	call !!_CRC8
	mov !LOWW(_g_timerSetting+0x00024), a
	;***      132 :     	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(g_timerSetting));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 132
	movw bc, #0x0026
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@2_9:	; bb58
	mov a, [sp+0x00]
	;***      133 : 			while(state == g_uart2_send){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 133
	cmp a, !LOWW(_g_uart2_send)
	bnz $.BB@LABEL@2_11
.BB@LABEL@2_10:	; bb57
	;***      134 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 134
	call !!_R_WDT_Restart
	br $.BB@LABEL@2_9
.BB@LABEL@2_11:	; bb66
	;***      135 : 			}
	;***      136 :     		if(led_st == 0x00){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 136
	cmp0 !LOWW(_led_st)
	bnz $.BB@LABEL@2_13
.BB@LABEL@2_12:	; if_then_bb72
	;***      137 : //    			O_HS_ICL_PIN = 0;
	;***      138 : //    			O_HS_IDA_PIN = 1;
	;***      139 :     			handSensorLED(RED);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 139
	oneb a
	call !!_handSensorLED
	;***      140 :     			O_CVCC_ALARM_RS = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 140
	set1 0xFFF0D.0
	br $.BB@LABEL@2_14
.BB@LABEL@2_13:	; if_else_bb
	;***      141 :     		}else{
	;***      142 : //    			O_HS_ICL_PIN = 1;
	;***      143 : //				O_HS_IDA_PIN = 0;
	;***      144 :     			handSensorLED(WHITE);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 144
	mov a, #0x02
	call !!_handSensorLED
	;***      145 :     			O_CVCC_ALARM_RS = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	clr1 0xFFF0D.0
.BB@LABEL@2_14:	; if_break_bb74
	;***      146 :     		}
	;***      147 :     	}
	;***      148 : //--------------------------------End testing code---------------------------------------------------------
	;***      149 : //    	main_20211111();
	;***      150 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 150
	call !!_R_WDT_Restart
	br $!.BB@LABEL@2_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      151 :     }
	;***      152 :     /* End user code. Do not edit comment generated here */
	;***      153 : }
	;***      154 : 
	;***      155 : /***********************************************************************************************************************
	;***      156 : * Function Name: R_MAIN_UserInit
	;***      157 : * Description  : This function adds user code before implementing main function.
	;***      158 : * Arguments    : None
	;***      159 : * Return Value : None
	;***      160 : ***********************************************************************************************************************/
	;***      161 : void R_MAIN_UserInit(void)
	;***      162 : {
	;***      163 :     /* Start user code. Do not edit comment generated here */
	;***      164 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 164
	ei
	;***      165 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 165
	call !!_R_TAU0_Create
	;***      166 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 166
	call !!_R_SAU0_Create
	;***      167 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 167
	call !!_R_SAU1_Create
	;***      168 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 168
	call !!_R_UART1_Create
	;***      169 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 169
	call !!_R_UART2_Create
	;***      170 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 170
	call !!_R_UART3_Create
	;***      171 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 171
	call !!_R_RTC_Create
	;***      172 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 172
	call !!_R_PORT_Create_UserInit
	;***      173 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 173
	call !!_R_CSI01_Create
	;***      174 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 174
	call !!_R_CSI00_Create
	;***      175 : 
	;***      176 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 176
	call !!_R_TAU0_Channel0_Start
	;***      177 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 177
	call !!_R_UART3_Start
	;***      178 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 178
	call !!_R_UART1_Start
	;***      179 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 179
	call !!_R_UART2_Start
	;***      180 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 180
	call !!_R_CSI00_Start
	;***      181 : //    R_CSI01_Start();
	;***      182 : 
	;***      183 : 
	;***      184 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 184
	call !!_R_ADC_Create
	;***      185 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 185
	call !!_R_ADC_Set_OperationOn
	;***      186 : //    R_ADC_Set_ADChannel(ADCHANNEL0);
	;***      187 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 187
	br !!_R_ADC_Start
	;***      188 :     /* End user code. Do not edit comment generated here */
	;***      189 : }
	;***      190 : 
	;***      191 : /* Start user code for adding. Do not edit comment generated here */
	;***      192 : /* End user code. Do not edit comment generated here */
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
	.ALIGN 2
_hi:
	.DS (4)
