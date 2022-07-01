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
#@  compiled at Thu Jun 30 14:37:32 2022

	.EXTERN _g_timerSetting
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_systemTime
	.EXTERN _g_color
	.EXTERN _g_control_setting
	.PUBLIC _g_animation_queue
	.PUBLIC _WaterWashingMode_nostop
	.EXTERN _setHandSensorON
	.EXTERN _handSensorLED
	.EXTERN _ns_delay_ms
	.EXTERN _isHandSensorON
	.EXTERN _setHandSensorOFF
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
	bz $.BB@LABEL@1_7
.BB@LABEL@1_2:	; entry
	dec a
	bz $.BB@LABEL@1_9
.BB@LABEL@1_3:	; switch_clause_bb61
	;***       18 : 	case 0:
	;***       19 : 		if(g_control_setting.raw.biomectric == 1U){
	;***       20 : 			setHandSensorON();
	;***       21 : 		}
	;***       22 : 		g_machine_state.mode = WATER_WASHING;
	;***       23 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***       24 : 		g_color = WHITE;
	;***       25 : 		*tick = g_systemTime;
	;***       26 : 		(*state)++;
	;***       27 : 		handSensorLED(g_color);
	;***       28 : 		break;
	;***       29 : 	case 1:
	;***       30 : 		if (ns_delay_ms(tick, 100)) {
	;***       31 : 			g_animation_queue++;
	;***       32 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***       33 : 			(*state)++;
	;***       34 : 		}
	;***       35 : 		break;
	;***       36 : 	case 2:
	;***       37 : 		if (!isHandSensorON() || ns_delay_ms(tick, g_timerSetting.t33_waterDischargeDelay_s * 1000)) {
	;***       38 : 			setHandSensorOFF();
	;***       39 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***       40 : 			g_color = BLACK;
	;***       41 : 			(*state) = 0;
	;***       42 : 			g_machine_state.mode = BUSY;
	;***       43 : 			handSensorLED(g_color);
	;***       44 : 			g_animation_queue++;
	;***       45 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***       46 : 		}
	;***       47 : 		break;
	;***       48 : 	default:
	;***       49 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 49
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@1_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 19
	movw hl, #LOWW(_g_control_setting)
	bf [hl].3, $.BB@LABEL@1_6
.BB@LABEL@1_5:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 20
	call !!_setHandSensorON
.BB@LABEL@1_6:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 22
	mov !LOWW(_g_machine_state+0x0000F), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 23
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 24
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 25
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 26
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 27
	mov a, #0x02
	br !!_handSensorLED
.BB@LABEL@1_7:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 30
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x00018)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@1_12
.BB@LABEL@1_8:	; if_then_bb23
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 31
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 33
	inc !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@1_9:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 37
	call !!_isHandSensorON
	cmp0 a
	bz $.BB@LABEL@1_11
.BB@LABEL@1_10:	; bb40
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
	bz $.BB@LABEL@1_12
.BB@LABEL@1_11:	; if_then_bb55
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 38
	call !!_setHandSensorOFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 39
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 40
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 41
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 42
	mov !LOWW(_g_machine_state+0x0000F), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 43
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 44
	inc !LOWW(_g_animation_queue)
