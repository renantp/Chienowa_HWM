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
#@  compiled at Wed Jun 22 12:09:15 2022

	.EXTERN _g_Tick
	.EXTERN _g_color
	.EXTERN _g_pre_color
	.PUBLIC _bink_reset_flag
	.PUBLIC _handSensorLED
	.PUBLIC _handSensorLEDBlink
	.EXTERN _ns_delay_ms
	.PUBLIC _HandSensorLEDEndBlink

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
	;***        9 : uint8_t bink_reset_flag = 0;
	;***       10 : 
	;***       11 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 11
	mov !LOWW(_g_color), a
	;***       12 : 	g_color = color;
	;***       13 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 13
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       14 : 		switch (color) {
	;***       15 : 		case RED:
	;***       16 : 			O_HS_ICL_PIN = 1;
	;***       17 : 			O_HS_IDA_PIN = 0;
	;***       18 : 			break;
	;***       19 : 		case BLUE:
	;***       20 : 			O_HS_ICL_PIN = 0;
	;***       21 : 			O_HS_IDA_PIN = 0;
	;***       22 : 			break;
	;***       23 : 		case WHITE:
	;***       24 : 			O_HS_ICL_PIN = 0;
	;***       25 : 			O_HS_IDA_PIN = 1;
	;***       26 : 			break;
	;***       27 : 		default:
	;***       28 : 			O_HS_ICL_PIN = 1;
	;***       29 : 			O_HS_IDA_PIN = 1;
	;***       30 : 			break;
	;***       31 : 		}
	;***       32 : 		g_pre_color = g_color;
	;***       33 : 	}
	;***       34 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 34
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 14
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 28
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 16
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 17
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 20
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 21
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 24
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 32
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_handSensorLEDBlink:
	.STACK _handSensorLEDBlink = 6
	;***       35 : 
	;***       36 : void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 36
	push hl
	mov [sp+0x00], a
	;***       37 : 	bink_reset_flag = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 37
	oneb !LOWW(_bink_reset_flag)
	;***       38 : 	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 38
	movw ax, #LOWW(_g_Tick+0x0000C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; return
	;***       39 : 		g_color = g_color == color ? BLACK : color;
	;***       40 : 		handSensorLED(g_color);
	;***       41 : 	}
	;***       42 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 42
	pop hl
	ret
.BB@LABEL@2_2:	; if_then_bb
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 39
	cmp a, !LOWW(_g_color)
	sknz
.BB@LABEL@2_3:	; if_then_bb.bb15_crit_edge
	clrb a
.BB@LABEL@2_4:	; bb15
	mov !LOWW(_g_color), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 40
	pop hl
	br $_handSensorLED
_HandSensorLEDEndBlink:
	.STACK _HandSensorLEDEndBlink = 4
	;***       43 : 
	;***       44 : void HandSensorLEDEndBlink(void) {
	;***       45 : 	if (bink_reset_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 45
	cmp0 !LOWW(_bink_reset_flag)
	sknz
.BB@LABEL@3_1:	; return
	;***       46 : 		handSensorLED(BLACK);
	;***       47 : 		bink_reset_flag = 0;
	;***       48 : 	}
	;***       49 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 49
	ret
.BB@LABEL@3_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 46
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 47
	clrb !LOWW(_bink_reset_flag)
	ret
	.SECTION .data,DATA
_bink_reset_flag:
	.DS (1)
