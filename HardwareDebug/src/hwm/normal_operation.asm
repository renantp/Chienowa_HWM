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
#@  compiled at Thu May 05 10:01:48 2022

	.EXTERN _g_timerSetting
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_systemTime
	.EXTERN _g_color
	.PUBLIC _g_animation_queue
	.PUBLIC _WaterWashingMode_nostop
	.EXTERN _handSensorLED
	.EXTERN _ns_delay_ms
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
	;***       10 : uint8_t g_animation_queue = 0;
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
.BB@LABEL@1_3:	; switch_clause_bb41
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
	;***       28 : 			g_animation_queue++;
	;***       29 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***       30 : 			(*state)++;
	;***       31 : 		}
	;***       32 : 		break;
	;***       33 : 	case 2:
	;***       34 : 		if (DETECT_D() == I_ON) {
	;***       35 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***       36 : 			g_color = BLACK;
	;***       37 : 			(*state) = 0;
	;***       38 : 			g_machine_state.mode = BUSY;
	;***       39 : 			handSensorLED(g_color);
	;***       40 : 			g_animation_queue++;
	;***       41 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***       42 : 		}
	;***       43 : 		break;
	;***       44 : 	default:
	;***       45 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 45
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
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 30
	inc !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@1_7:	; switch_clause_bb21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 34
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@1_9
.BB@LABEL@1_8:	; if_then_bb35
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 35
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 36
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 37
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 38
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 39
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 40
	inc !LOWW(_g_animation_queue)
