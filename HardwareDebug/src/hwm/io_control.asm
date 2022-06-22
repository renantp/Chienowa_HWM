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
#@   -o src/hwm/io_control.obj
#@   ../src/hwm/io_control.c
#@  compiled at Wed Jun 22 15:37:26 2022

	.EXTERN _g_timerSetting
	.EXTERN _g_io_status
	.EXTERN _g_mean_io_status
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_systemTime
	.PUBLIC __pre_flow_state
	.PUBLIC __flow_pulse
	.PUBLIC _OutputIO
	.PUBLIC _isAcidTankFull
	.EXTERN _ns_delay_ms
	.PUBLIC _isAcidTankAlmostFull
	.PUBLIC _isAcidTankHasSomething
	.PUBLIC _isAcidTankAlmostEmpty
	.PUBLIC _isAcidTankEmpty
	.EXTERN _levelSkipErrorCheck
	.PUBLIC _isAlkalineTankFull
	.PUBLIC _isAlkalineTankAlmostFull
	.PUBLIC _isAlkalineTankHasSomething_nonstop
	.PUBLIC _isAlkalineTankAlmostEmpty
	.PUBLIC _isAlkalineTankEmpty_nonstop
	.PUBLIC _measureFlowSensor
	.EXTERN _R_WDT_Restart
	.EXTERN _realTimeResponse
	.PUBLIC _measureFlowSensor_nostop

	.SECTION .textf,TEXTF
_OutputIO:
	.STACK _OutputIO = 4
	;***        1 : /*
	;***        2 :  * io_control.c
	;***        3 :  *
	;***        4 :  *  Created on: 6 Jan 2022
	;***        5 :  *      Author: Hung
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "io_control.h"
	;***        9 : 
	;***       10 : void OutputIO(struct IO_Struct *io) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 10
	movw de, ax
	movw hl, #0xFF06
	;***       11 : 	O_SUPPLY_WATER_PIN_SV1 = io->Valve.SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 11
	mov a, [de+0x01]
	mov1 CY, a.0
	mov a, 0xFFF01
	mov1 a.7, CY
	mov 0xFFF01, a
	;***       12 : 	O_SPOUT_WATER_PIN_SV2 = io->Valve.SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 12
	mov a, [de+0x01]
	mov1 CY, a.1
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	;***       13 : 	O_SPOUT_ACID_PIN_SV3 = io->Valve.SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 13
	mov a, [de+0x01]
	mov1 CY, a.2
	mov a, 0xFFF07
	mov1 a.6, CY
	mov 0xFFF07, a
	;***       14 : 	O_SPOUT_ALK_PIN_SV4 = io->Valve.SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 14
	mov a, [de+0x01]
	mov1 CY, a.3
	mov a, 0xFFF07
	mov1 a.7, CY
	mov 0xFFF07, a
	;***       15 : 	O_DRAIN_ACID_PIN_SV5 = io->Valve.SV5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 15
	mov a, [de+0x01]
	mov1 CY, a.4
	mov a, [hl]
	mov1 a.7, CY
	mov [hl], a
	;***       16 : 	O_DRAIN_ALK_PIN_SV6 = io->Valve.SV6;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 16
	mov a, [de+0x01]
	mov1 CY, a.5
	mov a, [hl]
	mov1 a.6, CY
	mov [hl], a
	;***       17 : 	O_NEUTRALIZE_PIN_SV7 = io->Valve.SV7;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 17
	mov a, [de+0x01]
	mov1 CY, a.6
	mov a, [hl]
	mov1 a.5, CY
	mov [hl], a
	;***       18 : 	O_OPTION_2_PIN_SV8 = io->Valve.SV8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 18
	mov a, [de+0x01]
	mov1 CY, a.7
	mov a, 0xFFF0B
	mov1 a.1, CY
	mov 0xFFF0B, a
	;***       19 : 	O_OPTION_3_PIN_SV9 = io->Valve.SV9;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 19
	mov a, [de+0x02]
	mov1 CY, a.0
	mov a, 0xFFF0E
	mov1 a.6, CY
	mov 0xFFF0E, a
	;***       20 : 
	;***       21 : 	if (O_SPOUT_ACID_PIN_SV3 == OFF && O_DRAIN_ACID_PIN_SV5 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 21
	mov a, 0xFFF07
	bt a.6, $.BB@LABEL@1_3
.BB@LABEL@1_1:	; bb
	mov a, 0xFFF06
	bt a.7, $.BB@LABEL@1_3
.BB@LABEL@1_2:	; if_then_bb
	;***       22 : 		O_ACID_PUMP_PIN_P1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 22
	clr1 0xFFF06.2
	br $.BB@LABEL@1_4
.BB@LABEL@1_3:	; if_else_bb
	;***       23 : 	} else {
	;***       24 : 		O_ACID_PUMP_PIN_P1 = io->Pump1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 24
	mov a, [de+0x03]
	mov1 CY, a.0
	mov a, 0xFFF06
	mov1 a.2, CY
	mov 0xFFF06, a
.BB@LABEL@1_4:	; if_break_bb
	;***       25 : 	}
	;***       26 : 	if (O_DRAIN_ALK_PIN_SV6 == OFF && O_SPOUT_ALK_PIN_SV4 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 26
	mov a, 0xFFF06
	bt a.6, $.BB@LABEL@1_7
.BB@LABEL@1_5:	; bb143
	mov a, 0xFFF07
	bt a.7, $.BB@LABEL@1_7
.BB@LABEL@1_6:	; if_then_bb157
	;***       27 : 		O_ALK_PUMP_PIN_P2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 27
	clr1 0xFFF06.1
	br $.BB@LABEL@1_8
.BB@LABEL@1_7:	; if_else_bb158
	;***       28 : 	} else {
	;***       29 : 		O_ALK_PUMP_PIN_P2 = io->Pump2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 29
	mov a, [de+0x03]
	mov1 CY, a.1
	mov a, 0xFFF06
	mov1 a.1, CY
	mov 0xFFF06, a
.BB@LABEL@1_8:	; if_break_bb170
	;***       30 : 	}
	;***       31 : 	O_PUMP_SALT_PIN_SP1 = io->SaltPump;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 31
	mov a, [de+0x03]
	mov1 CY, a.2
	mov a, 0xFFF06
	mov1 a.0, CY
	mov 0xFFF06, a
	;***       32 : 	O_CVCC_ON_PIN = io->CVCC_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 32
	mov a, [de+0x03]
	mov1 CY, a.3
	mov a, 0xFFF0E
	mov1 a.2, CY
	mov 0xFFF0E, a
	ret
_isAcidTankFull:
	.STACK _isAcidTankFull = 6
	;***       33 : }
	;***       34 : /********************** Check Input *******************/
	;***       35 : uint8_t isAcidTankFull(void) {
	;***       36 : 	if (I_ACID_H_PIN_FL3 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 36
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@2_5
.BB@LABEL@2_1:	; if_then_bb
	;***       37 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 37
	movw ax, !LOWW(_g_timerSetting+0x00058)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00070)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_4
.BB@LABEL@2_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].5, $.BB@LABEL@2_4
.BB@LABEL@2_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 48
	ret
