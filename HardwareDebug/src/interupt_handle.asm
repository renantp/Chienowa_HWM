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
#@  compiled at Wed Dec 01 09:21:14 2021

	.EXTERN _g_cvcc_current
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
	;***       15 : 	//TODO: Change ratio to calculate ADC when change to new resistor.
	;***       16 : 	const float _max_voltage = 10.0;
	;***       17 : 	switch (ADS) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 17
	mov a, 0xFFF31
	cmp0 a
	bz $.BB@LABEL@1_3
.BB@LABEL@1_1:	; entry
	dec a
	bnz $.BB@LABEL@1_4
.BB@LABEL@1_2:	; switch_clause_bb8
	;***       18 : 		case _00_AD_INPUT_CHANNEL_0:
	;***       19 : 			R_ADC_Get_Result(&g_adc_value[0]);
	;***       20 : 			g_cvcc_current = ((float)g_adc_value[0]/1024)*_max_voltage;
	;***       21 : 			ADS = _01_AD_INPUT_CHANNEL_1;
	;***       22 : 			break;
	;***       23 : 		case _01_AD_INPUT_CHANNEL_1:
	;***       24 : 			R_ADC_Get_Result(&g_adc_value[1]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 24
	movw ax, #LOWW(_g_adc_value+0x00002)
	call !!_R_ADC_Get_Result
	;***       25 : 			g_cvcc_voltge = ((float)g_adc_value[1]/1024)*_max_voltage;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 25
	movw ax, !LOWW(_g_adc_value+0x00002)
	clrw bc
	call !!__COM_ultof
	movw de, ax
	movw ax, #0x3A80
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x4120
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	movw ax, bc
	addw sp, #0x04
	movw !LOWW(_g_cvcc_voltge+0x00002), ax
	movw ax, de
	movw !LOWW(_g_cvcc_voltge), ax
	;***       26 : 			ADS = _00_AD_INPUT_CHANNEL_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 26
	mov 0xFFF31, #0x00
	br $.BB@LABEL@1_4
.BB@LABEL@1_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 19
	movw ax, #LOWW(_g_adc_value)
	call !!_R_ADC_Get_Result
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 20
	movw ax, !LOWW(_g_adc_value)
	clrw bc
	call !!__COM_ultof
	movw de, ax
	movw ax, #0x3A80
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x4120
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	movw ax, bc
	addw sp, #0x04
	movw !LOWW(_g_cvcc_current+0x00002), ax
	movw ax, de
	movw !LOWW(_g_cvcc_current), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 21
	mov 0xFFF31, #0x01
.BB@LABEL@1_4:	; switch_break_bb
	;***       27 : 			break;
	;***       28 : 		default:
	;***       29 : 			break;
	;***       30 : 	}
	;***       31 : //	R_ADC_Stop();
	;***       32 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interupt_handle.c", 32
	br !!_R_ADC_Start
	;***       33 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_adc_value:
	.DS (4)
