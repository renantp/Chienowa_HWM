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
#@  compiled at Wed Jun 22 17:23:23 2022

	.EXTERN _g_timerSetting
	.EXTERN _g_io_status
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
	.STACK _WaterWashingMode_nostop = 6
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
.BB@LABEL@1_3:	; switch_clause_bb75
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
	;***       34 : 		if (ns_delay_ms(tick, g_timerSetting.t55_waterDischargeDelay_s * 1000)
	;***       35 : 				|| DETECT_D() == I_ON) {
	;***       36 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***       37 : 			g_color = BLACK;
	;***       38 : 			(*state) = 0;
	;***       39 : 			g_machine_state.mode = BUSY;
	;***       40 : 			handSensorLED(g_color);
	;***       41 : 			g_animation_queue++;
	;***       42 : 			if(DETECT_D() == I_ON)
	;***       43 : 				g_io_status.refined.io.HandSensorOFF = 1;
	;***       44 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***       45 : 		}
	;***       46 : 		break;
	;***       47 : 	default:
	;***       48 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 48
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
	bz $.BB@LABEL@1_11
.BB@LABEL@1_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 28
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 30
	inc !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@1_7:	; switch_clause_bb21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 34
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
	movw ax, #LOWW(_g_Tick+0x00018)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@1_9
.BB@LABEL@1_8:	; bb
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@1_11
.BB@LABEL@1_9:	; if_then_bb49
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 36
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 37
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 38
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 39
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 40
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 41
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 42
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@1_11
.BB@LABEL@1_10:	; if_then_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 43
	set1 !LOWW(_g_io_status+0x00003).5