.BB@LABEL@1_9:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 48
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***       46 : 		break;
	;***       47 : 	}
	;***       48 : }
	;***       49 : 
	;***       50 : /**
	;***       51 :  * Tested: 24/12/2021 by Mr.An
	;***       52 :  */
	;***       53 : void HandWashingMode_nostop(void) {
	;***       54 : 	uint8_t *state = &g_machine_state.handwash;
	;***       55 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***       56 : 	const uint32_t delayPump_ms = 50;
	;***       57 : 	if ((*state) == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 57
	mov a, !LOWW(_g_machine_state+0x00003)
	mov d, a
	cmp0 a
	bnz $.BB@LABEL@2_10
.BB@LABEL@2_1:	; if_then_bb
	;***       58 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 58
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
	;***       59 : 				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***       60 : 						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***       61 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 61
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
	;***       62 : 				g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***       63 : 						1000 : g_timerSetting.t54_overLapTime_ms;
	;***       64 : 	} else {
	;***       65 : //		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
	;***       66 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       67 : //		}
	;***       68 : 	}
	;***       69 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 69
	cmp0 a
	bz $.BB@LABEL@2_20
.BB@LABEL@2_11:	; if_break_bb
	dec a
	bz $.BB@LABEL@2_21
.BB@LABEL@2_12:	; if_break_bb
	dec a
	bz $.BB@LABEL@2_28
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
	;***       70 : 	case 0:
	;***       71 : 		*state = 1;
	;***       72 : 		*tick = g_systemTime;
	;***       73 : 		g_machine_state.mode = HAND_WASHING;
	;***       74 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***       75 : 		g_Tick.tickAnimation = g_systemTime;
	;***       76 : 		break;
	;***       77 : 	case 1:
	;***       78 : 		//RDVS
	;***       79 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)){
	;***       80 : 			(*state)++;
	;***       81 : 			g_animation_queue++;
	;***       82 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       83 : 			break;
	;***       84 : 		}
	;***       85 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***       86 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***       87 : 			handSensorLED(BLUE);
	;***       88 : 			g_animation_queue++;
	;***       89 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       90 : 			(*state)++;
	;***       91 : 		}
	;***       92 : 		break;
	;***       93 : 	case 2:
	;***       94 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***       95 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***       96 : 			handSensorLED(BLUE);
	;***       97 : 			(*state)++;
	;***       98 : 		}
	;***       99 : 		break;
	;***      100 : 	case 3:
	;***      101 : 		if (ns_delay_ms(tick,
	;***      102 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      103 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      104 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      105 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      106 : 			(*state)++;
	;***      107 : 		}
	;***      108 : 		break;
	;***      109 : 	case 4:
	;***      110 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      111 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      112 : 			handSensorLED(RED);
	;***      113 : 			g_animation_queue++;
	;***      114 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      115 : 			(*state)++;
	;***      116 : 		}
	;***      117 : 		break;
	;***      118 : 	case 5:
	;***      119 : 		if (ns_delay_ms(tick,
	;***      120 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      121 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      122 : 			(*state)++;
	;***      123 : 		}
	;***      124 : 		break;
	;***      125 : 	case 6:
	;***      126 : 		if (ns_delay_ms(tick,
	;***      127 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      128 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      129 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      130 : 			handSensorLED(WHITE);
	;***      131 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      132 : 			g_animation_queue++;
	;***      133 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      134 : 			(*state)++;
	;***      135 : 		}
	;***      136 : 		break;
	;***      137 : 	case 7:
	;***      138 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      139 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      140 : 			(*state)++;
	;***      141 : 		}
	;***      142 : 		break;
	;***      143 : 	case 8:
	;***      144 : 		if (ns_delay_ms(tick,
	;***      145 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      146 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      147 : 			handSensorLED(BLACK);
	;***      148 : 			(*state) = 0;
	;***      149 : 			g_machine_state.mode = BUSY;
	;***      150 : 			g_animation_queue++;
	;***      151 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      152 : 		}
	;***      153 : 		break;
	;***      154 : 	default:
	;***      155 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 155
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@2_20:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 71
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 72
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 73
	oneb !LOWW(_g_machine_state+0x0000E)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 74
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 75
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	ret
.BB@LABEL@2_21:	; switch_clause_bb35
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 79
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_26
.BB@LABEL@2_22:	; if_break_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 85
	clrw ax
	movw de, ax
	mov c, #0x32
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_33
.BB@LABEL@2_23:	; if_then_bb55
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 86
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 87
	mov a, #0x03
.BB@LABEL@2_24:	; if_then_bb55
	call !!_handSensorLED
.BB@LABEL@2_25:	; if_then_bb55
	inc !LOWW(_g_animation_queue)
	br $.BB@LABEL@2_35
.BB@LABEL@2_26:	; if_then_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 80
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@2_27:	; if_then_bb40
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 159
	ret
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 101
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 104
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 105
	set1 0xFFF07.6
.BB@LABEL@2_35:	; if_then_bb84
	br $.BB@LABEL@2_43
.BB@LABEL@2_36:	; switch_clause_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 110
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 111
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 112
	oneb a
	br $.BB@LABEL@2_24
.BB@LABEL@2_39:	; switch_clause_bb103
	movw ax, #0xFFCE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 119
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 121
	clr1 0xFFF07.7
.BB@LABEL@2_43:	; if_then_bb112
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 159
	ret
.BB@LABEL@2_44:	; switch_clause_bb117
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 126
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 129
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 130
	mov a, #0x02
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 131
	set1 0xFFF05.5
	br $!.BB@LABEL@2_25
.BB@LABEL@2_49:	; switch_clause_bb134
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 138
	movw bc, !LOWW(_g_timerSetting+0x00074)
	movw de, !LOWW(_g_timerSetting+0x00076)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_50:	; switch_clause_bb134
	bz $.BB@LABEL@2_54
.BB@LABEL@2_51:	; if_then_bb141
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 139
	clr1 0xFFF07.6
	br $.BB@LABEL@2_43
.BB@LABEL@2_52:	; switch_clause_bb146
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 144
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 146
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 147
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 148
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 149
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	br $!.BB@LABEL@2_27
.BB@LABEL@2_54:	; return
	;***      156 : 		break;
	;***      157 : 	}
	;***      158 : 
	;***      159 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 159
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      160 : /**
	;***      161 :  * Tested: 24/12/2021 by Mr.An
	;***      162 :  */
	;***      163 : void AcidWaterMode_nostop(void) {
	;***      164 : 	uint8_t *state = &g_machine_state.acid;
	;***      165 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      166 : 	const uint32_t delayPump_ms = 50;
	;***      167 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 167
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
	dec a
	.bz $!.BB@LABEL@3_18
.BB@LABEL@3_5:	; switch_clause_bb113
	;***      168 : 	case 0:
	;***      169 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      170 : 		g_machine_state.mode = ACID_WASHING;
	;***      171 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      172 : 		g_color = RED;
	;***      173 : 		handSensorLED(g_color);
	;***      174 : 		*state = 1;
	;***      175 : 		*tick = g_systemTime;
	;***      176 : 		break;
	;***      177 : 	case 1:
	;***      178 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      179 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      180 : 			(*state)++;
	;***      181 : 			g_Tick.tickAnimation = g_systemTime;
	;***      182 : 		}
	;***      183 : 		break;
	;***      184 : 	case 2:
	;***      185 : 		//RDVS
	;***      186 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)){
	;***      187 : 			g_animation_queue++;
	;***      188 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      189 : 			(*state)++;
	;***      190 : 		}
	;***      191 : 		//TODO: Change turn OFF signal here
	;***      192 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      193 : 				|| (DETECT_D() == I_ON)) {
	;***      194 : 			g_animation_queue++;
	;***      195 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      196 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      197 : 			(*state)++;
	;***      198 : 		}
	;***      199 : 		break;
	;***      200 : 	case 3:
	;***      201 : 		//TODO: Change turn OFF signal here
	;***      202 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      203 : 				|| (DETECT_D() == I_ON)) {
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
	;***      218 : 		g_animation_queue++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 218
	inc !LOWW(_g_animation_queue)
	;***      219 : //		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      220 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 220
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@3_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 170
	mov !LOWW(_g_machine_state+0x0000E), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 171
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 172
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 173
	oneb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 174
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 175
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@3_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 178
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	.bz $!.BB@LABEL@3_20
.BB@LABEL@3_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 179
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 180
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 181
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	ret
.BB@LABEL@3_9:	; switch_clause_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 186
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 187
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 189
	inc !LOWW(_g_machine_state+0x00001)
.BB@LABEL@3_11:	; if_break_bb31
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 192
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
	bt a.4, $.BB@LABEL@3_20
.BB@LABEL@3_13:	; if_then_bb59
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 194
	inc !LOWW(_g_animation_queue)
	br $.BB@LABEL@3_16
.BB@LABEL@3_14:	; switch_clause_bb66
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
.BB@LABEL@3_15:	; bb73
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@3_20
.BB@LABEL@3_16:	; if_then_bb96
	clr1 0xFFF06.2
.BB@LABEL@3_17:	; if_then_bb96
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 223
	ret
.BB@LABEL@3_18:	; switch_clause_bb101
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 209
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_20
.BB@LABEL@3_19:	; if_then_bb107
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 210
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 211
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 212
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@3_17
.BB@LABEL@3_20:	; return
	;***      221 : 		break;
	;***      222 : 	}
	;***      223 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 223
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      224 : /**
	;***      225 :  * Tested: 24/12/2021 by Mr.An
	;***      226 :  */
	;***      227 : void AlkalineWaterMode_nostop(void) {
	;***      228 : 	uint8_t *state = &g_machine_state.akaline;
	;***      229 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      230 : 	const uint32_t delayPump_ms = 50;
	;***      231 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 231
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
	dec a
	.bz $!.BB@LABEL@4_19
.BB@LABEL@4_5:	; switch_clause_bb113
	;***      232 : 	case 0:
	;***      233 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      234 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      235 : 		*state = 1;
	;***      236 : 		*tick = g_systemTime;
	;***      237 : 		break;
	;***      238 : 	case 1:
	;***      239 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      240 : 		g_color = BLUE;
	;***      241 : 		handSensorLED(g_color);
	;***      242 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      243 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***      244 : 			g_Tick.tickAnimation = g_systemTime;
	;***      245 : 			(*state)++;
	;***      246 : 		}
	;***      247 : 		break;
	;***      248 : 	case 2:
	;***      249 : 		//RDVS
	;***      250 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)){
	;***      251 : 			g_animation_queue++;
	;***      252 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      253 : 			(*state)++;
	;***      254 : 		}
	;***      255 : 		//TODO: Change turn OFF signal here
	;***      256 : 		if (ns_delay_ms(tick, g_timerSetting.t57_alkalineWaterDownTime_s * 1000)
	;***      257 : 						|| (DETECT_D() == I_ON)) {
	;***      258 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      259 : 			g_animation_queue++;
	;***      260 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      261 : 			(*state)++;
	;***      262 : 		}
	;***      263 : 		break;
	;***      264 : 	case 3:
	;***      265 : 		//TODO: Change turn OFF signal here
	;***      266 : 		if (ns_delay_ms(tick, g_timerSetting.t57_alkalineWaterDownTime_s * 1000)
	;***      267 : 				|| (DETECT_D() == I_ON)) {
	;***      268 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      269 : 			(*state)++;
	;***      270 : 		}
	;***      271 : 		break;
	;***      272 : 	case 4:
	;***      273 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      274 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      275 : 			g_color = BLACK;
	;***      276 : 			handSensorLED(g_color);
	;***      277 : 			(*state)++;
	;***      278 : 		}
	;***      279 : 		break;
	;***      280 : 	default:
	;***      281 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 281
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      282 : 		g_animation_queue++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 282
	inc !LOWW(_g_animation_queue)
	;***      283 : //		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      284 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 284
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@4_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 234
	mov !LOWW(_g_machine_state+0x0000E), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 235
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 236
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@4_7:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 239
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 240
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 241
	mov a, #0x03
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 242
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	.bz $!.BB@LABEL@4_21
.BB@LABEL@4_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 243
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 244
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	br $.BB@LABEL@4_14
.BB@LABEL@4_9:	; switch_clause_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 250
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_11
.BB@LABEL@4_10:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 251
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 253
	inc !LOWW(_g_machine_state)
.BB@LABEL@4_11:	; if_break_bb31
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 256
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
	bt a.4, $.BB@LABEL@4_21
.BB@LABEL@4_13:	; if_then_bb59
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 258
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 259
	inc !LOWW(_g_animation_queue)
.BB@LABEL@4_14:	; if_then_bb59
	br $.BB@LABEL@4_18
.BB@LABEL@4_15:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 266
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
.BB@LABEL@4_16:	; bb73
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@4_21
.BB@LABEL@4_17:	; if_then_bb96
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 268
	clr1 0xFFF06.1
.BB@LABEL@4_18:	; if_then_bb96
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 287
	ret
.BB@LABEL@4_19:	; switch_clause_bb101
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 273
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_21
.BB@LABEL@4_20:	; if_then_bb107
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 274
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 275
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 276
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@4_18
.BB@LABEL@4_21:	; return
	;***      285 : 		break;
	;***      286 : 	}
	;***      287 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 287
	ret
	.SECTION .data,DATA
_g_animation_queue:
	.DS (1)