.BB@LABEL@1_12:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 52
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***       50 : 		break;
	;***       51 : 	}
	;***       52 : }
	;***       53 : 
	;***       54 : /**
	;***       55 :  * Tested: 24/12/2021 by Mr.An
	;***       56 :  */
	;***       57 : void HandWashingMode_nostop(void) {
	;***       58 : 	uint8_t *state = &g_machine_state.handwash;
	;***       59 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***       60 : 	const uint32_t delayPump_ms = 50;
	;***       61 : 	if ((*state) == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 61
	mov a, !LOWW(_g_machine_state+0x00003)
	mov d, a
	cmp0 a
	bnz $.BB@LABEL@2_10
.BB@LABEL@2_1:	; if_then_bb
	;***       62 : 		g_timerSetting.t32_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 62
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
	;***       63 : 				g_timerSetting.t32_overLapTime_ms < delayPump_ms ?
	;***       64 : 						delayPump_ms : g_timerSetting.t32_overLapTime_ms;
	;***       65 : 		g_timerSetting.t32_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 65
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
	;***       66 : 				g_timerSetting.t32_overLapTime_ms > 1000 ?
	;***       67 : 						1000 : g_timerSetting.t32_overLapTime_ms;
	;***       68 : 	} else {
	;***       69 : //		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
	;***       70 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       71 : //		}
	;***       72 : 	}
	;***       73 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 73
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
	;***       74 : 	case 0:
	;***       75 : 		*state = 1;
	;***       76 : 		*tick = g_systemTime;
	;***       77 : 		g_machine_state.mode = HAND_WASHING;
	;***       78 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***       79 : 		g_Tick.tickAnimation = g_systemTime;
	;***       80 : 		break;
	;***       81 : 	case 1:
	;***       82 : 		//RDVS
	;***       83 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)) {
	;***       84 : 			(*state)++;
	;***       85 : 			g_animation_queue++;
	;***       86 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       87 : 			break;
	;***       88 : 		}
	;***       89 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***       90 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***       91 : 			handSensorLED(BLUE);
	;***       92 : 			g_animation_queue++;
	;***       93 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***       94 : 			(*state)++;
	;***       95 : 		}
	;***       96 : 		break;
	;***       97 : 	case 2:
	;***       98 : //		if (ns_delay_ms(tick, delayPump_ms)) {
	;***       99 : //			O_ALK_PUMP_PIN_P2 = ON;
	;***      100 : //			handSensorLED(BLUE);
	;***      101 : //			(*state)++;
	;***      102 : //		}
	;***      103 : 		(*state)++;
	;***      104 : 		break;
	;***      105 : 	case 3:
	;***      106 : 		if (ns_delay_ms(tick,
	;***      107 : 				g_timerSetting.t29_alkalineWaterSpoutingTime_s * 1000
	;***      108 : 						- g_timerSetting.t32_overLapTime_ms)) {
	;***      109 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      110 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      111 : 			(*state)++;
	;***      112 : 		}
	;***      113 : 		break;
	;***      114 : 	case 4:
	;***      115 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      116 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      117 : 			handSensorLED(RED);
	;***      118 : 			g_animation_queue++;
	;***      119 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      120 : 			(*state)++;
	;***      121 : 		}
	;***      122 : 		break;
	;***      123 : 	case 5:
	;***      124 : 		if (ns_delay_ms(tick,
	;***      125 : 				g_timerSetting.t32_overLapTime_ms - delayPump_ms)) {
	;***      126 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      127 : 			(*state)++;
	;***      128 : 		}
	;***      129 : 		break;
	;***      130 : 	case 6:
	;***      131 : 		if (ns_delay_ms(tick,
	;***      132 : 				g_timerSetting.t30_acidWaterSpoutingTime_s * 1000
	;***      133 : 						- g_timerSetting.t32_overLapTime_ms)) {
	;***      134 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      135 : 			handSensorLED(WHITE);
	;***      136 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      137 : 			g_animation_queue++;
	;***      138 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      139 : 			(*state)++;
	;***      140 : 		}
	;***      141 : 		break;
	;***      142 : 	case 7:
	;***      143 : 		if (ns_delay_ms(tick, g_timerSetting.t32_overLapTime_ms)) {
	;***      144 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      145 : 			(*state)++;
	;***      146 : 		}
	;***      147 : 		break;
	;***      148 : 	case 8:
	;***      149 : 		if (ns_delay_ms(tick,
	;***      150 : 				g_timerSetting.t31_washingWaterSpoutingTime_s * 1000)) {
	;***      151 : 			setHandSensorOFF();
	;***      152 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      153 : 			handSensorLED(BLACK);
	;***      154 : 			(*state) = 0;
	;***      155 : 			g_machine_state.mode = BUSY;
	;***      156 : 			g_animation_queue++;
	;***      157 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      158 : 		}
	;***      159 : 		break;
	;***      160 : 	default:
	;***      161 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 161
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@2_20:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 75
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 76
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 77
	oneb !LOWW(_g_machine_state+0x0000F)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 78
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 79
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	ret
.BB@LABEL@2_21:	; switch_clause_bb35
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 83
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_26
.BB@LABEL@2_22:	; if_break_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 89
	clrw ax
	movw de, ax
	mov c, #0x32
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_35
.BB@LABEL@2_23:	; if_then_bb55
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 90
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 91
	mov a, #0x03
.BB@LABEL@2_24:	; if_then_bb55
	call !!_handSensorLED
.BB@LABEL@2_25:	; if_then_bb55
	inc !LOWW(_g_animation_queue)
	br $.BB@LABEL@2_33
