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
#@  compiled at Thu May 05 10:01:49 2022

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
	.PUBLIC _isAcidTankEmpty
	.PUBLIC _isAlkalineTankFull
	.PUBLIC _isAlkalineTankAlmostFull
	.PUBLIC _isAlkalineTankHasSomething_nonstop
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
	;***       21 : 	if(O_SPOUT_ACID_PIN_SV3 == OFF && O_DRAIN_ACID_PIN_SV5 == OFF){
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
	;***       23 : 	}else{
	;***       24 : 		O_ACID_PUMP_PIN_P1 = io->Pump1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 24
	mov a, [de+0x03]
	mov1 CY, a.0
	mov a, 0xFFF06
	mov1 a.2, CY
	mov 0xFFF06, a
.BB@LABEL@1_4:	; if_break_bb
	;***       25 : 	}
	;***       26 : 	if(O_DRAIN_ALK_PIN_SV6 == OFF && O_SPOUT_ALK_PIN_SV4 == OFF){
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
	;***       28 : 	}else{
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
	;***       63 : uint8_t isAcidTankHasSomething(void) {
	;***       64 : 	if (I_ACID_L_PIN_FL1 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 64
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@4_5
.BB@LABEL@4_1:	; if_then_bb
	;***       65 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 65
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 76
	ret
.BB@LABEL@4_4:	; if_then_bb25
	;***       66 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***       67 : 				|| (g_mean_io_status.refined.io.AcidEmptyLevel == 1)) {
	;***       68 : 			g_mean_io_status.refined.io.AcidEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 68
	set1 !LOWW(_g_mean_io_status).3
	;***       69 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 69
	oneb a
	ret
.BB@LABEL@4_5:	; if_else_bb
	;***       70 : 		}
	;***       71 : 	} else {
	;***       72 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 72
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00078), ax
	;***       73 : 		isAcidTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 73
	call $!_isAcidTankEmpty
	br $.BB@LABEL@4_3
_isAcidTankEmpty:
	.STACK _isAcidTankEmpty = 6
	;***       74 : 	}
	;***       75 : 	return 0;
	;***       76 : }
	;***       77 : uint8_t isAcidTankEmpty(void) {
	;***       78 : 	if (I_ACID_L_PIN_FL1 == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 78
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@5_2
.BB@LABEL@5_1:	; if_else_bb
	;***       79 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
	;***       80 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***       81 : 				|| (g_mean_io_status.refined.io.AcidEmptyLevel == 0)) {
	;***       82 : 			g_mean_io_status.refined.io.AcidEmptyLevel = 0;
	;***       83 : 			return 1;
	;***       84 : 		}
	;***       85 : 	} else {
	;***       86 : 		g_Tick.tickAcidLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 86
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0007C), ax
	;***       87 : 		isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 87
	call $!_isAcidTankHasSomething
	br $.BB@LABEL@5_4
.BB@LABEL@5_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 79
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
	bnz $.BB@LABEL@5_5
.BB@LABEL@5_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].3, $.BB@LABEL@5_5
.BB@LABEL@5_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 90
	ret
.BB@LABEL@5_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 82
	clr1 !LOWW(_g_mean_io_status).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 83
	oneb a
	ret
_isAlkalineTankFull:
	.STACK _isAlkalineTankFull = 6
	;***       88 : 	}
	;***       89 : 	return 0;
	;***       90 : }
	;***       91 : uint8_t isAlkalineTankFull(void) {
	;***       92 : 	if (I_ALKALI_H_PIN_FL6 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 92
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@6_5
.BB@LABEL@6_1:	; if_then_bb
	;***       93 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 93
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
	bnz $.BB@LABEL@6_4
.BB@LABEL@6_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].2, $.BB@LABEL@6_4
.BB@LABEL@6_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 104
	ret
.BB@LABEL@6_4:	; if_then_bb25
	;***       94 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***       95 : 				|| (g_mean_io_status.refined.io.AlkalineHighLevel == 1)) {
	;***       96 : 			g_mean_io_status.refined.io.AlkalineHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 96
	set1 !LOWW(_g_mean_io_status).2
	;***       97 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 97
	oneb a
	ret
.BB@LABEL@6_5:	; if_else_bb
	;***       98 : 		}
	;***       99 : 	} else {
	;***      100 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 100
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00082), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00080), ax
	;***      101 : 		g_mean_io_status.refined.io.AlkalineHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 101
	clr1 !LOWW(_g_mean_io_status).2
	br $.BB@LABEL@6_3