.BB@LABEL@1_11:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 51
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***       49 : 		break;
	;***       50 : 	}
	;***       51 : }
	;***       52 : 
	;***       53 : /**
	;***       54 :  * Tested: 24/12/2021 by Mr.An
	;***       55 :  */
	;***       56 : void HandWashingMode_nostop(void) {
	;***       57 : 	uint8_t *state = &g_machine_state.handwash;
	;***       58 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***       59 : 	const uint32_t delayPump_ms = 50;
	;***       60 : 	if ((*state) == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 60
	mov a, !LOWW(_g_machine_state+0x00003)
	mov d, a
	cmp0 a
	bnz $.BB@LABEL@2_10
.BB@LABEL@2_1:	; if_then_bb
	;***       61 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 61
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
	;***       62 : 				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***       63 : 						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***       64 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 64
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
	;***       65 : 				g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***       66 : 						1000 : g_timerSetting.t54_overLapTime_ms;
	;***       67 : 	} else {
	;***       68 : //		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
	;***       69 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       70 : //		}
	;***       71 : 	}
	;***       72 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 72
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
	;***       73 : 	case 0:
	;***       74 : 		*state = 1;
	;***       75 : 		*tick = g_systemTime;
	;***       76 : 		g_machine_state.mode = HAND_WASHING;
	;***       77 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***       78 : 		g_Tick.tickAnimation = g_systemTime;
	;***       79 : 		break;
	;***       80 : 	case 1:
	;***       81 : 		//RDVS
	;***       82 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)) {
	;***       83 : 			(*state)++;
	;***       84 : 			g_animation_queue++;
	;***       85 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       86 : 			break;
	;***       87 : 		}
	;***       88 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***       89 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***       90 : 			handSensorLED(BLUE);
	;***       91 : 			g_animation_queue++;
	;***       92 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       93 : 			(*state)++;
	;***       94 : 		}
	;***       95 : 		break;
	;***       96 : 	case 2:
	;***       97 : //		if (ns_delay_ms(tick, delayPump_ms)) {
	;***       98 : //			O_ALK_PUMP_PIN_P2 = ON;
	;***       99 : //			handSensorLED(BLUE);
	;***      100 : //			(*state)++;
	;***      101 : //		}
	;***      102 : 		(*state)++;
	;***      103 : 		break;
	;***      104 : 	case 3:
	;***      105 : 		if (ns_delay_ms(tick,
	;***      106 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      107 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      108 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      109 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      110 : 			(*state)++;
	;***      111 : 		}
	;***      112 : 		break;
	;***      113 : 	case 4:
	;***      114 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      115 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      116 : 			handSensorLED(RED);
	;***      117 : 			g_animation_queue++;
	;***      118 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      119 : 			(*state)++;
	;***      120 : 		}
	;***      121 : 		break;
	;***      122 : 	case 5:
	;***      123 : 		if (ns_delay_ms(tick,
	;***      124 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      125 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      126 : 			(*state)++;
	;***      127 : 		}
	;***      128 : 		break;
	;***      129 : 	case 6:
	;***      130 : 		if (ns_delay_ms(tick,
	;***      131 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      132 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      133 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      134 : 			handSensorLED(WHITE);
	;***      135 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      136 : 			g_animation_queue++;
	;***      137 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      138 : 			(*state)++;
	;***      139 : 		}
	;***      140 : 		break;
	;***      141 : 	case 7:
	;***      142 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      143 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      144 : 			(*state)++;
	;***      145 : 		}
	;***      146 : 		break;
	;***      147 : 	case 8:
	;***      148 : 		if (ns_delay_ms(tick,
	;***      149 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      150 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      151 : 			handSensorLED(BLACK);
	;***      152 : 			(*state) = 0;
	;***      153 : 			g_machine_state.mode = BUSY;
	;***      154 : 			g_animation_queue++;
	;***      155 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      156 : 		}
	;***      157 : 		break;
	;***      158 : 	default:
	;***      159 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 159
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@2_20:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 74
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 75
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 76
	oneb !LOWW(_g_machine_state+0x0000E)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 77
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 78
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	ret
.BB@LABEL@2_21:	; switch_clause_bb35
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 82
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_26
.BB@LABEL@2_22:	; if_break_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 88
	clrw ax
	movw de, ax
	mov c, #0x32
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_35
.BB@LABEL@2_23:	; if_then_bb55
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 89
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 90
	mov a, #0x03
.BB@LABEL@2_24:	; if_then_bb55
	call !!_handSensorLED
.BB@LABEL@2_25:	; if_then_bb55
	inc !LOWW(_g_animation_queue)
	br $.BB@LABEL@2_33
.BB@LABEL@2_26:	; if_then_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 83
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@2_27:	; if_then_bb40
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 163
	ret
.BB@LABEL@2_28:	; switch_clause_bb62
	mov a, d
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 102
	inc a
	mov !LOWW(_g_machine_state+0x00003), a
	ret
.BB@LABEL@2_29:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 105
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 108
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 109
	set1 0xFFF07.6
.BB@LABEL@2_33:	; if_then_bb76
	br $.BB@LABEL@2_41
.BB@LABEL@2_34:	; switch_clause_bb81
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 114
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 115
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 116
	oneb a
	br $.BB@LABEL@2_24
.BB@LABEL@2_37:	; switch_clause_bb95
	movw ax, #0xFFCE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 123
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 125
	clr1 0xFFF07.7
.BB@LABEL@2_41:	; if_then_bb104
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 163
	ret
.BB@LABEL@2_42:	; switch_clause_bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 130
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 133
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 134
	mov a, #0x02
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 135
	set1 0xFFF05.5
	br $!.BB@LABEL@2_25
.BB@LABEL@2_47:	; switch_clause_bb126
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 142
	movw bc, !LOWW(_g_timerSetting+0x0007C)
	movw de, !LOWW(_g_timerSetting+0x0007E)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_48:	; switch_clause_bb126
	bz $.BB@LABEL@2_52
.BB@LABEL@2_49:	; if_then_bb133
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 143
	clr1 0xFFF07.6
	br $.BB@LABEL@2_41
.BB@LABEL@2_50:	; switch_clause_bb138
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 148
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 150
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 151
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 152
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 153
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	br $!.BB@LABEL@2_27
.BB@LABEL@2_52:	; return
	;***      160 : 		break;
	;***      161 : 	}
	;***      162 : 
	;***      163 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 163
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      164 : /**
	;***      165 :  * Tested: 24/12/2021 by Mr.An
	;***      166 :  */
	;***      167 : void AcidWaterMode_nostop(void) {
	;***      168 : 	uint8_t *state = &g_machine_state.acid;
	;***      169 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      170 : 	const uint32_t delayPump_ms = 50;
	;***      171 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 171
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
	.bz $!.BB@LABEL@3_19
.BB@LABEL@3_5:	; switch_clause_bb133
	;***      172 : 	case 0:
	;***      173 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      174 : 		g_machine_state.mode = ACID_WASHING;
	;***      175 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      176 : 		g_color = RED;
	;***      177 : 		handSensorLED(g_color);
	;***      178 : 		*state = 1;
	;***      179 : 		*tick = g_systemTime;
	;***      180 : 		break;
	;***      181 : 	case 1:
	;***      182 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      183 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      184 : 			(*state)++;
	;***      185 : 			g_Tick.tickAnimation = g_systemTime;
	;***      186 : 		}
	;***      187 : 		break;
	;***      188 : 	case 2:
	;***      189 : 		//RDVS
	;***      190 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)) {
	;***      191 : 			g_animation_queue++;
	;***      192 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      193 : 			(*state)++;
	;***      194 : 		}
	;***      195 : 		//TODO: Change turn OFF signal here
	;***      196 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      197 : 				|| (DETECT_D() == I_ON)) {
	;***      198 : 			g_animation_queue++;
	;***      199 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      200 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      201 : 			(*state)++;
	;***      202 : 		}
	;***      203 : 		break;
	;***      204 : 	case 3:
	;***      205 : 		//TODO: Change turn OFF signal here
	;***      206 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      207 : 				|| (DETECT_D() == I_ON)) {
	;***      208 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      209 : 			if(DETECT_D() == I_ON)
	;***      210 : 				g_io_status.refined.io.HandSensorOFF = 1;
	;***      211 : 			(*state)++;
	;***      212 : 		}
	;***      213 : 		break;
	;***      214 : 	case 4:
	;***      215 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      216 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      217 : 			g_color = BLACK;
	;***      218 : 			handSensorLED(g_color);
	;***      219 : 			(*state)++;
	;***      220 : 		}
	;***      221 : 		break;
	;***      222 : 	default:
	;***      223 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 223
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      224 : 		g_animation_queue++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 224
	inc !LOWW(_g_animation_queue)
	;***      225 : //		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      226 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 226
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@3_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 174
	mov !LOWW(_g_machine_state+0x0000E), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 175
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 176
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 177
	oneb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 178
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 179
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@3_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 182
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	.bz $!.BB@LABEL@3_21
.BB@LABEL@3_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 183
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 184
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 185
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	ret
.BB@LABEL@3_9:	; switch_clause_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 190
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 191
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 193
	inc !LOWW(_g_machine_state+0x00001)
