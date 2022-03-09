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
#@  compiled at Wed Mar 09 09:37:16 2022

	.EXTERN _g_timerSetting
	.EXTERN _g_io_status
	.EXTERN _g_mean_io_status
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_systemTime
	.PUBLIC __pre_flow_state
	.PUBLIC __flow_pulse
	.PUBLIC _isAcidTankFull
	.EXTERN _ns_delay_ms
	.PUBLIC _isAcidTankAlmostFull
	.PUBLIC _isAcidTankHasSomething
	.PUBLIC _isAcidTankEmpty
	.PUBLIC _isAlkalineTankFull
	.PUBLIC _isAlkalineTankAlmostFull
	.PUBLIC _isAlkalineTankHasSomething_nonstop
	.PUBLIC _isAlkalineTankEmpty_nonstop
	.PUBLIC _measureFlowSensor
	.EXTERN _R_WDT_Restart
	.PUBLIC _measureFlowSensor_nostop

	.SECTION .textf,TEXTF
_isAcidTankFull:
	.STACK _isAcidTankFull = 6
	;***        1 : /*
	;***        2 :  * io_control.c
	;***        3 :  *
	;***        4 :  *  Created on: 6 Jan 2022
	;***        5 :  *      Author: Hung
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "io_control.h"
	;***        9 : 
	;***       10 : /********************** Check Input *******************/
	;***       11 : uint8_t isAcidTankFull(void) {
	;***       12 : 	if (I_ACID_H_PIN_FL3 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 12
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@1_5
.BB@LABEL@1_1:	; if_then_bb
	;***       13 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 13
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
	bnz $.BB@LABEL@1_4
.BB@LABEL@1_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].5, $.BB@LABEL@1_4
.BB@LABEL@1_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 24
	ret
.BB@LABEL@1_4:	; if_then_bb25
	;***       14 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***       15 : 				|| (g_mean_io_status.refined.io.AcidHighLevel == 1)) {
	;***       16 : 			g_mean_io_status.refined.io.AcidHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 16
	set1 !LOWW(_g_mean_io_status).5
	;***       17 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 17
	oneb a
	ret
.BB@LABEL@1_5:	; if_else_bb
	;***       18 : 		}
	;***       19 : 	} else {
	;***       20 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 20
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00072), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00070), ax
	;***       21 : 		g_mean_io_status.refined.io.AcidHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 21
	clr1 !LOWW(_g_mean_io_status).5
	br $.BB@LABEL@1_3
_isAcidTankAlmostFull:
	.STACK _isAcidTankAlmostFull = 6
	;***       22 : 	}
	;***       23 : 	return 0;
	;***       24 : }
	;***       25 : uint8_t isAcidTankAlmostFull(void) {
	;***       26 : 	if (I_ACID_M_PIN_FL2 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 26
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@2_5
.BB@LABEL@2_1:	; if_then_bb
	;***       27 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 27
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
	bnz $.BB@LABEL@2_4
.BB@LABEL@2_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].4, $.BB@LABEL@2_4
.BB@LABEL@2_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 38
	ret
.BB@LABEL@2_4:	; if_then_bb25
	;***       28 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***       29 : 				|| (g_mean_io_status.refined.io.AcidLowLevel == 1)) {
	;***       30 : 			g_mean_io_status.refined.io.AcidLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 30
	set1 !LOWW(_g_mean_io_status).4
	;***       31 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 31
	oneb a
	ret
.BB@LABEL@2_5:	; if_else_bb
	;***       32 : 		}
	;***       33 : 	} else {
	;***       34 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 34
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00076), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00074), ax
	;***       35 : 		g_mean_io_status.refined.io.AcidLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 35
	clr1 !LOWW(_g_mean_io_status).4
	br $.BB@LABEL@2_3