.BB@LABEL@2_4:	; if_then_bb25
	;***       38 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***       39 : 				|| (g_mean_io_status.refined.io.AcidHighLevel == 1)) {
	;***       40 : 			g_mean_io_status.refined.io.AcidHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 40
	set1 !LOWW(_g_mean_io_status).5
	;***       41 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 41
	oneb a
	ret
.BB@LABEL@2_5:	; if_else_bb
	;***       42 : 		}
	;***       43 : 	} else {
	;***       44 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 44
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00072), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00070), ax
	;***       45 : 		g_mean_io_status.refined.io.AcidHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 45
	clr1 !LOWW(_g_mean_io_status).5
	br $.BB@LABEL@2_3
_isAcidTankAlmostFull:
	.STACK _isAcidTankAlmostFull = 6
	;***       46 : 	}
	;***       47 : 	return 0;
	;***       48 : }
	;***       49 : uint8_t isAcidTankAlmostFull(void) {
	;***       50 : 	if (I_ACID_M_PIN_FL2 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 50
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@3_5
.BB@LABEL@3_1:	; if_then_bb
	;***       51 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 51
	movw ax, !LOWW(_g_timerSetting+0x00054)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00056)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00074)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@3_4
.BB@LABEL@3_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].4, $.BB@LABEL@3_4
.BB@LABEL@3_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 62
	ret
.BB@LABEL@3_4:	; if_then_bb25
	;***       52 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***       53 : 				|| (g_mean_io_status.refined.io.AcidLowLevel == 1)) {
	;***       54 : 			g_mean_io_status.refined.io.AcidLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 54
	set1 !LOWW(_g_mean_io_status).4
	;***       55 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 55
	oneb a
	ret
.BB@LABEL@3_5:	; if_else_bb
	;***       56 : 		}
	;***       57 : 	} else {
	;***       58 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 58
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00076), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00074), ax
	;***       59 : 		g_mean_io_status.refined.io.AcidLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 59
	clr1 !LOWW(_g_mean_io_status).4
	br $.BB@LABEL@3_3
