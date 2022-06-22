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
#@  compiled at Wed Jun 22 12:09:18 2022

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
	movw ax, !LOWW(_g_timerSetting+0x0007E)
	movw bc, ax
	cmpw ax, #0x0000
	movw ax, !LOWW(_g_timerSetting+0x0007C)
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
	movw !LOWW(_g_timerSetting+0x0007C), ax
	movw ax, bc
	movw !LOWW(_g_timerSetting+0x0007E), ax
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
	bz $.BB@LABEL@2_29
.BB@LABEL@2_14:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_34
.BB@LABEL@2_15:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_37
.BB@LABEL@2_16:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_42
.BB@LABEL@2_17:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_47
.BB@LABEL@2_18:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@2_50
.BB@LABEL@2_19:	; switch_clause_bb151
	;***       70 : 	case 0:
	;***       71 : 		*state = 1;
	;***       72 : 		*tick = g_systemTime;
	;***       73 : 		g_machine_state.mode = HAND_WASHING;
	;***       74 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***       75 : 		g_Tick.tickAnimation = g_systemTime;
	;***       76 : 		break;
	;***       77 : 	case 1:
	;***       78 : 		//RDVS
	;***       79 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)) {
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
	;***       94 : //		if (ns_delay_ms(tick, delayPump_ms)) {
	;***       95 : //			O_ALK_PUMP_PIN_P2 = ON;
	;***       96 : //			handSensorLED(BLUE);
	;***       97 : //			(*state)++;
	;***       98 : //		}
	;***       99 : 		(*state)++;
	;***      100 : 		break;
	;***      101 : 	case 3:
	;***      102 : 		if (ns_delay_ms(tick,
	;***      103 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      104 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      105 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      106 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      107 : 			(*state)++;
	;***      108 : 		}
	;***      109 : 		break;
	;***      110 : 	case 4:
	;***      111 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      112 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      113 : 			handSensorLED(RED);
	;***      114 : 			g_animation_queue++;
	;***      115 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      116 : 			(*state)++;
	;***      117 : 		}
	;***      118 : 		break;
	;***      119 : 	case 5:
	;***      120 : 		if (ns_delay_ms(tick,
	;***      121 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      122 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      123 : 			(*state)++;
	;***      124 : 		}
	;***      125 : 		break;
	;***      126 : 	case 6:
	;***      127 : 		if (ns_delay_ms(tick,
	;***      128 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      129 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      130 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      131 : 			handSensorLED(WHITE);
	;***      132 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      133 : 			g_animation_queue++;
	;***      134 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      135 : 			(*state)++;
	;***      136 : 		}
	;***      137 : 		break;
	;***      138 : 	case 7:
	;***      139 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      140 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      141 : 			(*state)++;
	;***      142 : 		}
	;***      143 : 		break;
	;***      144 : 	case 8:
	;***      145 : 		if (ns_delay_ms(tick,
	;***      146 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      147 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      148 : 			handSensorLED(BLACK);
	;***      149 : 			(*state) = 0;
	;***      150 : 			g_machine_state.mode = BUSY;
	;***      151 : 			g_animation_queue++;
	;***      152 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      153 : 		}
	;***      154 : 		break;
	;***      155 : 	default:
	;***      156 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 156
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
	bz $.BB@LABEL@2_35
.BB@LABEL@2_23:	; if_then_bb55
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 86
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 87
	mov a, #0x03
.BB@LABEL@2_24:	; if_then_bb55
	call !!_handSensorLED
.BB@LABEL@2_25:	; if_then_bb55
	inc !LOWW(_g_animation_queue)
	br $.BB@LABEL@2_33
.BB@LABEL@2_26:	; if_then_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 80
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@2_27:	; if_then_bb40
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 160
	ret
.BB@LABEL@2_28:	; switch_clause_bb62
	mov a, d
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 99
	inc a
	mov !LOWW(_g_machine_state+0x00003), a
	ret
.BB@LABEL@2_29:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 102
	movw ax, !LOWW(_g_timerSetting+0x00070)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x00072)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x0007C)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@2_30:	; switch_clause_bb66
	decw ax
.BB@LABEL@2_31:	; switch_clause_bb66
	subw ax, !LOWW(_g_timerSetting+0x0007E)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_45
.BB@LABEL@2_32:	; if_then_bb76
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 105
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 106
	set1 0xFFF07.6
.BB@LABEL@2_33:	; if_then_bb76
	br $.BB@LABEL@2_41
.BB@LABEL@2_34:	; switch_clause_bb81
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 111
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_35:	; switch_clause_bb81
	bz $.BB@LABEL@2_45
.BB@LABEL@2_36:	; if_then_bb88
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 112
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 113
	oneb a
	br $.BB@LABEL@2_24
.BB@LABEL@2_37:	; switch_clause_bb95
	movw ax, #0xFFCE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 120
	addw ax, !LOWW(_g_timerSetting+0x0007C)
	movw bc, ax
	clrw ax
	decw ax
	sknc
.BB@LABEL@2_38:	; switch_clause_bb95
	incw ax
.BB@LABEL@2_39:	; switch_clause_bb95
	addw ax, !LOWW(_g_timerSetting+0x0007E)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_48
.BB@LABEL@2_40:	; if_then_bb104
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 122
	clr1 0xFFF07.7
.BB@LABEL@2_41:	; if_then_bb104
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 160
	ret
.BB@LABEL@2_42:	; switch_clause_bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 127
	movw ax, !LOWW(_g_timerSetting+0x00074)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x00076)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x0007C)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@2_43:	; switch_clause_bb109
	decw ax