.BB@LABEL@2_26:	; if_then_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 84
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@2_27:	; if_then_bb40
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 165
	ret
.BB@LABEL@2_28:	; switch_clause_bb62
	mov a, d
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 103
	inc a
	mov !LOWW(_g_machine_state+0x00003), a
	ret
.BB@LABEL@2_29:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 106
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 109
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 110
	set1 0xFFF07.6
.BB@LABEL@2_33:	; if_then_bb76
	br $.BB@LABEL@2_41
.BB@LABEL@2_34:	; switch_clause_bb81
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 115
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 116
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 117
	oneb a
	br $.BB@LABEL@2_24
.BB@LABEL@2_37:	; switch_clause_bb95
	movw ax, #0xFFCE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 124
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 126
	clr1 0xFFF07.7
.BB@LABEL@2_41:	; if_then_bb104
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 165
	ret
.BB@LABEL@2_42:	; switch_clause_bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 131
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 134
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 135
	mov a, #0x02
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 136
	set1 0xFFF05.5
	br $!.BB@LABEL@2_25
.BB@LABEL@2_47:	; switch_clause_bb126
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 143
	movw bc, !LOWW(_g_timerSetting+0x0007C)
	movw de, !LOWW(_g_timerSetting+0x0007E)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@2_48:	; switch_clause_bb126
	bz $.BB@LABEL@2_52
.BB@LABEL@2_49:	; if_then_bb133
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 144
	clr1 0xFFF07.6
	br $.BB@LABEL@2_41
.BB@LABEL@2_50:	; switch_clause_bb138
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 149
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 151
	call !!_setHandSensorOFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 152
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 153
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 154
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 155
	mov !LOWW(_g_machine_state+0x0000F), #0x07
	br $!.BB@LABEL@2_27
.BB@LABEL@2_52:	; return
	;***      162 : 		break;
	;***      163 : 	}
	;***      164 : 
	;***      165 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 165
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      166 : /**
	;***      167 :  * Tested: 24/12/2021 by Mr.An
	;***      168 :  */
	;***      169 : void AcidWaterMode_nostop(void) {
	;***      170 : 	uint8_t *state = &g_machine_state.acid;
	;***      171 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      172 : 	const uint32_t delayPump_ms = 50;
	;***      173 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 173
	mov a, !LOWW(_g_machine_state+0x00001)
	cmp0 a
	bz $.BB@LABEL@3_6
.BB@LABEL@3_1:	; entry
	dec a
	bz $.BB@LABEL@3_9
.BB@LABEL@3_2:	; entry
	dec a
	bz $.BB@LABEL@3_11
.BB@LABEL@3_3:	; entry
	dec a
	.bz $!.BB@LABEL@3_17
.BB@LABEL@3_4:	; entry
	dec a
	.bz $!.BB@LABEL@3_22
.BB@LABEL@3_5:	; switch_clause_bb114
	;***      174 : 	case 0:
	;***      175 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      176 : 		if(g_control_setting.raw.biomectric == 1U){
	;***      177 : 			setHandSensorON();
	;***      178 : 		}
	;***      179 : 		g_machine_state.mode = ACID_WASHING;
	;***      180 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      181 : 		g_color = RED;
	;***      182 : 		handSensorLED(g_color);
	;***      183 : 		*state = 1;
	;***      184 : 		*tick = g_systemTime;
	;***      185 : 		break;
	;***      186 : 	case 1:
	;***      187 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      188 : 			O_ACID_PUMP_PIN_P1 = ON;
	;***      189 : 			(*state)++;
	;***      190 : 			g_Tick.tickAnimation = g_systemTime;
	;***      191 : 		}
	;***      192 : 		break;
	;***      193 : 	case 2:
	;***      194 : 		//RDVS
	;***      195 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)) {
	;***      196 : 			g_animation_queue++;
	;***      197 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      198 : 			(*state)++;
	;***      199 : 		}
	;***      200 : 		//TODO: Change turn OFF signal here
	;***      201 : 		if (!isHandSensorON() || ns_delay_ms(tick, g_timerSetting.t34_acidWaterDownTime_s * 1000)) {
	;***      202 : 			setHandSensorOFF();
	;***      203 : 			g_animation_queue++;
	;***      204 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      205 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      206 : 			(*state)++;
	;***      207 : 		}
	;***      208 : 		break;
	;***      209 : 	case 3:
	;***      210 : 		//TODO: Change turn OFF signal here
	;***      211 : 		if (!isHandSensorON() || ns_delay_ms(tick, g_timerSetting.t34_acidWaterDownTime_s * 1000)) {
	;***      212 : 			setHandSensorOFF();
	;***      213 : 			O_ACID_PUMP_PIN_P1 = OFF;
	;***      214 : 			(*state)++;
	;***      215 : 		}
	;***      216 : 		break;
	;***      217 : 	case 4:
	;***      218 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      219 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      220 : 			g_color = BLACK;
	;***      221 : 			handSensorLED(g_color);
	;***      222 : 			(*state)++;
	;***      223 : 		}
	;***      224 : 		break;
	;***      225 : 	default:
	;***      226 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 226
	mov !LOWW(_g_machine_state+0x0000F), #0x07
	;***      227 : 		g_animation_queue++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 227
	inc !LOWW(_g_animation_queue)
	;***      228 : //		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      229 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 229
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@3_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 176
	movw hl, #LOWW(_g_control_setting)
	bf [hl].3, $.BB@LABEL@3_8