_isAcidTankHasSomething:
	.STACK _isAcidTankHasSomething = 6
	;***       60 : 	}
	;***       61 : 	return 0;
	;***       62 : }
	;***       63 : 
	;***       64 : uint8_t isAcidTankHasSomething(void) {
	;***       65 : 	if (I_ACID_L_PIN_FL1 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 65
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@4_5
.BB@LABEL@4_1:	; if_then_bb
	;***       66 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 66
	movw ax, !LOWW(_g_timerSetting+0x00050)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00052)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00078)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@4_4
.BB@LABEL@4_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].3, $.BB@LABEL@4_4
.BB@LABEL@4_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 77
	ret
.BB@LABEL@4_4:	; if_then_bb25
	;***       67 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***       68 : 				|| (g_mean_io_status.refined.io.AcidEmptyLevel == 1)) {
	;***       69 : 			g_mean_io_status.refined.io.AcidEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 69
	set1 !LOWW(_g_mean_io_status).3
	;***       70 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 70
	oneb a
	ret
.BB@LABEL@4_5:	; if_else_bb
	;***       71 : 		}
	;***       72 : 	} else {
	;***       73 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 73
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00078), ax
	;***       74 : 		isAcidTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 74
	call $!_isAcidTankEmpty
	br $.BB@LABEL@4_3
_isAcidTankAlmostEmpty:
	.STACK _isAcidTankAlmostEmpty = 6
	;***       75 : 	}
	;***       76 : 	return 0;
	;***       77 : }
	;***       78 : uint8_t isAcidTankAlmostEmpty(void) {
	;***       79 : 	if (!levelSkipErrorCheck() && isAcidTankHasSomething()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 79
	call !!_levelSkipErrorCheck
	cmp0 a
	bnz $.BB@LABEL@5_4
.BB@LABEL@5_1:	; bb8
	call $!_isAcidTankHasSomething
	cmp0 a
	bz $.BB@LABEL@5_4
.BB@LABEL@5_2:	; if_then_bb
	;***       80 : 		if (I_ACID_M_PIN_FL2 == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 80
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@5_5
.BB@LABEL@5_3:	; if_else_bb
	;***       81 : 			if (ns_delay_ms(&g_Tick.tickAcidLevel[4],
	;***       82 : 					g_timerSetting.t30_offDelayEmptyLevel_s * 1000)) {
	;***       83 : 				g_mean_io_status.refined.io.AcidLowLevel = 0;
	;***       84 : 				return 1;
	;***       85 : 			}
	;***       86 : 		} else {
	;***       87 : 			g_Tick.tickAcidLevel[4] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 87
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00082), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00080), ax
	;***       88 : 			isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 88
	call $!_isAcidTankHasSomething
.BB@LABEL@5_4:	; bb46
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 92
	ret
.BB@LABEL@5_5:	; if_then_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 81
	movw ax, !LOWW(_g_timerSetting+0x0005C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00080)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@5_4
.BB@LABEL@5_6:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 83
	clr1 !LOWW(_g_mean_io_status).4
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 84
	oneb a
	ret
_isAcidTankEmpty:
	.STACK _isAcidTankEmpty = 6
	;***       89 : 		}
	;***       90 : 	}
	;***       91 : 	return 0;
	;***       92 : }
	;***       93 : uint8_t isAcidTankEmpty(void) {
	;***       94 : 	if (I_ACID_L_PIN_FL1 == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 94
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@6_2
.BB@LABEL@6_1:	; if_else_bb
	;***       95 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
	;***       96 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***       97 : 				|| (g_mean_io_status.refined.io.AcidEmptyLevel == 0)) {
	;***       98 : 			g_mean_io_status.refined.io.AcidEmptyLevel = 0;
	;***       99 : 			return 1;
	;***      100 : 		}
	;***      101 : 	} else {
	;***      102 : 		g_Tick.tickAcidLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 102
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0007C), ax
	;***      103 : 		isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 103
	call $!_isAcidTankHasSomething
	br $.BB@LABEL@6_4
.BB@LABEL@6_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 95
	movw ax, !LOWW(_g_timerSetting+0x0005C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0007C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@6_5
.BB@LABEL@6_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].3, $.BB@LABEL@6_5
.BB@LABEL@6_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 106
	ret
