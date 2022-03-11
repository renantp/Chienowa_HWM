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
#@   -o src/hwm/normal_operation.obj
#@   ../src/hwm/normal_operation.c
#@  compiled at Wed Mar 09 14:07:30 2022

	.EXTERN _g_timerSetting
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_systemTime
	.EXTERN _g_color
	.PUBLIC _g_animation_queue
	.PUBLIC _WaterWashingMode_nostop
	.EXTERN _handSensorLED
	.EXTERN _ns_delay_ms
	.EXTERN _sendToRasPi_f
	.PUBLIC _HandWashingMode_nostop
	.PUBLIC _AcidWaterMode_nostop
	.PUBLIC _AlkalineWaterMode_nostop

	.SECTION .textf,TEXTF
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***        1 : /*
	;***        2 :  * normal_operation.c
	;***        3 :  *
	;***        4 :  *  Created on: 6 Jan 2022
	;***        5 :  *      Author: Hung
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "normal_operation.h"
	;***        9 : 
	;***       10 : uint8_t g_animation_queue;
	;***       11 : /**
	;***       12 :  * Tested: 10/12/2021 by Mr.An
	;***       13 :  */
	;***       14 : void WaterWashingMode_nostop(void) {
	;***       15 : 	uint8_t *state = &g_machine_state.water;
	;***       16 : 	uint32_t *tick = &g_Tick.tickWater;
	;***       17 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 17
	mov a, !LOWW(_g_machine_state+0x00002)
	cmp0 a
	bz $.BB@LABEL@1_4
.BB@LABEL@1_1:	; entry
	dec a
	bz $.BB@LABEL@1_5
.BB@LABEL@1_2:	; entry
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_3:	; switch_clause_bb38
	;***       18 : 	case 0:
	;***       19 : 		g_machine_state.mode = WATER_WASHING;
	;***       20 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***       21 : 		g_color = WHITE;
	;***       22 : 		*tick = g_systemTime;
	;***       23 : 		(*state)++;
	;***       24 : 		handSensorLED(g_color);
	;***       25 : 		break;
	;***       26 : 	case 1:
	;***       27 : 		if (ns_delay_ms(tick, 100)) {
	;***       28 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***       29 : 			(*state)++;
	;***       30 : 		}
	;***       31 : 		break;
	;***       32 : 	case 2:
	;***       33 : 		if (DETECT_U() == I_ON) {
	;***       34 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***       35 : 			g_color = BLACK;
	;***       36 : 			(*state) = 0;
	;***       37 : 			g_machine_state.mode = BUSY;
	;***       38 : 			handSensorLED(g_color);
	;***       39 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***       40 : 		}
	;***       41 : 		break;
	;***       42 : 	default:
	;***       43 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 43
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@1_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 19
	mov !LOWW(_g_machine_state+0x0000E), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 20
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 21
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 22
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 23
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 24
	mov a, #0x02
	br !!_handSensorLED
.BB@LABEL@1_5:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 27
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x00018)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@1_9
.BB@LABEL@1_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 28
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 29
	inc !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@1_7:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 33
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_9
.BB@LABEL@1_8:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 34
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 35
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 36
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 37
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 38
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 39
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br !!_sendToRasPi_f
.BB@LABEL@1_9:	; return
	;***       44 : 		break;
	;***       45 : 	}
	;***       46 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 46
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***       47 : 
	;***       48 : /**
	;***       49 :  * Tested: 24/12/2021 by Mr.An
	;***       50 :  */
	;***       51 : void HandWashingMode_nostop(void) {
	;***       52 : 	uint8_t *state = &g_machine_state.handwash;
	;***       53 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***       54 : 	const uint32_t delayPump_ms = 50;
	;***       55 : 	if ((*state) == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 55
	mov a, !LOWW(_g_machine_state+0x00003)
	mov d, a
	cmp0 a
	bnz $.BB@LABEL@2_10
.BB@LABEL@2_1:	; if_then_bb
	;***       56 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 56
	movw ax, !LOWW(_g_timerSetting+0x00076)
	movw bc, ax
	cmpw ax, #0x0000
	movw ax, !LOWW(_g_timerSetting+0x00074)
	movw hl, ax
	sknz
.BB@LABEL@2_2:	; if_then_bb
	cmpw ax, #0x0032
.BB@LABEL@2_3:	; if_then_bb
	bnc $.BB@LABEL@2_5
.BB@LABEL@2_4:	; if_then_bb.bb22_crit_edge
	clrw bc
	movw ax, #0x0032
	br $.BB@LABEL@2_9
.BB@LABEL@2_5:	; bb15
	movw ax, bc
	;***       57 : 				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***       58 : 						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***       59 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 59
	cmpw ax, #0x0000
	movw ax, hl
	sknz
.BB@LABEL@2_6:	; bb15
	cmpw ax, #0x03E9
.BB@LABEL@2_7:	; bb15
	bc $.BB@LABEL@2_9
.BB@LABEL@2_8:	; bb15.bb25_crit_edge
	clrw bc
	movw ax, #0x03E8
.BB@LABEL@2_9:	; bb25
	movw !LOWW(_g_timerSetting+0x00074), ax
	movw ax, bc
	movw !LOWW(_g_timerSetting+0x00076), ax
.BB@LABEL@2_10:	; if_break_bb
	mov a, d
	;***       60 : 				g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***       61 : 						1000 : g_timerSetting.t54_overLapTime_ms;
	;***       62 : 	} else {
	;***       63 : //		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
	;***       64 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       65 : //		}
	;***       66 : 	}
	;***       67 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 67
	cmp0 a
	bz $.BB@LABEL@2_20
.BB@LABEL@2_11:	; if_break_bb
	dec a
	bz $.BB@LABEL@2_21
.BB@LABEL@2_12:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_28
.BB@LABEL@2_13:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_30
.BB@LABEL@2_14:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_36
.BB@LABEL@2_15:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_39
.BB@LABEL@2_16:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_44
.BB@LABEL@2_17:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_49
.BB@LABEL@2_18:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_52
.BB@LABEL@2_19:	; switch_clause_bb159
	;***       68 : 	case 0:
	;***       69 : 		*state = 1;
	;***       70 : 		*tick = g_systemTime;
	;***       71 : 		g_machine_state.mode = HAND_WASHING;
	;***       72 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***       73 : 		g_Tick.tickAnimation = g_systemTime;
	;***       74 : 		break;
	;***       75 : 	case 1:
	;***       76 : 		//RDVS
	;***       77 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)){
	;***       78 : 			(*state)++;
	;***       79 : 			g_animation_queue++;
	;***       80 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       81 : 			break;
	;***       82 : 		}
	;***       83 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***       84 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***       85 : 			handSensorLED(BLUE);
	;***       86 : 			g_animation_queue++;
	;***       87 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       88 : 			(*state)++;
	;***       89 : //			g_Tick.tickAnimation = g_systemTime;
	;***       90 : //			g_machine_state.waitAnimationRes = 1;
	;***       91 : 		}
	;***       92 : 		break;
	;***       93 : 	case 2:
	;***       94 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***       95 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***       96 : 			handSensorLED(BLUE);
	;***       97 : 			(*state)++;
	;***       98 : //			g_Tick.tickAnimation = g_systemTime;
	;***       99 : //			g_machine_state.waitAnimationRes = 1;
	;***      100 : 		}
	;***      101 : 		break;
	;***      102 : 	case 3:
	;***      103 : 		if (ns_delay_ms(tick,
	;***      104 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      105 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      106 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      107 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      108 : 			(*state)++;
	;***      109 : 		}
	;***      110 : 		break;
	;***      111 : 	case 4:
	;***      112 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      113 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      114 : 			handSensorLED(RED);
	;***      115 : 			g_animation_queue++;
	;***      116 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      117 : 			(*state)++;
	;***      118 : 		}
	;***      119 : 		break;
	;***      120 : 	case 5:
	;***      121 : 		if (ns_delay_ms(tick,
	;***      122 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      123 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      124 : 			(*state)++;
	;***      125 : 		}
	;***      126 : 		break;
	;***      127 : 	case 6:
	;***      128 : 		if (ns_delay_ms(tick,
	;***      129 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      130 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      131 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      132 : 			handSensorLED(WHITE);
	;***      133 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      134 : 			g_animation_queue++;
	;***      135 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      136 : 			(*state)++;
	;***      137 : 		}
	;***      138 : 		break;
	;***      139 : 	case 7:
	;***      140 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      141 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      142 : 			(*state)++;
	;***      143 : 		}
	;***      144 : 		break;
	;***      145 : 	case 8:
	;***      146 : 		if (ns_delay_ms(tick,
	;***      147 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      148 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      149 : 			handSensorLED(BLACK);
	;***      150 : 			(*state) = 0;
	;***      151 : 			g_machine_state.mode = BUSY;
	;***      152 : 			g_animation_queue++;
	;***      153 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      154 : 		}
	;***      155 : 		break;
	;***      156 : 	default:
	;***      157 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 157
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@2_20:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 69
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 70
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 71
	oneb !LOWW(_g_machine_state+0x0000E)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 72
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 73
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	ret
.BB@LABEL@2_21:	; switch_clause_bb35
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 77
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_26
.BB@LABEL@2_22:	; if_break_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 83
	clrw ax
	movw de, ax
	mov c, #0x32
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_33
.BB@LABEL@2_23:	; if_then_bb55
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 84
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 85
	mov a, #0x03
.BB@LABEL@2_24:	; if_then_bb55
	call !!_handSensorLED
.BB@LABEL@2_25:	; if_then_bb55
	inc !LOWW(_g_animation_queue)
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call !!_sendToRasPi_f
	br $.BB@LABEL@2_35
.BB@LABEL@2_26:	; if_then_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 78
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@2_27:	; if_then_bb40
	inc !LOWW(_g_animation_queue)
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br !!_sendToRasPi_f
.BB@LABEL@2_28:	; switch_clause_bb62
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 94
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_37
.BB@LABEL@2_29:	; if_then_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 95
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 96
	mov a, #0x03
	call !!_handSensorLED
	br $.BB@LABEL@2_43
.BB@LABEL@2_30:	; switch_clause_bb74
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 103
	movw ax, !LOWW(_g_timerSetting+0x00068)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0006A)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x00074)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@2_31:	; switch_clause_bb74
	decw ax
