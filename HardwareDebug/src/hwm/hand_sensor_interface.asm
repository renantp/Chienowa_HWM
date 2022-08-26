#CC-RL Compiler RL78 Assembler Source
#@  CC-RL Version : V1.10.00 [20 Nov 2020]
#@  Commmand :
#@   -cpu=S3
#@   -c
#@   -dev=D:/Chieniwa/E2_Studio/.eclipse/com.renesas.platform_1223251604/DebugComp/RL78/RL78/Common/DR5F104ML.DVF
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
#@  compiled at Tue Aug 23 10:01:05 2022

	.EXTERN _g_io_status
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_systemTime
	.EXTERN _g_color
	.EXTERN _g_pre_color
	.PUBLIC _bink_reset_flag
	.PUBLIC _hand_sensor_debounce
	.PUBLIC _handSensorLED
	.PUBLIC _handSensorLEDBlink
	.EXTERN _ns_delay_ms
	.PUBLIC _HandSensorLEDEndBlink
	.PUBLIC _isHandSensorON
	.PUBLIC _setHandSensorOFF
	.PUBLIC _setHandSensorON

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
	;***       10 : uint8_t hand_sensor_debounce = 0;
	;***       11 : 
	;***       12 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 12
	mov !LOWW(_g_color), a
	;***       13 : 	g_color = color;
	;***       14 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 14
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       15 : 		switch (color) {
	;***       16 : 		case RED:
	;***       17 : 			O_HS_ICL_PIN = 1;
	;***       18 : 			O_HS_IDA_PIN = 0;
	;***       19 : 			break;
	;***       20 : 		case BLUE:
	;***       21 : 			O_HS_ICL_PIN = 0;
	;***       22 : 			O_HS_IDA_PIN = 0;
	;***       23 : 			break;
	;***       24 : 		case WHITE:
	;***       25 : 			O_HS_ICL_PIN = 0;
	;***       26 : 			O_HS_IDA_PIN = 1;
	;***       27 : 			break;
	;***       28 : 		default:
	;***       29 : 			O_HS_ICL_PIN = 1;
	;***       30 : 			O_HS_IDA_PIN = 1;
	;***       31 : 			break;
	;***       32 : 		}
	;***       33 : 		g_pre_color = g_color;
	;***       34 : 	}
	;***       35 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 35
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 15
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 29
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 17
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 18
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 21
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 22
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 25
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 33
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_handSensorLEDBlink:
	.STACK _handSensorLEDBlink = 6
	;***       36 : 
	;***       37 : void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 37
	push hl
	mov [sp+0x00], a
	;***       38 : 	bink_reset_flag = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 38
	oneb !LOWW(_bink_reset_flag)
	;***       39 : 	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 39
	movw ax, #LOWW(_g_Tick+0x0000C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; return
	;***       40 : 		g_color = g_color == color ? BLACK : color;
	;***       41 : 		handSensorLED(g_color);
	;***       42 : 	}
	;***       43 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 43
	pop hl
	ret
.BB@LABEL@2_2:	; if_then_bb
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 40
	cmp a, !LOWW(_g_color)
	sknz
.BB@LABEL@2_3:	; if_then_bb.bb15_crit_edge
	clrb a
.BB@LABEL@2_4:	; bb15
	mov !LOWW(_g_color), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 41
	pop hl
	br $_handSensorLED