_isAcidTankHasSomething:
	.STACK _isAcidTankHasSomething = 6
	;***       36 : 	}
	;***       37 : 	return 0;
	;***       38 : }
	;***       39 : uint8_t isAcidTankHasSomething(void) {
	;***       40 : 	if (I_ACID_L_PIN_FL1 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 40
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@3_5
.BB@LABEL@3_1:	; if_then_bb
	;***       41 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 41
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
	bnz $.BB@LABEL@3_4
.BB@LABEL@3_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].3, $.BB@LABEL@3_4
.BB@LABEL@3_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 52
	ret
.BB@LABEL@3_4:	; if_then_bb25
	;***       42 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***       43 : 				|| (g_mean_io_status.refined.io.AcidEmptyLevel == 1)) {
	;***       44 : 			g_mean_io_status.refined.io.AcidEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 44
	set1 !LOWW(_g_mean_io_status).3
	;***       45 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 45
	oneb a
	ret
.BB@LABEL@3_5:	; if_else_bb
	;***       46 : 		}
	;***       47 : 	} else {
	;***       48 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 48
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00078), ax
	;***       49 : 		isAcidTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 49
	call $!_isAcidTankEmpty
	br $.BB@LABEL@3_3
_isAcidTankEmpty:
	.STACK _isAcidTankEmpty = 6
	;***       50 : 	}
	;***       51 : 	return 0;
	;***       52 : }
	;***       53 : uint8_t isAcidTankEmpty(void) {
	;***       54 : 	if (I_ACID_L_PIN_FL1 == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 54
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@4_2
.BB@LABEL@4_1:	; if_else_bb
	;***       55 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
	;***       56 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***       57 : 				|| (g_mean_io_status.refined.io.AcidEmptyLevel == 0)) {
	;***       58 : 			g_mean_io_status.refined.io.AcidEmptyLevel = 0;
	;***       59 : 			return 1;
	;***       60 : 		}
	;***       61 : 	} else {
	;***       62 : 		g_Tick.tickAcidLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 62
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0007C), ax
	;***       63 : 		isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 63
	call $!_isAcidTankHasSomething
	br $.BB@LABEL@4_4
.BB@LABEL@4_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 55
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
	bnz $.BB@LABEL@4_5
.BB@LABEL@4_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].3, $.BB@LABEL@4_5
.BB@LABEL@4_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 66
	ret
.BB@LABEL@4_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 58
	clr1 !LOWW(_g_mean_io_status).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 59
	oneb a
	ret
_isAlkalineTankFull:
	.STACK _isAlkalineTankFull = 6
	;***       64 : 	}
	;***       65 : 	return 0;
	;***       66 : }
	;***       67 : uint8_t isAlkalineTankFull(void) {
	;***       68 : 	if (I_ALKALI_H_PIN_FL6 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 68
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@5_5
.BB@LABEL@5_1:	; if_then_bb
	;***       69 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 69
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
	movw ax, #LOWW(_g_Tick+0x00080)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@5_4
.BB@LABEL@5_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].2, $.BB@LABEL@5_4
.BB@LABEL@5_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 80
	ret
.BB@LABEL@5_4:	; if_then_bb25
	;***       70 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***       71 : 				|| (g_mean_io_status.refined.io.AlkalineHighLevel == 1)) {
	;***       72 : 			g_mean_io_status.refined.io.AlkalineHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 72
	set1 !LOWW(_g_mean_io_status).2
	;***       73 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 73
	oneb a
	ret
.BB@LABEL@5_5:	; if_else_bb
	;***       74 : 		}
	;***       75 : 	} else {
	;***       76 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 76
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00082), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00080), ax
	;***       77 : 		g_mean_io_status.refined.io.AlkalineHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 77
	clr1 !LOWW(_g_mean_io_status).2
	br $.BB@LABEL@5_3