_isAlkalineTankAlmostFull:
	.STACK _isAlkalineTankAlmostFull = 6
	;***      102 : 	}
	;***      103 : 	return 0;
	;***      104 : }
	;***      105 : uint8_t isAlkalineTankAlmostFull(void) {
	;***      106 : 	if (I_ALKALI_M_PIN_FL5 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 106
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@7_5
.BB@LABEL@7_1:	; if_then_bb
	;***      107 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 107
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
	bnz $.BB@LABEL@7_4
.BB@LABEL@7_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].1, $.BB@LABEL@7_4
.BB@LABEL@7_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 118
	ret
.BB@LABEL@7_4:	; if_then_bb25
	;***      108 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      109 : 				|| (g_mean_io_status.refined.io.AlkalineLowLevel == 1)) {
	;***      110 : 			g_mean_io_status.refined.io.AlkalineLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 110
	set1 !LOWW(_g_mean_io_status).1
	;***      111 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 111
	oneb a
	ret
.BB@LABEL@7_5:	; if_else_bb
	;***      112 : 		}
	;***      113 : 	} else {
	;***      114 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 114
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00086), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00084), ax
	;***      115 : 		g_mean_io_status.refined.io.AlkalineLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 115
	clr1 !LOWW(_g_mean_io_status).1
	br $.BB@LABEL@7_3
_isAlkalineTankHasSomething_nonstop:
	.STACK _isAlkalineTankHasSomething_nonstop = 6
	;***      116 : 	}
	;***      117 : 	return 0;
	;***      118 : }
	;***      119 : uint8_t isAlkalineTankHasSomething_nonstop(void) {
	;***      120 : 	if (I_ALKALI_L_PIN_FL4 == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 120
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@8_5
.BB@LABEL@8_1:	; if_then_bb
	;***      121 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 121
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
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].0, $.BB@LABEL@8_4
.BB@LABEL@8_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 132
	ret
.BB@LABEL@8_4:	; if_then_bb25
	;***      122 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      123 : 				|| (g_mean_io_status.refined.io.AlkalineEmptyLevel == 1)) {
	;***      124 : 			g_mean_io_status.refined.io.AlkalineEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 124
	set1 !LOWW(_g_mean_io_status).0
	;***      125 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 125
	oneb a
	ret
.BB@LABEL@8_5:	; if_else_bb
	;***      126 : 		}
	;***      127 : 	} else {
	;***      128 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 128
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0008A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00088), ax
	;***      129 : 		isAlkalineTankEmpty_nonstop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 129
	call $!_isAlkalineTankEmpty_nonstop
	br $.BB@LABEL@8_3
_isAlkalineTankEmpty_nonstop:
	.STACK _isAlkalineTankEmpty_nonstop = 6
	;***      130 : 	}
	;***      131 : 	return 0;
	;***      132 : }
	;***      133 : uint8_t isAlkalineTankEmpty_nonstop(void) {
	;***      134 : 	if (I_ALKALI_L_PIN_FL4 == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 134
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@9_2
.BB@LABEL@9_1:	; if_else_bb
	;***      135 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
	;***      136 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      137 : 				|| (g_mean_io_status.refined.io.AlkalineEmptyLevel == 0)) {
	;***      138 : 			g_mean_io_status.refined.io.AlkalineEmptyLevel = 0;
	;***      139 : 			return 1;
	;***      140 : 		}
	;***      141 : 	} else {
	;***      142 : 		g_Tick.tickAlkalineLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 142
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0008E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0008C), ax
	;***      143 : 		isAlkalineTankHasSomething_nonstop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 143
	call $!_isAlkalineTankHasSomething_nonstop
	br $.BB@LABEL@9_4
