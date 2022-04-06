#CC-RL Compiler RL78 Assembler Source
#@  CC-RL Version : V1.10.00 [20 Nov 2020]
#@  Commmand :
#@   -cpu=S3
#@   -c
#@   -dev=D:/Chieniwa/E2_Studio/.eclipse/com.renesas.platform_1435879475/DebugComp/RL78/RL78/Common/DR5F104ML.DVF
#@   -MAKEUD=D:\Chieniwa\E2_Studio\ControlPCB_HWM\HardwareDebug\src\hwm
#@   -I C:\Program Files (x86)\Renesas Electronics\CS+\CC\CC-RL\V1.10.00\inc
#@   -I D:\Chieniwa\E2_Studio\ControlPCB_HWM\generate
#@   -character_set=utf8
#@   -lang=c99
#@   -g
#@   -asmopt=-prn_path=src/hwm
#@   -asm_path=src/hwm/
#@   -pass_source
#@   -o src/hwm/hand_sensor_interface.obj
#@   ../src/hwm/hand_sensor_interface.c
#@  compiled at Wed Apr 06 08:39:08 2022

	.EXTERN _g_Tick
	.EXTERN _g_color
	.EXTERN _g_pre_color
	.PUBLIC _handSensorLED
	.PUBLIC _handSensorLEDBlink
	.EXTERN _ns_delay_ms

	.SECTION .textf,TEXTF
_handSensorLED:
	.STACK _handSensorLED = 4
	;***        1 : /*
	;***        2 :  * hand_sensor_interface.c
	;***        3 :  *
	;***        4 :  *  Created on: 6 Jan 2022
	;***        5 :  *      Author: Hung
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "hand_sensor_interface.h"
	;***        9 : 
	;***       10 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 10
	mov !LOWW(_g_color), a
	;***       11 : 	g_color = color;
	;***       12 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 12
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       13 : 		switch (color) {
	;***       14 : 		case RED:
	;***       15 : 			O_HS_ICL_PIN = 1;
	;***       16 : 			O_HS_IDA_PIN = 0;
	;***       17 : 			break;
	;***       18 : 		case BLUE:
	;***       19 : 			O_HS_ICL_PIN = 0;
	;***       20 : 			O_HS_IDA_PIN = 0;
	;***       21 : 			break;
	;***       22 : 		case WHITE:
	;***       23 : 			O_HS_ICL_PIN = 0;
	;***       24 : 			O_HS_IDA_PIN = 1;
	;***       25 : 			break;
	;***       26 : 		default:
	;***       27 : 			O_HS_ICL_PIN = 1;
	;***       28 : 			O_HS_IDA_PIN = 1;
	;***       29 : 			break;
	;***       30 : 		}
	;***       31 : 		g_pre_color = g_color;
	;***       32 : 	}
	;***       33 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 33
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 13
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 27
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 15
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 16
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 19
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 20
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 23
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 31
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_handSensorLEDBlink:
	.STACK _handSensorLEDBlink = 6
	;***       34 : 
	;***       35 : void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 35
	push hl
	mov [sp+0x00], a
	;***       36 : 	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 36
	movw ax, #LOWW(_g_Tick+0x0000C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; return
	;***       37 : 		g_color = g_color == color ? BLACK : color;
	;***       38 : 		handSensorLED(g_color);
	;***       39 : 	}
	;***       40 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 40
	pop hl
	ret
.BB@LABEL@2_2:	; if_then_bb
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 37
	cmp a, !LOWW(_g_color)
	sknz
.BB@LABEL@2_3:	; if_then_bb.bb15_crit_edge
	clrb a
.BB@LABEL@2_4:	; bb15
	mov !LOWW(_g_color), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 38
	pop hl
	br $_handSensorLED