.BB@LABEL@3_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 177
	call !!_setHandSensorON
.BB@LABEL@3_8:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 179
	mov !LOWW(_g_machine_state+0x0000F), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 180
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 181
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 182
	oneb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 183
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 184
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@3_9:	; switch_clause_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 187
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_15
.BB@LABEL@3_10:	; if_then_bb23
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 188
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 189
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 190
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	ret
.BB@LABEL@3_11:	; switch_clause_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 195
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_13
.BB@LABEL@3_12:	; if_then_bb34
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 196
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 198
	inc !LOWW(_g_machine_state+0x00001)
.BB@LABEL@3_13:	; if_break_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 201
	call !!_isHandSensorON
	cmp0 a
	bz $.BB@LABEL@3_16
.BB@LABEL@3_14:	; bb49
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
.BB@LABEL@3_15:	; bb49
	bz $.BB@LABEL@3_24
.BB@LABEL@3_16:	; if_then_bb64
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 202
	call !!_setHandSensorOFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 203
	inc !LOWW(_g_animation_queue)
	br $.BB@LABEL@3_20
.BB@LABEL@3_17:	; switch_clause_bb71
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 211
	call !!_isHandSensorON
	cmp0 a
	bz $.BB@LABEL@3_19
.BB@LABEL@3_18:	; bb82
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
	bz $.BB@LABEL@3_24
.BB@LABEL@3_19:	; if_then_bb97
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 212
	call !!_setHandSensorOFF
.BB@LABEL@3_20:	; if_then_bb97
	clr1 0xFFF06.2
.BB@LABEL@3_21:	; if_then_bb97
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 232
	ret