.BB@LABEL@6_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 98
	clr1 !LOWW(_g_mean_io_status).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 99
	oneb a
	ret
_isAlkalineTankFull:
	.STACK _isAlkalineTankFull = 6
	;***      104 : 	}
	;***      105 : 	return 0;
	;***      106 : }
	;***      107 : uint8_t isAlkalineTankFull(void) {
	;***      108 : 	if (I_ALKALI_H_PIN_FL6 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 108
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@7_5
.BB@LABEL@7_1:	; if_then_bb
	;***      109 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 109
	movw ax, !LOWW(_g_timerSetting+0x00058)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00084)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@7_4
.BB@LABEL@7_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].2, $.BB@LABEL@7_4
.BB@LABEL@7_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 120
	ret
.BB@LABEL@7_4:	; if_then_bb25
	;***      110 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***      111 : 				|| (g_mean_io_status.refined.io.AlkalineHighLevel == 1)) {
	;***      112 : 			g_mean_io_status.refined.io.AlkalineHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 112
	set1 !LOWW(_g_mean_io_status).2
	;***      113 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 113
	oneb a
	ret
.BB@LABEL@7_5:	; if_else_bb
	;***      114 : 		}
	;***      115 : 	} else {
	;***      116 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 116
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00086), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00084), ax
	;***      117 : 		g_mean_io_status.refined.io.AlkalineHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 117
	clr1 !LOWW(_g_mean_io_status).2
	br $.BB@LABEL@7_3
_isAlkalineTankAlmostFull:
	.STACK _isAlkalineTankAlmostFull = 6
	;***      118 : 	}
	;***      119 : 	return 0;
	;***      120 : }
	;***      121 : uint8_t isAlkalineTankAlmostFull(void) {
	;***      122 : 	if (I_ALKALI_M_PIN_FL5 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 122
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@8_5
.BB@LABEL@8_1:	; if_then_bb
	;***      123 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 123
	movw ax, !LOWW(_g_timerSetting+0x00054)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00056)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00088)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].1, $.BB@LABEL@8_4
.BB@LABEL@8_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 134
	ret
.BB@LABEL@8_4:	; if_then_bb25
	;***      124 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      125 : 				|| (g_mean_io_status.refined.io.AlkalineLowLevel == 1)) {
	;***      126 : 			g_mean_io_status.refined.io.AlkalineLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 126
	set1 !LOWW(_g_mean_io_status).1
	;***      127 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 127
	oneb a
	ret
.BB@LABEL@8_5:	; if_else_bb
	;***      128 : 		}
	;***      129 : 	} else {
	;***      130 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 130
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0008A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00088), ax
	;***      131 : 		g_mean_io_status.refined.io.AlkalineLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 131
	clr1 !LOWW(_g_mean_io_status).1
	br $.BB@LABEL@8_3
_isAlkalineTankHasSomething_nonstop:
	.STACK _isAlkalineTankHasSomething_nonstop = 6
	;***      132 : 	}
	;***      133 : 	return 0;
	;***      134 : }
	;***      135 : uint8_t isAlkalineTankHasSomething_nonstop(void) {
	;***      136 : 	if (I_ALKALI_L_PIN_FL4 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 136
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@9_5
.BB@LABEL@9_1:	; if_then_bb
	;***      137 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 137
	movw ax, !LOWW(_g_timerSetting+0x00050)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00052)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0008C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_4
.BB@LABEL@9_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].0, $.BB@LABEL@9_4
.BB@LABEL@9_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 148
	ret
.BB@LABEL@9_4:	; if_then_bb25
	;***      138 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      139 : 				|| (g_mean_io_status.refined.io.AlkalineEmptyLevel == 1)) {
	;***      140 : 			g_mean_io_status.refined.io.AlkalineEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 140
	set1 !LOWW(_g_mean_io_status).0
	;***      141 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 141
	oneb a
	ret
.BB@LABEL@9_5:	; if_else_bb
	;***      142 : 		}
	;***      143 : 	} else {
	;***      144 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 144
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0008E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0008C), ax
	;***      145 : 		isAlkalineTankEmpty_nonstop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 145
	call $!_isAlkalineTankEmpty_nonstop
	br $.BB@LABEL@9_3