.BB@LABEL@2_32:	; switch_clause_bb74
	subw ax, !LOWW(_g_timerSetting+0x00076)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_33:	; switch_clause_bb74
	bz $.BB@LABEL@2_47
.BB@LABEL@2_34:	; if_then_bb84
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 106
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 107
	set1 0xFFF07.6
.BB@LABEL@2_35:	; if_then_bb84
	br $.BB@LABEL@2_43
.BB@LABEL@2_36:	; switch_clause_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 112
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_37:	; switch_clause_bb89
	bz $.BB@LABEL@2_47
.BB@LABEL@2_38:	; if_then_bb96
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 113
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 114
	oneb a
	br $!.BB@LABEL@2_24
.BB@LABEL@2_39:	; switch_clause_bb103
	movw ax, #0xFFCE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 121
	addw ax, !LOWW(_g_timerSetting+0x00074)
	movw bc, ax
	clrw ax
	decw ax
	sknc
.BB@LABEL@2_40:	; switch_clause_bb103
	incw ax
.BB@LABEL@2_41:	; switch_clause_bb103
	addw ax, !LOWW(_g_timerSetting+0x00076)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_50
.BB@LABEL@2_42:	; if_then_bb112
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 123
	clr1 0xFFF07.7
.BB@LABEL@2_43:	; if_then_bb112
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 161
	ret