_HandSensorLEDEndBlink:
	.STACK _HandSensorLEDEndBlink = 4
	;***       44 : 
	;***       45 : void HandSensorLEDEndBlink(void) {
	;***       46 : 	if (bink_reset_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 46
	cmp0 !LOWW(_bink_reset_flag)
	sknz
.BB@LABEL@3_1:	; return
	;***       47 : 		handSensorLED(BLACK);
	;***       48 : 		bink_reset_flag = 0;
	;***       49 : 	}
	;***       50 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 50
	ret
.BB@LABEL@3_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 47
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 48
	clrb !LOWW(_bink_reset_flag)
	ret
_isHandSensorON:
	.STACK _isHandSensorON = 4
	;***       51 : 
	;***       52 : /*!
	;***       53 :  * Check state of hand sensor
	;***       54 :  * @return g_machine_state.handsensor
	;***       55 :  */
	;***       56 : uint8_t isHandSensorON(void){
	;***       57 : 	if(hand_sensor_debounce == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 57
	cmp0 !LOWW(_hand_sensor_debounce)
	bnz $.BB@LABEL@4_9
.BB@LABEL@4_1:	; if_then_bb
	;***       58 : 		if(DETECT_U() == I_ON && g_machine_state.handsensor == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 58
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@4_4
.BB@LABEL@4_2:	; bb16
	cmp0 !LOWW(_g_machine_state+0x0000D)
	bnz $.BB@LABEL@4_4
.BB@LABEL@4_3:	; if_then_bb29
	;***       59 : 			setHandSensorON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 59
	call $!_setHandSensorON
	br $.BB@LABEL@4_8
.BB@LABEL@4_4:	; if_else_bb
	;***       60 : 			g_Tick.tickHandSensor[0] = g_systemTime;
	;***       61 : 			hand_sensor_debounce = 1;
	;***       62 : 		}else if(DETECT_U() == I_ON && g_machine_state.handsensor == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 62
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@4_10
.BB@LABEL@4_5:	; bb45
	cmp !LOWW(_g_machine_state+0x0000D), #0x01
	bnz $.BB@LABEL@4_10
.BB@LABEL@4_6:	; if_then_bb58
	;***       63 : 			if(g_machine_state.mode != HAND_WASHING)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 63
	cmp !LOWW(_g_machine_state+0x0000F), #0x01
	skz
.BB@LABEL@4_7:	; if_then_bb64
	;***       64 : 				setHandSensorOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 64
	call $!_setHandSensorOFF
.BB@LABEL@4_8:	; if_break_bb
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0009A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00098), ax
	oneb !LOWW(_hand_sensor_debounce)
	br $.BB@LABEL@4_11
.BB@LABEL@4_9:	; if_else_bb69
	;***       65 : 			g_Tick.tickHandSensor[0] = g_systemTime;
	;***       66 : 			hand_sensor_debounce = 1;
	;***       67 : 		}else{
	;***       68 : 			hand_sensor_debounce = 0;
	;***       69 : 		}
	;***       70 : 	}else{
	;***       71 : 		if(ns_delay_ms(&g_Tick.tickHandSensor[0], 1000))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 71
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00098)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@4_10:	; if_then_bb74
	clrb !LOWW(_hand_sensor_debounce)
.BB@LABEL@4_11:	; if_break_bb76
	;***       72 : 			hand_sensor_debounce = 0;
	;***       73 : 	}
	;***       74 : 
	;***       75 : 	return g_machine_state.handsensor;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 75
	mov a, !LOWW(_g_machine_state+0x0000D)
	;***       76 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 76
	ret
_setHandSensorOFF:
	.STACK _setHandSensorOFF = 4
	;***       77 : 
	;***       78 : void setHandSensorOFF(void){
	;***       79 : 	g_machine_state.handsensor = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 79
	clrb !LOWW(_g_machine_state+0x0000D)
	;***       80 : 	if(g_machine_state.mode != HAND_WASHING)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 80
	cmp !LOWW(_g_machine_state+0x0000F), #0x01
	sknz
.BB@LABEL@5_1:	; return
	;***       81 : 		g_io_status.refined.io.HandSensorOFF = 1U;
	;***       82 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 82
	ret
.BB@LABEL@5_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 81
	set1 !LOWW(_g_io_status+0x00003).5
	ret
_setHandSensorON:
	.STACK _setHandSensorON = 4
	;***       83 : 
	;***       84 : void setHandSensorON(void){
	;***       85 : 	g_machine_state.handsensor = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 85
	oneb !LOWW(_g_machine_state+0x0000D)
	;***       86 : 	if(g_machine_state.mode != HAND_WASHING)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 86
	cmp !LOWW(_g_machine_state+0x0000F), #0x01
	sknz
.BB@LABEL@6_1:	; return
	;***       87 : 		g_io_status.refined.io.HandSensorON = 1U;
	;***       88 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 88
	ret
.BB@LABEL@6_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hand_sensor_interface.c", 87
	set1 !LOWW(_g_io_status+0x00003).4
	ret
	.SECTION .data,DATA
_bink_reset_flag:
	.DS (1)
_hand_sensor_debounce:
	.DS (1)