_isAlkalineTankAlmostEmpty:
	.STACK _isAlkalineTankAlmostEmpty = 6
	;***      146 : 	}
	;***      147 : 	return 0;
	;***      148 : }
	;***      149 : uint8_t isAlkalineTankAlmostEmpty(void) {
	;***      150 : 	if (!levelSkipErrorCheck() && isAlkalineTankHasSomething_nonstop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 150
	call !!_levelSkipErrorCheck
	cmp0 a
	bnz $.BB@LABEL@10_4
.BB@LABEL@10_1:	; bb8
	call $!_isAlkalineTankHasSomething_nonstop
	cmp0 a
	bz $.BB@LABEL@10_4
.BB@LABEL@10_2:	; if_then_bb
	;***      151 : 		if (I_ALKALI_M_PIN_FL5 == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 151
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@10_5
.BB@LABEL@10_3:	; if_else_bb
	;***      152 : 			if (ns_delay_ms(&g_Tick.tickAlkalineLevel[4],
	;***      153 : 					g_timerSetting.t30_offDelayEmptyLevel_s * 1000)) {
	;***      154 : 				g_mean_io_status.refined.io.AlkalineLowLevel = 0;
	;***      155 : 				return 1;
	;***      156 : 			}
	;***      157 : 		} else {
	;***      158 : 			g_Tick.tickAlkalineLevel[4] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 158
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00096), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00094), ax
	;***      159 : 			isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 159
	call $!_isAcidTankHasSomething
.BB@LABEL@10_4:	; bb46
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 163
	ret
.BB@LABEL@10_5:	; if_then_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 152
	movw ax, !LOWW(_g_timerSetting+0x0005C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00094)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@10_4
.BB@LABEL@10_6:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 154
	clr1 !LOWW(_g_mean_io_status).1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 155
	oneb a
	ret
_isAlkalineTankEmpty_nonstop:
	.STACK _isAlkalineTankEmpty_nonstop = 6
	;***      160 : 		}
	;***      161 : 	}
	;***      162 : 	return 0;
	;***      163 : }
	;***      164 : uint8_t isAlkalineTankEmpty_nonstop(void) {
	;***      165 : 	if (I_ALKALI_L_PIN_FL4 == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 165
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_else_bb
	;***      166 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
	;***      167 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      168 : 				|| (g_mean_io_status.refined.io.AlkalineEmptyLevel == 0)) {
	;***      169 : 			g_mean_io_status.refined.io.AlkalineEmptyLevel = 0;
	;***      170 : 			return 1;
	;***      171 : 		}
	;***      172 : 	} else {
	;***      173 : 		g_Tick.tickAlkalineLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 173
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00092), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00090), ax
	;***      174 : 		isAlkalineTankHasSomething_nonstop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 174
	call $!_isAlkalineTankHasSomething_nonstop
	br $.BB@LABEL@11_4
.BB@LABEL@11_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 166
	movw ax, !LOWW(_g_timerSetting+0x0005C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00090)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@11_5
.BB@LABEL@11_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].0, $.BB@LABEL@11_5
.BB@LABEL@11_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 177
	ret
.BB@LABEL@11_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 169
	clr1 !LOWW(_g_mean_io_status).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 170
	oneb a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***      175 : 	}
	;***      176 : 	return 0;
	;***      177 : }
	;***      178 : //TODO: Water flow measurement
	;***      179 : inline float measureFlowSensor(uint32_t s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 179
	push bc
	push ax
	subw sp, #0x0A
	;***      180 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 180
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x06], ax
	clrw ax
	movw [sp+0x00], ax
	oneb a
	mov [sp+0x02], a
	clrw ax
	movw [sp+0x04], ax
.BB@LABEL@12_1:	; bb27
	movw ax, [sp+0x0A]
	;***      181 : 	float flow_pluse = 0.0;
	;***      182 : 	uint8_t flow_pulse_state = I_OFF;
	;***      183 : 	while (!ns_delay_ms(&stamp_flow_sensor, s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 183
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, [sp+0x0C]
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, sp
	addw ax, #0x0006
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@12_7
.BB@LABEL@12_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      184 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 184
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@12_6
.BB@LABEL@12_3:	; if_then_bb
	;***      185 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 185
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@12_5
.BB@LABEL@12_4:	; if_then_bb20
	movw ax, #0x3F80
	;***      186 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 186
	push ax
	clrw ax
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x04]
	call !!__COM_fadd
	movw [sp+0x04], ax
	movw ax, bc
	movw [sp+0x08], ax
	addw sp, #0x04
.BB@LABEL@12_5:	; if_break_bb
	;***      187 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 187
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@12_6:	; if_break_bb26
	;***      188 : 		}
	;***      189 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 189
	call !!_R_WDT_Restart
	;***      190 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 190
	call !!_realTimeResponse
	br $.BB@LABEL@12_1