.BB@LABEL@2_44:	; switch_clause_bb117
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 128
	movw ax, !LOWW(_g_timerSetting+0x0006C)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0006E)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x00074)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@2_45:	; switch_clause_bb117
	decw ax
.BB@LABEL@2_46:	; switch_clause_bb117
	subw ax, !LOWW(_g_timerSetting+0x00076)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_47:	; switch_clause_bb117
	bz $.BB@LABEL@2_54
.BB@LABEL@2_48:	; if_then_bb127
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 131
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 132
	mov a, #0x02
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 133
	set1 0xFFF05.5
	br $!.BB@LABEL@2_25
.BB@LABEL@2_49:	; switch_clause_bb134
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 140
	movw bc, !LOWW(_g_timerSetting+0x00074)
	movw de, !LOWW(_g_timerSetting+0x00076)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_50:	; switch_clause_bb134
	bz $.BB@LABEL@2_54
.BB@LABEL@2_51:	; if_then_bb141
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 141
	clr1 0xFFF07.6
	br $.BB@LABEL@2_43
.BB@LABEL@2_52:	; switch_clause_bb146
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 146
	movw ax, !LOWW(_g_timerSetting+0x00070)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00072)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_54
.BB@LABEL@2_53:	; if_then_bb154
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 148
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 149
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 150
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 151
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	br $!.BB@LABEL@2_27
.BB@LABEL@2_54:	; return
	;***      158 : 		break;
	;***      159 : 	}
	;***      160 : 
	;***      161 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 161
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      162 : /**
	;***      163 :  * Tested: 24/12/2021 by Mr.An
	;***      164 :  */
	;***      165 : void AcidWaterMode_nostop(void) {
	;***      166 : 	uint8_t *state = &g_machine_state.acid;
	;***      167 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      168 : 	const uint32_t delayPump_ms = 50;
	;***      169 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 169
	mov a, !LOWW(_g_machine_state+0x00001)
	cmp0 a
	bz $.BB@LABEL@3_6
.BB@LABEL@3_1:	; entry
	dec a
	bz $.BB@LABEL@3_7
.BB@LABEL@3_2:	; entry
	dec a
	bz $.BB@LABEL@3_9
.BB@LABEL@3_3:	; entry
	dec a
	.bz $!.BB@LABEL@3_14
.BB@LABEL@3_4:	; entry
	movw de, #0x0000
	dec a
	.bz $!.BB@LABEL@3_18
.BB@LABEL@3_5:	; switch_clause_bb109
	;***      170 : 	case 0:
	;***      171 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      172 : 		g_machine_state.mode = ACID_WASHING;
	;***      173 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      174 : 		g_color = RED;
	;***      175 : 		handSensorLED(g_color);
	;***      176 : 		*state = 1;
	;***      177 : 		*tick = g_systemTime;
	;***      178 : 		break;
	;***      179 : 	case 1:
	;***      180 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      181 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      182 : 			(*state)++;
	;***      183 : 			g_Tick.tickAnimation = g_systemTime;
	;***      184 : 		}
	;***      185 : 		break;
	;***      186 : 	case 2:
	;***      187 : 		//RDVS
	;***      188 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)){
	;***      189 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      190 : 			(*state)++;
	;***      191 : 		}
	;***      192 : 		//TODO: Change turn OFF signal here
	;***      193 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      194 : 				|| (DETECT_U() == I_ON)) {
	;***      195 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      196 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      197 : 			(*state)++;
	;***      198 : 		}
	;***      199 : 		break;
	;***      200 : 	case 3:
	;***      201 : 		//TODO: Change turn OFF signal here
	;***      202 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      203 : 				|| (DETECT_U() == I_ON)) {
	;***      204 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      205 : 			(*state)++;
	;***      206 : 		}
	;***      207 : 		break;
	;***      208 : 	case 4:
	;***      209 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      210 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      211 : 			g_color = BLACK;
	;***      212 : 			handSensorLED(g_color);
	;***      213 : 			(*state)++;
	;***      214 : 		}
	;***      215 : 		break;
	;***      216 : 	default:
	;***      217 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 217
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      218 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 218
	clrw bc
	movw ax, #0x5313
	call !!_sendToRasPi_f
	;***      219 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 219
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@3_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 172
	mov !LOWW(_g_machine_state+0x0000E), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 173
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 174
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 175
	oneb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 176
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 177
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@3_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 180
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	.bz $!.BB@LABEL@3_20
.BB@LABEL@3_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 181
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 182
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 183
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	ret
.BB@LABEL@3_9:	; switch_clause_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 188
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 189
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 190
	inc !LOWW(_g_machine_state+0x00001)