_isAlkalineTankAlmostFull:
	.STACK _isAlkalineTankAlmostFull = 6
	;***       78 : 	}
	;***       79 : 	return 0;
	;***       80 : }
	;***       81 : uint8_t isAlkalineTankAlmostFull(void) {
	;***       82 : 	if (I_ALKALI_M_PIN_FL5 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 82
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@6_5
.BB@LABEL@6_1:	; if_then_bb
	;***       83 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 83
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
	movw ax, #LOWW(_g_Tick+0x00084)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@6_4
.BB@LABEL@6_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].1, $.BB@LABEL@6_4
.BB@LABEL@6_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 94
	ret
.BB@LABEL@6_4:	; if_then_bb25
	;***       84 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***       85 : 				|| (g_mean_io_status.refined.io.AlkalineLowLevel == 1)) {
	;***       86 : 			g_mean_io_status.refined.io.AlkalineLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 86
	set1 !LOWW(_g_mean_io_status).1
	;***       87 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 87
	oneb a
	ret
.BB@LABEL@6_5:	; if_else_bb
	;***       88 : 		}
	;***       89 : 	} else {
	;***       90 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 90
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00086), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00084), ax
	;***       91 : 		g_mean_io_status.refined.io.AlkalineLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 91
	clr1 !LOWW(_g_mean_io_status).1
	br $.BB@LABEL@6_3
_isAlkalineTankHasSomething_nonstop:
	.STACK _isAlkalineTankHasSomething_nonstop = 6
	;***       92 : 	}
	;***       93 : 	return 0;
	;***       94 : }
	;***       95 : uint8_t isAlkalineTankHasSomething_nonstop(void) {
	;***       96 : 	if (I_ALKALI_L_PIN_FL4 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 96
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@7_5
.BB@LABEL@7_1:	; if_then_bb
	;***       97 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 97
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
	movw ax, #LOWW(_g_Tick+0x00088)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@7_4
.BB@LABEL@7_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].0, $.BB@LABEL@7_4
.BB@LABEL@7_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 108
	ret
.BB@LABEL@7_4:	; if_then_bb25
	;***       98 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***       99 : 				|| (g_mean_io_status.refined.io.AlkalineEmptyLevel == 1)) {
	;***      100 : 			g_mean_io_status.refined.io.AlkalineEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 100
	set1 !LOWW(_g_mean_io_status).0
	;***      101 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 101
	oneb a
	ret
.BB@LABEL@7_5:	; if_else_bb
	;***      102 : 		}
	;***      103 : 	} else {
	;***      104 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 104
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0008A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00088), ax
	;***      105 : 		isAlkalineTankEmpty_nonstop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 105
	call $!_isAlkalineTankEmpty_nonstop
	br $.BB@LABEL@7_3
_isAlkalineTankEmpty_nonstop:
	.STACK _isAlkalineTankEmpty_nonstop = 6
	;***      106 : 	}
	;***      107 : 	return 0;
	;***      108 : }
	;***      109 : uint8_t isAlkalineTankEmpty_nonstop(void) {
	;***      110 : 	if (I_ALKALI_L_PIN_FL4 == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 110
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@8_2
.BB@LABEL@8_1:	; if_else_bb
	;***      111 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
	;***      112 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      113 : 				|| (g_mean_io_status.refined.io.AlkalineEmptyLevel == 0)) {
	;***      114 : 			g_mean_io_status.refined.io.AlkalineEmptyLevel = 0;
	;***      115 : 			return 1;
	;***      116 : 		}
	;***      117 : 	} else {
	;***      118 : 		g_Tick.tickAlkalineLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 118
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0008E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0008C), ax
	;***      119 : 		isAlkalineTankHasSomething_nonstop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 119
	call $!_isAlkalineTankHasSomething_nonstop
	br $.BB@LABEL@8_4
.BB@LABEL@8_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 111
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
	movw ax, #LOWW(_g_Tick+0x0008C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_5
.BB@LABEL@8_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].0, $.BB@LABEL@8_5
.BB@LABEL@8_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 122
	ret
.BB@LABEL@8_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 114
	clr1 !LOWW(_g_mean_io_status).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 115
	oneb a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***      120 : 	}
	;***      121 : 	return 0;
	;***      122 : }
	;***      123 : //TODO: Water flow measurement
	;***      124 : inline float measureFlowSensor(uint32_t *s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 124
	push ax
	subw sp, #0x0C
	;***      125 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 125
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x0A], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x08], ax
	clrw ax
	movw [sp+0x00], ax
	oneb a
	mov [sp+0x02], a
	clrw ax
	movw [sp+0x04], ax