.BB@LABEL@12_7:	; bb39
	movw ax, #0x3F33
	;***      191 : 	}
	;***      192 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 192
	push ax
	mov a, #0x33
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x04]
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x4270
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x447A
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fdiv
	movw [sp+0x06], ax
	movw ax, bc
	movw [sp+0x04], ax
	addw sp, #0x04
	movw ax, [sp+0x0C]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_ultof
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fdiv
	movw de, ax
	movw !LOWW(_g_io_status+0x00004), ax
	movw ax, bc
	movw !LOWW(_g_io_status+0x00006), ax
	addw sp, #0x04
	;***      193 : 	return g_io_status.refined.FlowValue;
	;***      194 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 194
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***      195 : 
	;***      196 : uint8_t _pre_flow_state = I_OFF;
	;***      197 : float _flow_pulse;
	;***      198 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 198
	subw sp, #0x04
	;***      199 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***      200 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***      201 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 201
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	.bz $!.BB@LABEL@13_11
.BB@LABEL@13_1:	; entry
	dec a
	bz $.BB@LABEL@13_4
.BB@LABEL@13_2:	; entry
	dec a
	bz $.BB@LABEL@13_10
.BB@LABEL@13_3:	; switch_clause_bb53
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@13_9
.BB@LABEL@13_4:	; switch_clause_bb8
	;***      202 : 	case 0:
	;***      203 : //		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	;***      204 : //			(*state)++;
	;***      205 : //		}
	;***      206 : 		(*state)++;
	;***      207 : 		break;
	;***      208 : 	case 1:
	;***      209 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 209
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@13_7
.BB@LABEL@13_5:	; if_then_bb
	;***      210 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 210
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***      211 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 211
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@13_7
.BB@LABEL@13_6:	; if_then_bb27
	movw ax, #0x3F80
	;***      212 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 212
	push ax
	clrw ax
	push ax
	movw bc, !LOWW(__flow_pulse+0x00002)
	movw ax, !LOWW(__flow_pulse)
	call !!__COM_fadd
	movw !LOWW(__flow_pulse), ax
	movw ax, bc
	movw !LOWW(__flow_pulse+0x00002), ax
	addw sp, #0x04
.BB@LABEL@13_7:	; if_break_bb30
	;***      213 : 			}
	;***      214 : 		}
	;***      215 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 215
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0000A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00024)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@13_12
.BB@LABEL@13_8:	; if_then_bb39
	;***      216 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***      217 : 			(*state)++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 217
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@13_9:	; if_then_bb39
	br $.BB@LABEL@13_12
.BB@LABEL@13_10:	; switch_clause_bb44
	movw ax, #0x3F33
	;***      218 : 		}
	;***      219 : 		break;
	;***      220 : 	case 2:
	;***      221 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 221
	push ax
	mov a, #0x33
	push ax
	movw bc, !LOWW(__flow_pulse+0x00002)
	movw ax, !LOWW(__flow_pulse)
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x4270
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x447A
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fdiv
	movw [sp+0x06], ax
	movw ax, bc
	movw [sp+0x04], ax
	addw sp, #0x04
	movw bc, !LOWW(_g_timerSetting+0x0000A)
	movw ax, !LOWW(_g_timerSetting+0x00008)
	call !!__COM_ultof
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fdiv
	movw de, ax
	movw ax, bc
	addw sp, #0x04
	movw !LOWW(_g_io_status+0x00006), ax
	movw ax, de
	movw !LOWW(_g_io_status+0x00004), ax
	clrw ax
	;***      222 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***      223 : 		_flow_pulse = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 223
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@13_3
.BB@LABEL@13_11:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 206
	inc a
	mov !LOWW(_g_machine_state+0x00005), a
.BB@LABEL@13_12:	; switch_break_bb
	;***      224 : 		(*state) = 0;
	;***      225 : 		break;
	;***      226 : 	default:
	;***      227 : 		(*state) = 0;
	;***      228 : 		break;
	;***      229 : 	}
	;***      230 : 	return g_io_status.refined.FlowValue;
	;***      231 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 231
	movw bc, !LOWW(_g_io_status+0x00006)
	movw ax, !LOWW(_g_io_status+0x00004)
	addw sp, #0x04
	ret
	.SECTION .data,DATA
__pre_flow_state:
	.DB 0x01
	.SECTION .bss,BSS
	.ALIGN 2
__flow_pulse:
	.DS (4)