.BB@LABEL@2_44:	; switch_clause_bb109
	subw ax, !LOWW(_g_timerSetting+0x0007E)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_45:	; switch_clause_bb109
	bz $.BB@LABEL@2_52
.BB@LABEL@2_46:	; if_then_bb119
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 130
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 131
	mov a, #0x02
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 132
	set1 0xFFF05.5
	br $!.BB@LABEL@2_25
.BB@LABEL@2_47:	; switch_clause_bb126
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 139
	movw bc, !LOWW(_g_timerSetting+0x0007C)
	movw de, !LOWW(_g_timerSetting+0x0007E)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_48:	; switch_clause_bb126
	bz $.BB@LABEL@2_52
.BB@LABEL@2_49:	; if_then_bb133
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 140
	clr1 0xFFF07.6
	br $.BB@LABEL@2_41
.BB@LABEL@2_50:	; switch_clause_bb138
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 145
	movw ax, !LOWW(_g_timerSetting+0x00078)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0007A)
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
	bz $.BB@LABEL@2_52
.BB@LABEL@2_51:	; if_then_bb146
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 147
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 148
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 149
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 150
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	br $!.BB@LABEL@2_27
.BB@LABEL@2_52:	; return
	;***      157 : 		break;
	;***      158 : 	}
	;***      159 : 
	;***      160 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 160
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      161 : /**
	;***      162 :  * Tested: 24/12/2021 by Mr.An
	;***      163 :  */
	;***      164 : void AcidWaterMode_nostop(void) {
	;***      165 : 	uint8_t *state = &g_machine_state.acid;
	;***      166 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      167 : 	const uint32_t delayPump_ms = 50;
	;***      168 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 168
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
	;***      169 : 	case 0:
	;***      170 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      171 : 		g_machine_state.mode = ACID_WASHING;
	;***      172 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      173 : 		g_color = RED;
	;***      174 : 		handSensorLED(g_color);
	;***      175 : 		*state = 1;
	;***      176 : 		*tick = g_systemTime;
	;***      177 : 		break;
	;***      178 : 	case 1:
	;***      179 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      180 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      181 : 			(*state)++;
	;***      182 : 			g_Tick.tickAnimation = g_systemTime;
	;***      183 : 		}
	;***      184 : 		break;
	;***      185 : 	case 2:
	;***      186 : 		//RDVS
	;***      187 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)) {
	;***      188 : 			g_animation_queue++;
	;***      189 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      190 : 			(*state)++;
	;***      191 : 		}
	;***      192 : 		//TODO: Change turn OFF signal here
	;***      193 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      194 : 				|| (DETECT_D() == I_ON)) {
	;***      195 : 			g_animation_queue++;
	;***      196 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      197 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      198 : 			(*state)++;
	;***      199 : 		}
	;***      200 : 		break;
	;***      201 : 	case 3:
	;***      202 : 		//TODO: Change turn OFF signal here
	;***      203 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      204 : 				|| (DETECT_D() == I_ON)) {
	;***      205 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      206 : 			(*state)++;
	;***      207 : 		}
	;***      208 : 		break;
	;***      209 : 	case 4:
	;***      210 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      211 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      212 : 			g_color = BLACK;
	;***      213 : 			handSensorLED(g_color);
	;***      214 : 			(*state)++;
	;***      215 : 		}
	;***      216 : 		break;
	;***      217 : 	default:
	;***      218 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 218
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      219 : 		g_animation_queue++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 219
	inc !LOWW(_g_animation_queue)
	;***      220 : //		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      221 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 221
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@3_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 171
	mov !LOWW(_g_machine_state+0x0000E), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 172
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 173
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 174
	oneb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 175
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 176
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@3_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 179
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	.bz $!.BB@LABEL@3_20
.BB@LABEL@3_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 180
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 181
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 182
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	ret
.BB@LABEL@3_9:	; switch_clause_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 187
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 188
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 190
	inc !LOWW(_g_machine_state+0x00001)