.BB@LABEL@9_1:	; bb27
	movw ax, [sp+0x0C]
	movw de, ax
	;***      126 : 	float flow_pluse = 0.0;
	;***      127 : 	uint8_t flow_pulse_state = I_OFF;
	;***      128 : 	while (!ns_delay_ms(&stamp_flow_sensor, (*s) * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 128
	movw bc, #0x03E8
	movw ax, [de]
	mulhu
	movw hl, ax
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, [de+0x02]
	movw bc, #0x03E8
	mulh
	movw de, ax
	push hl
	pop bc
	movw ax, [sp+0x06]
	addw ax, de
	movw de, ax
	movw ax, sp
	addw ax, #0x0008
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_7
.BB@LABEL@9_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      129 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 129
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@9_6
.BB@LABEL@9_3:	; if_then_bb
	;***      130 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 130
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@9_5
.BB@LABEL@9_4:	; if_then_bb20
	movw ax, #0x3F80
	;***      131 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 131
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
.BB@LABEL@9_5:	; if_break_bb
	;***      132 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 132
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@9_6:	; if_break_bb26
	;***      133 : 		}
	;***      134 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 134
	call !!_R_WDT_Restart
	br $.BB@LABEL@9_1
.BB@LABEL@9_7:	; bb40
	movw ax, #0x3F33
	;***      135 : 	}
	;***      136 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 136
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
	movw de, ax
	movw ax, [de+0x02]
	movw bc, ax
	movw ax, [de]
	call !!__COM_ultof
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fdiv
	movw de, ax
	movw !LOWW(_g_io_status+0x00006), ax
	movw ax, bc
	movw !LOWW(_g_io_status+0x00008), ax
	addw sp, #0x04
	;***      137 : 	return g_io_status.refined.FlowValue;
	;***      138 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 138
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***      139 : 
	;***      140 : uint8_t _pre_flow_state = I_OFF;
	;***      141 : float _flow_pulse;
	;***      142 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 142
	subw sp, #0x04
	;***      143 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***      144 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***      145 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 145
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@10_4
.BB@LABEL@10_1:	; entry
	dec a
	bz $.BB@LABEL@10_5
.BB@LABEL@10_2:	; entry
	dec a
	bz $.BB@LABEL@10_12
.BB@LABEL@10_3:	; switch_clause_bb61
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@10_11
.BB@LABEL@10_4:	; switch_clause_bb
	;***      146 : 	case 0:
	;***      147 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 147
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@10_9
.BB@LABEL@10_5:	; switch_clause_bb14
	;***      148 : 			(*state)++;
	;***      149 : 		}
	;***      150 : 		break;
	;***      151 : 	case 1:
	;***      152 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 152
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@10_8
.BB@LABEL@10_6:	; if_then_bb24
	;***      153 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 153
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***      154 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 154
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@10_8
.BB@LABEL@10_7:	; if_then_bb35
	movw ax, #0x3F80
	;***      155 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 155
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
.BB@LABEL@10_8:	; if_break_bb39
	;***      156 : 			}
	;***      157 : 		}
	;***      158 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 158
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0000A)
.BB@LABEL@10_9:	; if_break_bb39
	push bc
	pop hl
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
	skz
.BB@LABEL@10_10:	; if_then_bb47
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@10_11:	; switch_break_bb
	;***      159 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***      160 : 			(*state)++;
	;***      161 : 		}
	;***      162 : 		break;
	;***      163 : 	case 2:
	;***      164 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***      165 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***      166 : 		_flow_pulse = 0;
	;***      167 : 		(*state) = 0;
	;***      168 : 		break;
	;***      169 : 	default:
	;***      170 : 		(*state) = 0;
	;***      171 : 		break;
	;***      172 : 	}
	;***      173 : 	return g_io_status.refined.FlowValue;
	;***      174 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 174
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@10_12:	; switch_clause_bb52
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 164
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
	movw !LOWW(_g_io_status+0x00008), ax
	movw ax, de
	movw !LOWW(_g_io_status+0x00006), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 166
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@10_3
	.SECTION .data,DATA
__pre_flow_state:
	.DB 0x01
	.SECTION .bss,BSS
	.ALIGN 2
__flow_pulse:
	.DS (4)