.BB@LABEL@9_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 135
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
	bnz $.BB@LABEL@9_5
.BB@LABEL@9_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].0, $.BB@LABEL@9_5
.BB@LABEL@9_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 146
	ret
.BB@LABEL@9_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 138
	clr1 !LOWW(_g_mean_io_status).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 139
	oneb a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***      144 : 	}
	;***      145 : 	return 0;
	;***      146 : }
	;***      147 : //TODO: Water flow measurement
	;***      148 : inline float measureFlowSensor(uint32_t *s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 148
	push ax
	subw sp, #0x0C
	;***      149 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 149
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
.BB@LABEL@10_1:	; bb27
	movw ax, [sp+0x0C]
	movw de, ax
	;***      150 : 	float flow_pluse = 0.0;
	;***      151 : 	uint8_t flow_pulse_state = I_OFF;
	;***      152 : 	while (!ns_delay_ms(&stamp_flow_sensor, (*s) * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 152
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
	bnz $.BB@LABEL@10_7
.BB@LABEL@10_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      153 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 153
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@10_6
.BB@LABEL@10_3:	; if_then_bb
	;***      154 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 154
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@10_5
.BB@LABEL@10_4:	; if_then_bb20
	movw ax, #0x3F80
	;***      155 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 155
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
.BB@LABEL@10_5:	; if_break_bb
	;***      156 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 156
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@10_6:	; if_break_bb26
	;***      157 : 		}
	;***      158 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 158
	call !!_R_WDT_Restart
	;***      159 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 159
	call !!_realTimeResponse
	br $.BB@LABEL@10_1
.BB@LABEL@10_7:	; bb40
	movw ax, #0x3F33
	;***      160 : 	}
	;***      161 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 161
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
	;***      162 : 	return g_io_status.refined.FlowValue;
	;***      163 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 163
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***      164 : 
	;***      165 : uint8_t _pre_flow_state = I_OFF;
	;***      166 : float _flow_pulse;
	;***      167 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 167
	subw sp, #0x04
	;***      168 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***      169 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***      170 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 170
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@11_4
.BB@LABEL@11_1:	; entry
	dec a
	bz $.BB@LABEL@11_5
.BB@LABEL@11_2:	; entry
	dec a
	bz $.BB@LABEL@11_12
.BB@LABEL@11_3:	; switch_clause_bb61
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@11_11
.BB@LABEL@11_4:	; switch_clause_bb
	;***      171 : 	case 0:
	;***      172 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 172
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@11_9
.BB@LABEL@11_5:	; switch_clause_bb14
	;***      173 : 			(*state)++;
	;***      174 : 		}
	;***      175 : 		break;
	;***      176 : 	case 1:
	;***      177 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 177
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@11_8
.BB@LABEL@11_6:	; if_then_bb24
	;***      178 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 178
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***      179 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 179
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@11_8
.BB@LABEL@11_7:	; if_then_bb35
	movw ax, #0x3F80
	;***      180 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 180
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
.BB@LABEL@11_8:	; if_break_bb39
	;***      181 : 			}
	;***      182 : 		}
	;***      183 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 183
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0000A)
.BB@LABEL@11_9:	; if_break_bb39
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
.BB@LABEL@11_10:	; if_then_bb47
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@11_11:	; switch_break_bb
	;***      184 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***      185 : 			(*state)++;
	;***      186 : 		}
	;***      187 : 		break;
	;***      188 : 	case 2:
	;***      189 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***      190 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***      191 : 		_flow_pulse = 0;
	;***      192 : 		(*state) = 0;
	;***      193 : 		break;
	;***      194 : 	default:
	;***      195 : 		(*state) = 0;
	;***      196 : 		break;
	;***      197 : 	}
	;***      198 : 	return g_io_status.refined.FlowValue;
	;***      199 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 199
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@11_12:	; switch_clause_bb52
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 189
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/io_control.c", 191
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@11_3
	.SECTION .data,DATA
__pre_flow_state:
	.DB 0x01
	.SECTION .bss,BSS
	.ALIGN 2
__flow_pulse:
	.DS (4)