.BB@LABEL@3_11:	; if_break_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 193
	movw ax, !LOWW(_g_timerSetting+0x0007C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0007E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@3_13
.BB@LABEL@3_12:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@3_20
.BB@LABEL@3_13:	; if_then_bb57
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 195
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call !!_sendToRasPi_f
	br $.BB@LABEL@3_16
.BB@LABEL@3_14:	; switch_clause_bb62
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 202
	movw ax, !LOWW(_g_timerSetting+0x0007C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0007E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@3_16
.BB@LABEL@3_15:	; bb69
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@3_20
.BB@LABEL@3_16:	; if_then_bb92
	clr1 0xFFF06.2
.BB@LABEL@3_17:	; if_then_bb92
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 222
	ret
.BB@LABEL@3_18:	; switch_clause_bb97
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 209
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_20
.BB@LABEL@3_19:	; if_then_bb103
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 210
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 211
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 212
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@3_17
.BB@LABEL@3_20:	; return
	;***      220 : 		break;
	;***      221 : 	}
	;***      222 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 222
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      223 : /**
	;***      224 :  * Tested: 24/12/2021 by Mr.An
	;***      225 :  */
	;***      226 : void AlkalineWaterMode_nostop(void) {
	;***      227 : 	uint8_t *state = &g_machine_state.akaline;
	;***      228 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      229 : 	const uint32_t delayPump_ms = 50;
	;***      230 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 230
	mov a, !LOWW(_g_machine_state)
	cmp0 a
	bz $.BB@LABEL@4_6
.BB@LABEL@4_1:	; entry
	dec a
	bz $.BB@LABEL@4_7
.BB@LABEL@4_2:	; entry
	dec a
	bz $.BB@LABEL@4_9
.BB@LABEL@4_3:	; entry
	dec a
	.bz $!.BB@LABEL@4_15
.BB@LABEL@4_4:	; entry
	movw de, #0x0000
	dec a
	.bz $!.BB@LABEL@4_19
.BB@LABEL@4_5:	; switch_clause_bb109
	;***      231 : 	case 0:
	;***      232 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      233 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      234 : 		*state = 1;
	;***      235 : 		*tick = g_systemTime;
	;***      236 : 		break;
	;***      237 : 	case 1:
	;***      238 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      239 : 		g_color = BLUE;
	;***      240 : 		handSensorLED(g_color);
	;***      241 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      242 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***      243 : 			g_Tick.tickAnimation = g_systemTime;
	;***      244 : 			(*state)++;
	;***      245 : 		}
	;***      246 : 		break;
	;***      247 : 	case 2:
	;***      248 : 		//RDVS
	;***      249 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)){
	;***      250 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      251 : 			(*state)++;
	;***      252 : 		}
	;***      253 : 		//TODO: Change turn OFF signal here
	;***      254 : 		if (ns_delay_ms(tick, g_timerSetting.t57_alkalineWaterDownTime_s * 1000)
	;***      255 : 						|| (DETECT_U() == I_ON)) {
	;***      256 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      257 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      258 : 			(*state)++;
	;***      259 : 		}
	;***      260 : 		break;
	;***      261 : 	case 3:
	;***      262 : 		//TODO: Change turn OFF signal here
	;***      263 : 		if (ns_delay_ms(tick, g_timerSetting.t57_alkalineWaterDownTime_s * 1000)
	;***      264 : 				|| (DETECT_U() == I_ON)) {
	;***      265 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      266 : 			(*state)++;
	;***      267 : 		}
	;***      268 : 		break;
	;***      269 : 	case 4:
	;***      270 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      271 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      272 : 			g_color = BLACK;
	;***      273 : 			handSensorLED(g_color);
	;***      274 : 			(*state)++;
	;***      275 : 		}
	;***      276 : 		break;
	;***      277 : 	default:
	;***      278 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 278
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      279 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 279
	clrw bc
	movw ax, #0x5313
	call !!_sendToRasPi_f
	;***      280 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 280
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@4_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 233
	mov !LOWW(_g_machine_state+0x0000E), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 234
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 235
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@4_7:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 238
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 239
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 240
	mov a, #0x03
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 241
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	.bz $!.BB@LABEL@4_21
.BB@LABEL@4_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 242
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 243
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	br $.BB@LABEL@4_14
.BB@LABEL@4_9:	; switch_clause_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 249
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_11
.BB@LABEL@4_10:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 250
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 251
	inc !LOWW(_g_machine_state)
.BB@LABEL@4_11:	; if_break_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 254
	movw ax, !LOWW(_g_timerSetting+0x00080)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00082)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@4_13
.BB@LABEL@4_12:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@4_21
.BB@LABEL@4_13:	; if_then_bb57
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 256
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 257
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call !!_sendToRasPi_f
.BB@LABEL@4_14:	; if_then_bb57
	br $.BB@LABEL@4_18
.BB@LABEL@4_15:	; switch_clause_bb62
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 263
	movw ax, !LOWW(_g_timerSetting+0x00080)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00082)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@4_17
.BB@LABEL@4_16:	; bb69
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@4_21
.BB@LABEL@4_17:	; if_then_bb92
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 265
	clr1 0xFFF06.1
.BB@LABEL@4_18:	; if_then_bb92
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 283
	ret
.BB@LABEL@4_19:	; switch_clause_bb97
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 270
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_21
.BB@LABEL@4_20:	; if_then_bb103
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 271
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 272
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 273
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@4_18
.BB@LABEL@4_21:	; return
	;***      281 : 		break;
	;***      282 : 	}
	;***      283 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 283
	ret
	.SECTION .bss,BSS
_g_animation_queue:
	.DS (1)