.BB@LABEL@3_11:	; if_break_bb31
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 193
	movw ax, !LOWW(_g_timerSetting+0x00084)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00086)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 195
	inc !LOWW(_g_animation_queue)
	br $.BB@LABEL@3_16
.BB@LABEL@3_14:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 203
	movw ax, !LOWW(_g_timerSetting+0x00084)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00086)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 224
	ret
.BB@LABEL@3_18:	; switch_clause_bb101
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 210
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_20
.BB@LABEL@3_19:	; if_then_bb107
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 211
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 212
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 213
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@3_17
.BB@LABEL@3_20:	; return
	;***      222 : 		break;
	;***      223 : 	}
	;***      224 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 224
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      225 : /**
	;***      226 :  * Tested: 24/12/2021 by Mr.An
	;***      227 :  */
	;***      228 : void AlkalineWaterMode_nostop(void) {
	;***      229 : 	uint8_t *state = &g_machine_state.akaline;
	;***      230 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      231 : 	const uint32_t delayPump_ms = 50;
	;***      232 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 232
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
	;***      233 : 	case 0:
	;***      234 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      235 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      236 : 		*state = 1;
	;***      237 : 		*tick = g_systemTime;
	;***      238 : 		break;
	;***      239 : 	case 1:
	;***      240 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      241 : 		g_color = BLUE;
	;***      242 : 		handSensorLED(g_color);
	;***      243 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      244 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***      245 : 			g_Tick.tickAnimation = g_systemTime;
	;***      246 : 			(*state)++;
	;***      247 : 		}
	;***      248 : 		break;
	;***      249 : 	case 2:
	;***      250 : 		//RDVS
	;***      251 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)) {
	;***      252 : 			g_animation_queue++;
	;***      253 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      254 : 			(*state)++;
	;***      255 : 		}
	;***      256 : 		//TODO: Change turn OFF signal here
	;***      257 : 		if (ns_delay_ms(tick, g_timerSetting.t57_alkalineWaterDownTime_s * 1000)
	;***      258 : 				|| (DETECT_D() == I_ON)) {
	;***      259 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      260 : 			g_animation_queue++;
	;***      261 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      262 : 			(*state)++;
	;***      263 : 		}
	;***      264 : 		break;
	;***      265 : 	case 3:
	;***      266 : 		//TODO: Change turn OFF signal here
	;***      267 : 		if (ns_delay_ms(tick, g_timerSetting.t57_alkalineWaterDownTime_s * 1000)
	;***      268 : 				|| (DETECT_D() == I_ON)) {
	;***      269 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      270 : 			(*state)++;
	;***      271 : 		}
	;***      272 : 		break;
	;***      273 : 	case 4:
	;***      274 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      275 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      276 : 			g_color = BLACK;
	;***      277 : 			handSensorLED(g_color);
	;***      278 : 			(*state)++;
	;***      279 : 		}
	;***      280 : 		break;
	;***      281 : 	default:
	;***      282 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 282
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      283 : 		g_animation_queue++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 283
	inc !LOWW(_g_animation_queue)
	;***      284 : //		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      285 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 285
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@4_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 235
	mov !LOWW(_g_machine_state+0x0000E), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 236
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 237
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@4_7:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 240
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 241
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 242
	mov a, #0x03
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 243
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	.bz $!.BB@LABEL@4_21
.BB@LABEL@4_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 244
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 245
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	br $.BB@LABEL@4_14
.BB@LABEL@4_9:	; switch_clause_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 251
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_11
.BB@LABEL@4_10:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 252
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 254
	inc !LOWW(_g_machine_state)
.BB@LABEL@4_11:	; if_break_bb31
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 257
	movw ax, !LOWW(_g_timerSetting+0x00088)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0008A)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 259
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 260
	inc !LOWW(_g_animation_queue)
.BB@LABEL@4_14:	; if_then_bb59
	br $.BB@LABEL@4_18
.BB@LABEL@4_15:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 267
	movw ax, !LOWW(_g_timerSetting+0x00088)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0008A)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 269
	clr1 0xFFF06.1
.BB@LABEL@4_18:	; if_then_bb96
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 288
	ret
.BB@LABEL@4_19:	; switch_clause_bb101
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 274
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_21
.BB@LABEL@4_20:	; if_then_bb107
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 275
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 276
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 277
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@4_18
.BB@LABEL@4_21:	; return
	;***      286 : 		break;
	;***      287 : 	}
	;***      288 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 288
	ret
	.SECTION .data,DATA
_g_animation_queue:
	.DS (1)