.BB@LABEL@3_11:	; if_break_bb31
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 196
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
	bt a.4, $.BB@LABEL@3_21
.BB@LABEL@3_13:	; if_then_bb59
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 198
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 200
	clr1 0xFFF06.2
	br $.BB@LABEL@3_18
.BB@LABEL@3_14:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 206
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
	bt a.4, $.BB@LABEL@3_21
.BB@LABEL@3_16:	; if_then_bb96
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 208
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 209
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@3_18
.BB@LABEL@3_17:	; if_then_bb112
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 210
	set1 !LOWW(_g_io_status+0x00003).5
.BB@LABEL@3_18:	; if_break_bb116
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 229
	ret
.BB@LABEL@3_19:	; switch_clause_bb121
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 215
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_21
.BB@LABEL@3_20:	; if_then_bb127
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 216
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 217
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 218
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@3_18
.BB@LABEL@3_21:	; return
	;***      227 : 		break;
	;***      228 : 	}
	;***      229 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 229
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      230 : /**
	;***      231 :  * Tested: 24/12/2021 by Mr.An
	;***      232 :  */
	;***      233 : void AlkalineWaterMode_nostop(void) {
	;***      234 : 	uint8_t *state = &g_machine_state.akaline;
	;***      235 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      236 : 	const uint32_t delayPump_ms = 50;
	;***      237 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 237
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
	.bz $!.BB@LABEL@4_20
.BB@LABEL@4_5:	; switch_clause_bb133
	;***      238 : 	case 0:
	;***      239 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      240 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      241 : 		*state = 1;
	;***      242 : 		*tick = g_systemTime;
	;***      243 : 		break;
	;***      244 : 	case 1:
	;***      245 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      246 : 		g_color = BLUE;
	;***      247 : 		handSensorLED(g_color);
	;***      248 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      249 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***      250 : 			g_Tick.tickAnimation = g_systemTime;
	;***      251 : 			(*state)++;
	;***      252 : 		}
	;***      253 : 		break;
	;***      254 : 	case 2:
	;***      255 : 		//RDVS
	;***      256 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)) {
	;***      257 : 			g_animation_queue++;
	;***      258 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      259 : 			(*state)++;
	;***      260 : 		}
	;***      261 : 		//TODO: Change turn OFF signal here
	;***      262 : 		if (ns_delay_ms(tick, g_timerSetting.t57_alkalineWaterDownTime_s * 1000)
	;***      263 : 				|| (DETECT_D() == I_ON)) {
	;***      264 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      265 : 			g_animation_queue++;
	;***      266 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      267 : 			(*state)++;
	;***      268 : 		}
	;***      269 : 		break;
	;***      270 : 	case 3:
	;***      271 : 		//TODO: Change turn OFF signal here
	;***      272 : 		if (ns_delay_ms(tick, g_timerSetting.t57_alkalineWaterDownTime_s * 1000)
	;***      273 : 				|| (DETECT_D() == I_ON)) {
	;***      274 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      275 : 			if(DETECT_D() == I_ON)
	;***      276 : 				g_io_status.refined.io.HandSensorOFF = 1;
	;***      277 : 			(*state)++;
	;***      278 : 		}
	;***      279 : 		break;
	;***      280 : 	case 4:
	;***      281 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      282 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      283 : 			g_color = BLACK;
	;***      284 : 			handSensorLED(g_color);
	;***      285 : 			(*state)++;
	;***      286 : 		}
	;***      287 : 		break;
	;***      288 : 	default:
	;***      289 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 289
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      290 : 		g_animation_queue++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 290
	inc !LOWW(_g_animation_queue)
	;***      291 : //		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      292 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 292
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@4_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 240
	mov !LOWW(_g_machine_state+0x0000E), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 241
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 242
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@4_7:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 245
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 246
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 247
	mov a, #0x03
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 248
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	.bz $!.BB@LABEL@4_22
.BB@LABEL@4_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 249
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 250
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	br $.BB@LABEL@4_14
.BB@LABEL@4_9:	; switch_clause_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 256
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_11
.BB@LABEL@4_10:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 257
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 259
	inc !LOWW(_g_machine_state)
.BB@LABEL@4_11:	; if_break_bb31
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 262
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
	bt a.4, $.BB@LABEL@4_22
.BB@LABEL@4_13:	; if_then_bb59
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 264
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 265
	inc !LOWW(_g_animation_queue)
.BB@LABEL@4_14:	; if_then_bb59
	br $.BB@LABEL@4_19
.BB@LABEL@4_15:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 272
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
	bt a.4, $.BB@LABEL@4_22
.BB@LABEL@4_17:	; if_then_bb96
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 274
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 275
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@4_19
.BB@LABEL@4_18:	; if_then_bb112
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 276
	set1 !LOWW(_g_io_status+0x00003).5
.BB@LABEL@4_19:	; if_break_bb116
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 295
	ret
.BB@LABEL@4_20:	; switch_clause_bb121
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 281
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_22
.BB@LABEL@4_21:	; if_then_bb127
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 282
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 283
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 284
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@4_19
.BB@LABEL@4_22:	; return
	;***      293 : 		break;
	;***      294 : 	}
	;***      295 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 295
	ret
	.SECTION .data,DATA
_g_animation_queue:
	.DS (1)