.BB@LABEL@3_22:	; switch_clause_bb102
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 218
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_24
.BB@LABEL@3_23:	; if_then_bb108
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 219
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 220
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 221
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@3_21
.BB@LABEL@3_24:	; return
	;***      230 : 		break;
	;***      231 : 	}
	;***      232 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 232
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      233 : /**
	;***      234 :  * Tested: 24/12/2021 by Mr.An
	;***      235 :  */
	;***      236 : void AlkalineWaterMode_nostop(void) {
	;***      237 : 	uint8_t *state = &g_machine_state.akaline;
	;***      238 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      239 : 	const uint32_t delayPump_ms = 50;
	;***      240 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 240
	mov a, !LOWW(_g_machine_state)
	cmp0 a
	bz $.BB@LABEL@4_6
.BB@LABEL@4_1:	; entry
	dec a
	bz $.BB@LABEL@4_9
.BB@LABEL@4_2:	; entry
	dec a
	bz $.BB@LABEL@4_11
.BB@LABEL@4_3:	; entry
	dec a
	.bz $!.BB@LABEL@4_18
.BB@LABEL@4_4:	; entry
	dec a
	.bz $!.BB@LABEL@4_22
.BB@LABEL@4_5:	; switch_clause_bb113
	;***      241 : 	case 0:
	;***      242 : 		if(g_control_setting.raw.biomectric == 1U){
	;***      243 : 			setHandSensorON();
	;***      244 : 		}
	;***      245 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      246 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      247 : 		*state = 1;
	;***      248 : 		*tick = g_systemTime;
	;***      249 : 		break;
	;***      250 : 	case 1:
	;***      251 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      252 : 		g_color = BLUE;
	;***      253 : 		handSensorLED(g_color);
	;***      254 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      255 : 			O_ALK_PUMP_PIN_P2 = ON;
	;***      256 : 			g_Tick.tickAnimation = g_systemTime;
	;***      257 : 			(*state)++;
	;***      258 : 		}
	;***      259 : 		break;
	;***      260 : 	case 2:
	;***      261 : 		//RDVS
	;***      262 : 		if (ns_delay_ms(&g_Tick.tickAnimation, 100)) {
	;***      263 : 			g_animation_queue++;
	;***      264 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      265 : 			(*state)++;
	;***      266 : 		}
	;***      267 : 		//TODO: Change turn OFF signal here
	;***      268 : 		if (!isHandSensorON() || ns_delay_ms(tick, g_timerSetting.t35_alkalineWaterDownTime_s * 1000)) {
	;***      269 : 			setHandSensorOFF();
	;***      270 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      271 : 			g_animation_queue++;
	;***      272 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      273 : 			(*state)++;
	;***      274 : 		}
	;***      275 : 		break;
	;***      276 : 	case 3:
	;***      277 : 		//TODO: Change turn OFF signal here
	;***      278 : 		if (!isHandSensorON() || ns_delay_ms(tick, g_timerSetting.t35_alkalineWaterDownTime_s * 1000)) {
	;***      279 : 			setHandSensorOFF();
	;***      280 : 			O_ALK_PUMP_PIN_P2 = OFF;
	;***      281 : 			(*state)++;
	;***      282 : 		}
	;***      283 : 		break;
	;***      284 : 	case 4:
	;***      285 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      286 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      287 : 			handSensorLED(BLACK);
	;***      288 : 			(*state)++;
	;***      289 : 		}
	;***      290 : 		break;
	;***      291 : 	default:
	;***      292 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 292
	mov !LOWW(_g_machine_state+0x0000F), #0x07
	;***      293 : 		g_animation_queue++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 293
	inc !LOWW(_g_animation_queue)
	;***      294 : //		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      295 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 295
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@4_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 242
	movw hl, #LOWW(_g_control_setting)
	bf [hl].3, $.BB@LABEL@4_8
.BB@LABEL@4_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 243
	call !!_setHandSensorON
.BB@LABEL@4_8:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 246
	mov !LOWW(_g_machine_state+0x0000F), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 247
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 248
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@4_9:	; switch_clause_bb15
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 251
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 252
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 253
	mov a, #0x03
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 254
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_15
.BB@LABEL@4_10:	; if_then_bb23
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 255
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 256
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	br $.BB@LABEL@4_17
.BB@LABEL@4_11:	; switch_clause_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 262
	clrw ax
	movw de, ax
	movw bc, #0x0064
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_13
.BB@LABEL@4_12:	; if_then_bb34
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 263
	inc !LOWW(_g_animation_queue)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 265
	inc !LOWW(_g_machine_state)
.BB@LABEL@4_13:	; if_break_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 268
	call !!_isHandSensorON
	cmp0 a
	bz $.BB@LABEL@4_16
.BB@LABEL@4_14:	; bb49
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
.BB@LABEL@4_15:	; bb49
	bz $.BB@LABEL@4_24
.BB@LABEL@4_16:	; if_then_bb64
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 269
	call !!_setHandSensorOFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 270
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 271
	inc !LOWW(_g_animation_queue)
.BB@LABEL@4_17:	; if_then_bb64
	br $.BB@LABEL@4_21
.BB@LABEL@4_18:	; switch_clause_bb71
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 278
	call !!_isHandSensorON
	cmp0 a
	bz $.BB@LABEL@4_20
.BB@LABEL@4_19:	; bb82
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
	bz $.BB@LABEL@4_24
.BB@LABEL@4_20:	; if_then_bb97
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 279
	call !!_setHandSensorOFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 280
	clr1 0xFFF06.1
.BB@LABEL@4_21:	; if_then_bb97
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 298
	ret
.BB@LABEL@4_22:	; switch_clause_bb102
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 285
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_24
.BB@LABEL@4_23:	; if_then_bb108
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 286
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 287
	clrb a
	call !!_handSensorLED
	br $.BB@LABEL@4_21
.BB@LABEL@4_24:	; return
	;***      296 : 		break;
	;***      297 : 	}
	;***      298 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/normal_operation.c", 298
	ret
	.SECTION .data,DATA
_g_animation_queue:
	.DS (1)
