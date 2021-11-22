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
#@   -o src/interupt_handle.obj
#@   ../src/interupt_handle.c
#@  compiled at Mon Nov 22 10:16:12 2021

	.EXTERN _g_cvcc_voltge
	.PUBLIC _g_adc_value
	.PUBLIC _adc_int_handle
	.EXTERN _R_ADC_Get_Result
	.EXTERN _R_ADC_Start

	.SECTION .textf,TEXTF
_adc_int_handle:
	.STACK _adc_int_handle = 8
	;***        1 : /*
	;***        2 :  * interupt_handle.c
	;***        3 :  *
	;***        4 :  *  Created on: 11 Oct 2021
	;***        5 :  *      Author: Hung
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "r_cg_macrodriver.h"
	;***        9 : #include "r_cg_userdefine.h"
	;***       10 : #include "r_cg_adc.h"
	;***       11 : #include "r_cg_timer.h"
	;***       12 : uint16_t g_adc_value[2];
	;***       13 : 
	;***       14 : void adc_int_handle(void){
	;***       15 : 	switch (ADS) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 15
	mov a, 0xFFF31
	cmp0 a
	bz $.BB@LABEL@1_3
.BB@LABEL@1_1:	; entry
	dec a
	bnz $.BB@LABEL@1_4
.BB@LABEL@1_2:	; switch_clause_bb2
	;***       16 : 		case _00_AD_INPUT_CHANNEL_0:
	;***       17 : 			R_ADC_Get_Result(&g_adc_value[0]);
	;***       18 : 			ADS = _01_AD_INPUT_CHANNEL_1;
	;***       19 : 			break;
	;***       20 : 		case _01_AD_INPUT_CHANNEL_1:
	;***       21 : 			R_ADC_Get_Result(&g_adc_value[1]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 21
	movw ax, #LOWW(_g_adc_value+0x00002)
	call !!_R_ADC_Get_Result
	;***       22 : 			g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 22
	movw ax, !LOWW(_g_adc_value+0x00002)
	clrw bc
	call !!__COM_ultof
	movw de, ax
	movw ax, #0x3B00
	push ax
	clrb a
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	movw ax, bc
	addw sp, #0x04
	movw !LOWW(_g_cvcc_voltge+0x00002), ax
	movw ax, de
	movw !LOWW(_g_cvcc_voltge), ax
	;***       23 : 			ADS = _00_AD_INPUT_CHANNEL_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 23
	mov 0xFFF31, #0x00
	br $.BB@LABEL@1_4
.BB@LABEL@1_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 17
	movw ax, #LOWW(_g_adc_value)
	call !!_R_ADC_Get_Result
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 18
	mov 0xFFF31, #0x01
.BB@LABEL@1_4:	; switch_break_bb
	;***       24 : 			break;
	;***       25 : 		default:
	;***       26 : 			break;
	;***       27 : 	}
	;***       28 : //	R_ADC_top();
	;***       29 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 29
	br !!_R_ADC_Start
	;***       30 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_adc_value:
	.DS (4)
