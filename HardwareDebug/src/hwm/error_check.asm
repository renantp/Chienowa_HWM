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
#@   -o src/hwm/error_check.obj
#@   ../src/hwm/error_check.c
#@  compiled at Thu Jun 30 14:37:30 2022

	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_io_status
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_systemTime
	.PUBLIC _g_alarm
	.PUBLIC _Voltage1Check_waitReset
	.EXTERN _ns_delay_ms
	.EXTERN _resetAlarm
	.EXTERN _waitAlarmConfirm_stop
	.PUBLIC _Voltage2Check_nostop
	.PUBLIC _Voltage3Check_waitReset
	.PUBLIC _LowVoltageCheck_waitReset
	.PUBLIC _OverCurrentCheck_waitReset
	.PUBLIC _FlowSensorCheck_nonstop
	.PUBLIC _solenoidCheck_nonstop
	.EXTERN _sendToRasPi_f
	.PUBLIC _saltWaterTankFullCheck_nonstop
	.PUBLIC _saltWaterTankEmptyCheck
	.PUBLIC _acidSkipErrorCheck_nonstop
	.PUBLIC _alkalineSkipErrorCheck
	.PUBLIC _waterFullErrorCheck
	.PUBLIC _filterReplacementErrorCheck
	.EXTERN _sendToRasPi_u32
	.PUBLIC _levelSkipErrorCheck

	.SECTION .textf,TEXTF
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***        1 : /*
	;***        2 :  * hwm_error_check.c
	;***        3 :  *
	;***        4 :  *  Created on: 6 Jan 2022
	;***        5 :  *      Author: Hung
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "error_check.h"
	;***        9 : union Alarm_Flag_u g_alarm;
	;***       10 : 
	;***       11 : /**
	;***       12 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***       13 :  * 30/11/2021: Checked by An
	;***       14 :  * @return 0 - OK; 1 - Error
	;***       15 :  */
	;***       16 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 16
	subw sp, #0x0A
	;***       17 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 17
	movw ax, !LOWW(_g_numberSetting+0x00002)
	movw [sp+0x02], ax
	push ax
	movw ax, !LOWW(_g_numberSetting)
	movw [sp+0x0A], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x00008)
	movw [sp+0x0A], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, [sp+0x02]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@1_1:	; entry
	clrb a
.BB@LABEL@1_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@1_3:	; entry
	clrb x
.BB@LABEL@1_4:	; entry
	or x, a
	bnz $.BB@LABEL@1_11
.BB@LABEL@1_5:	; if_then_bb
	;***       18 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 18
	movw ax, !LOWW(_g_timerSetting+0x00028)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0002A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0002C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@1_8
.BB@LABEL@1_6:	; bb33
	clrb a
.BB@LABEL@1_7:	; bb33
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 32
	ret
.BB@LABEL@1_8:	; if_then_bb11
	;***       19 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***       20 : 			resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 20
	call !!_resetAlarm
	;***       21 : //			sendToRasPi_f(H_ALARM, OVER_VOLTAGE_1,
	;***       22 : //					g_io_status.refined.CVCCVoltage);
	;***       23 : 			g_alarm.refined.over_voltage_1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 23
	set1 !LOWW(_g_alarm).0
	;***       24 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 24
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@1_9:	; if_then_bb11.bb22_crit_edge
	oneb a
.BB@LABEL@1_10:	; bb22
	mov !LOWW(_g_machine_state+0x00008), a
	;***       25 : 			waitAlarmConfirm_stop(OVER_VOLTAGE_1, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 25
	movw ax, #0x0500
	call !!_waitAlarmConfirm_stop
	;***       26 : 			g_alarm.refined.over_voltage_1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 26
	clr1 !LOWW(_g_alarm).0
	;***       27 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 27
	oneb a
	br $.BB@LABEL@1_7
.BB@LABEL@1_11:	; if_else_bb
	;***       28 : 		}
	;***       29 : 	} else
	;***       30 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 30
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	br $.BB@LABEL@1_6
_Voltage2Check_nostop:
	.STACK _Voltage2Check_nostop = 18
	;***       31 : 	return 0;
	;***       32 : }
	;***       33 : /**
	;***       34 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***       35 :  * 16/12/2021: Checked by An
	;***       36 :  * @return 0 - OK
	;***       37 :  */
	;***       38 : void Voltage2Check_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 38
	subw sp, #0x0A
	;***       39 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 39
	movw ax, !LOWW(_g_numberSetting+0x00006)
	movw [sp+0x02], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00004)
	movw [sp+0x0A], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x00008)
	movw [sp+0x0A], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, [sp+0x02]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@2_1:	; entry
	clrb a
.BB@LABEL@2_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@2_3:	; entry
	clrb x
.BB@LABEL@2_4:	; entry
	or x, a
	bnz $.BB@LABEL@2_9
.BB@LABEL@2_5:	; if_then_bb
	;***       40 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 40
	movw ax, !LOWW(_g_timerSetting+0x0002C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0002E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00030)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_8
.BB@LABEL@2_6:	; if_then_bb10
	;***       41 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***       42 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 42
	movw ax, !LOWW(_g_numberSetting+0x00002)
	push ax
	movw ax, !LOWW(_g_numberSetting)
	push ax
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw ax, !LOWW(_g_io_status+0x00008)
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@2_8
.BB@LABEL@2_7:	; if_then_bb20
	;***       43 : 					>= g_numberSetting.upperVoltage1)) {
	;***       44 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 44
	call !!_resetAlarm
	;***       45 : 				g_alarm.refined.over_voltage_2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 45
	set1 !LOWW(_g_alarm).1
.BB@LABEL@2_8:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 54
	ret
.BB@LABEL@2_9:	; if_else_bb
	;***       46 : //				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
	;***       47 : //						g_io_status.refined.CVCCVoltage);
	;***       48 : 			}
	;***       49 : 		}
	;***       50 : 	} else {
	;***       51 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 51
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***       52 : 		g_alarm.refined.over_voltage_2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 52
	clr1 !LOWW(_g_alarm).1
	br $.BB@LABEL@2_8
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***       53 : 	}
	;***       54 : }
	;***       55 : /**
	;***       56 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***       57 :  * 16/12/2021: Checked by An
	;***       58 :  * @return 0 - OK; 1 - Error
	;***       59 :  */
	;***       60 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 60
	subw sp, #0x0A
	;***       61 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 61
	movw ax, !LOWW(_g_numberSetting+0x0000A)
	movw [sp+0x02], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00008)
	movw [sp+0x0A], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x00008)
	movw [sp+0x0A], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, [sp+0x02]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@3_1:	; entry
	clrb a
.BB@LABEL@3_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@3_3:	; entry
	clrb x
.BB@LABEL@3_4:	; entry
	or x, a
	bnz $.BB@LABEL@3_10
.BB@LABEL@3_5:	; if_then_bb
	;***       62 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 62
	movw ax, !LOWW(_g_timerSetting+0x00030)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00032)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00034)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_11
.BB@LABEL@3_6:	; if_then_bb11
	;***       63 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***       64 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 64
	movw ax, !LOWW(_g_numberSetting+0x00006)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00004)
	push ax
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw ax, !LOWW(_g_io_status+0x00008)
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@3_11
.BB@LABEL@3_7:	; if_then_bb21
	;***       65 : 					>= g_numberSetting.upperVoltage2)) {
	;***       66 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 66
	call !!_resetAlarm
	;***       67 : 				g_alarm.refined.over_voltage_3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 67
	set1 !LOWW(_g_alarm).2
	;***       68 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 68
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***       69 : //				g_machine_state.electrolyteOFF =
	;***       70 : //						g_machine_state.electrolyteOFF == 0 ?
	;***       71 : //								1 : g_machine_state.electrolyteOFF;
	;***       72 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 72
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@3_8:	; if_then_bb21.bb35_crit_edge
	oneb a
.BB@LABEL@3_9:	; bb35
	mov !LOWW(_g_machine_state+0x00008), a
	;***       73 : //				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
	;***       74 : //						g_io_status.refined.CVCCVoltage);
	;***       75 : 				waitAlarmConfirm_stop(OVER_VOLTAGE_3, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 75
	movw ax, #0x0700
	call !!_waitAlarmConfirm_stop
	;***       76 : 				g_alarm.refined.over_voltage_3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 76
	clr1 !LOWW(_g_alarm).2
	;***       77 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 77
	oneb a
	br $.BB@LABEL@3_12
.BB@LABEL@3_10:	; if_else_bb
	;***       78 : 			}
	;***       79 : 		}
	;***       80 : 	} else {
	;***       81 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 81
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
.BB@LABEL@3_11:	; bb47
	clrb a
.BB@LABEL@3_12:	; bb47
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 84
	ret
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***       82 : 	}
	;***       83 : 	return 0;
	;***       84 : }
	;***       85 : /**
	;***       86 :  * Checked 16/12/2021
	;***       87 :  * @return
	;***       88 :  */
	;***       89 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 89
	subw sp, #0x0A
	;***       90 : 	if ((g_systemTime - g_TimeKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 90
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x00], ax
	movw ax, !LOWW(_g_timerSetting+0x00034)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00036)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	movw bc, ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TimeKeeper@1+0x00006)
	movw hl, ax
	movw ax, [sp+0x00]
	sknc
.BB@LABEL@4_1:	; entry
	decw ax
.BB@LABEL@4_2:	; entry
	subw ax, !LOWW(_g_TimeKeeper@1+0x00008)
	cmpw ax, bc
	movw ax, hl
	sknz
.BB@LABEL@4_3:	; entry
	cmpw ax, de
.BB@LABEL@4_4:	; entry
	.bc $!.BB@LABEL@4_16
.BB@LABEL@4_5:	; if_then_bb
	;***       91 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***       92 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 92
	movw ax, !LOWW(_g_numberSetting+0x0000E)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0000C)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_io_status+0x00008)
	movw [sp+0x08], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x06]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@4_6:	; if_then_bb
	clrb a
.BB@LABEL@4_7:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@4_8:	; if_then_bb
	clrb x
.BB@LABEL@4_9:	; if_then_bb
	or x, a
	bnz $.BB@LABEL@4_16
.BB@LABEL@4_10:	; if_then_bb13
	;***       93 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 93
	movw ax, !LOWW(_g_timerSetting+0x00038)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0003A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00038)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@4_13
.BB@LABEL@4_11:	; bb46
	clrb a
.BB@LABEL@4_12:	; bb46
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 113
	ret
.BB@LABEL@4_13:	; if_then_bb20
	;***       94 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***       95 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 95
	call !!_resetAlarm
	;***       96 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 96
	set1 !LOWW(_g_alarm).3
	;***       97 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 97
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***       98 : //				g_machine_state.electrolyteOFF =
	;***       99 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      100 : //								1 : g_machine_state.electrolyteOFF;
	;***      101 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 101
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@4_14:	; if_then_bb20.bb32_crit_edge
	oneb a
.BB@LABEL@4_15:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	;***      102 : //				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
	;***      103 : //						g_io_status.refined.CVCCVoltage);
	;***      104 : 				waitAlarmConfirm_stop(UNDER_VOLTAGE, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 104
	movw ax, #0x0800
	call !!_waitAlarmConfirm_stop
	;***      105 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 105
	clr1 !LOWW(_g_alarm).3
	;***      106 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 106
	oneb a
	br $.BB@LABEL@4_12
.BB@LABEL@4_16:	; if_else_bb
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	br $.BB@LABEL@4_11
_OverCurrentCheck_waitReset:
	.STACK _OverCurrentCheck_waitReset = 18
	;***      107 : 			}
	;***      108 : 		} else
	;***      109 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      110 : 	} else
	;***      111 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      112 : 	return 0;
	;***      113 : }
	;***      114 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 114
	subw sp, #0x0A
	;***      115 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 115
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      116 : 	const uint16_t _max_time = 10000;
	;***      117 : 	if (g_systemTime - g_TimeKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 117
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TimeKeeper@1+0x00006)
	movw de, ax
	movw ax, bc
	sknc
.BB@LABEL@5_1:	; entry
	decw ax
.BB@LABEL@5_2:	; entry
	subw ax, !LOWW(_g_TimeKeeper@1+0x00008)
	clrw bc
	cmpw ax, bc
	movw ax, de
	sknz
.BB@LABEL@5_3:	; entry
	cmpw ax, #0x1388
.BB@LABEL@5_4:	; entry
	.bc $!.BB@LABEL@5_26
.BB@LABEL@5_5:	; if_then_bb
	;***      118 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 118
	movw ax, !LOWW(_g_numberSetting+0x00016)
	movw [sp+0x06], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x0A], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x0000E)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000C)
	movw [sp+0x06], ax
	call !!__COM_funordered
	mov [sp+0x08], a
	addw sp, #0x04
	movw ax, [sp+0x06]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_6:	; if_then_bb
	clrb a
.BB@LABEL@5_7:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_8:	; if_then_bb
	clrb x
.BB@LABEL@5_9:	; if_then_bb
	or x, a
	mov x, #0x20
	bz $.BB@LABEL@5_16
.BB@LABEL@5_10:	; bb
	movw ax, !LOWW(_g_numberSetting+0x00012)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	movw [sp+0x08], ax
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_funordered
	mov [sp+0x08], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_11:	; bb
	clrb a
.BB@LABEL@5_12:	; bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_13:	; bb
	clrb x
.BB@LABEL@5_14:	; bb
	or x, a
	.bnz $!.BB@LABEL@5_26
.BB@LABEL@5_15:	; bb.bb66_crit_edge
	clrb x
.BB@LABEL@5_16:	; bb66
	mov a, #0xDF
	and a, !LOWW(_g_alarm)
	or a, x
	mov !LOWW(_g_alarm), a
	;***      119 : 				|| (g_io_status.refined.CVCCCurrent
	;***      120 : 						>= g_numberSetting.upperCurrent)) {
	;***      121 : 			if ((g_alarm.refined.abnormal_current == 0)
	;***      122 : 					&& (g_alarm.refined.over_curent == 0)
	;***      123 : 					&& (g_io_status.refined.CVCCCurrent
	;***      124 : 							< g_numberSetting.lowerCurrent)) {
	;***      125 : //				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
	;***      126 : //						g_io_status.refined.CVCCCurrent);
	;***      127 : 			}
	;***      128 : 			g_alarm.refined.abnormal_current =
	;***      129 : 					g_io_status.refined.CVCCCurrent
	;***      130 : 							<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      131 : 
	;***      132 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 132
	movw ax, !LOWW(_g_numberSetting+0x00012)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	movw [sp+0x08], ax
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_funordered
	mov [sp+0x08], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_17:	; bb66
	clrb a
.BB@LABEL@5_18:	; bb66
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_19:	; bb66
	clrb x
.BB@LABEL@5_20:	; bb66
	or x, a
	bnz $.BB@LABEL@5_25
.BB@LABEL@5_21:	; if_then_bb80
	;***      133 : 					>= g_numberSetting.upperCurrent) {
	;***      134 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 134
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@5_26
.BB@LABEL@5_22:	; if_then_bb87
	;***      135 : 					resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 135
	call !!_resetAlarm
	;***      136 : 					g_alarm.refined.over_curent = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 136
	set1 !LOWW(_g_alarm).6
	;***      137 : 					g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 137
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***      138 : //					g_machine_state.electrolyteOFF =
	;***      139 : //							g_machine_state.electrolyteOFF == 0 ?
	;***      140 : //									1 : g_machine_state.electrolyteOFF;
	;***      141 : 					electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 141
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@5_23:	; if_then_bb87.bb101_crit_edge
	oneb a
.BB@LABEL@5_24:	; bb101
	mov !LOWW(_g_machine_state+0x00008), a
	;***      142 : //					sendToRasPi_f(H_ALARM, OVER_CURRENT,
	;***      143 : //							g_io_status.refined.CVCCCurrent);
	;***      144 : 					waitAlarmConfirm_stop(OVER_CURRENT, 10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 144
	movw ax, #0x0A0A
	call !!_waitAlarmConfirm_stop
	;***      145 : 					g_alarm.refined.over_curent = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 145
	clr1 !LOWW(_g_alarm).6
	;***      146 : 					return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 146
	oneb a
	br $.BB@LABEL@5_27
.BB@LABEL@5_25:	; if_else_bb
	;***      147 : 				}
	;***      148 : 			} else {
	;***      149 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 149
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@5_26:	; bb115
	clrb a
.BB@LABEL@5_27:	; bb115
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 154
	ret
_FlowSensorCheck_nonstop:
	.STACK _FlowSensorCheck_nonstop = 12
	;***      150 : 			}
	;***      151 : 		}
	;***      152 : 	}
	;***      153 : 	return 0;
	;***      154 : }
	;***      155 : 
	;***      156 : /**
	;***      157 :  *
	;***      158 :  * @return 1 - Invalid, 0 - OK
	;***      159 :  */
	;***      160 : uint8_t FlowSensorCheck_nonstop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 160
	subw sp, #0x04
	;***      161 : //	if(g_alarm.refined.abnormal_flow == 1)
	;***      162 : //		return 0;
	;***      163 : 	if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 163
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
	push ax
	movw bc, !LOWW(_g_io_status+0x00006)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x00004)
	movw [sp+0x06], ax
	call !!__COM_flt
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@6_2
.BB@LABEL@6_1:	; bb
	movw ax, !LOWW(_g_numberSetting+0x0001A)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00018)
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fgt
	addw sp, #0x04
	cmp0 a
	bz $.BB@LABEL@6_3
.BB@LABEL@6_2:	; if_then_bb
	;***      164 : 			|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      165 : 		if (O_SUPPLY_WATER_PIN_SV1 == ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 165
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@6_5
.BB@LABEL@6_3:	; if_break_bb
	clrb a
.BB@LABEL@6_4:	; if_break_bb
	clr1 !LOWW(_g_alarm).4
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 178
	ret
.BB@LABEL@6_5:	; if_then_bb21
	;***      166 : //			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      167 : //					g_io_status.refined.FlowValue);
	;***      168 : 			g_alarm.refined.abnormal_flow = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 168
	set1 !LOWW(_g_alarm).4
	;***      169 : 			waitAlarmConfirm_stop(FLOW_SENSOR_ERROR, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 169
	movw ax, #0x0400
	call !!_waitAlarmConfirm_stop
	;***      170 : 			g_alarm.refined.abnormal_flow = 0;
	;***      171 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 171
	oneb a
	br $.BB@LABEL@6_4
_solenoidCheck_nonstop:
	.STACK _solenoidCheck_nonstop = 14
	;***      172 : 		}
	;***      173 : 		g_alarm.refined.abnormal_flow = 0;
	;***      174 : 		return 0;
	;***      175 : 	}
	;***      176 : 	g_alarm.refined.abnormal_flow = 0;
	;***      177 : 	return 0;
	;***      178 : }
	;***      179 : 
	;***      180 : uint8_t solenoidCheck_nonstop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 180
	subw sp, #0x06
	;***      181 : 	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 181
	mov a, 0xFFF01
	mov1 CY, a.7
	bc $.BB@LABEL@7_2
.BB@LABEL@7_1:	; bb
	mov a, 0xFFF05
	mov1 CY, a.5
.BB@LABEL@7_2:	; bb
	bc $.BB@LABEL@7_12
.BB@LABEL@7_3:	; if_then_bb
	movw ax, #0x3DCC
	;***      182 : 		if (g_io_status.refined.FlowValue >= 0.1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 182
	push ax
	movw ax, #0xCCCD
	push ax
	movw bc, !LOWW(_g_io_status+0x00006)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x00004)
	movw [sp+0x06], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, #0x3DCC
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@7_4:	; if_then_bb
	clrb a
.BB@LABEL@7_5:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@7_6:	; if_then_bb
	clrb x
.BB@LABEL@7_7:	; if_then_bb
	or x, a
	bnz $.BB@LABEL@7_12
.BB@LABEL@7_8:	; if_then_bb22
	;***      183 : 			if (ns_delay_ms(&g_Tick.tickSolenoidCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 183
	movw ax, !LOWW(_g_timerSetting+0x00040)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00042)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00040)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@7_10
.BB@LABEL@7_9:	; if_then_bb30
	;***      184 : 					g_timerSetting.t17_solenoidLeakageStartTime_s * 1000))
	;***      185 : 				sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 185
	movw de, #0x3F80
	movw ax, #0x410B
	call !!_sendToRasPi_f
.BB@LABEL@7_10:	; if_break_bb
	;***      186 : 			g_alarm.refined.solenoid = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 186
	set1 !LOWW(_g_alarm).7
	;***      187 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 187
	oneb a
.BB@LABEL@7_11:	; if_break_bb
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 193
	ret
.BB@LABEL@7_12:	; if_break_bb39
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
	;***      188 : 		} else
	;***      189 : 			g_Tick.tickSolenoidCheck = g_systemTime;
	;***      190 : 	} else
	;***      191 : 		g_Tick.tickSolenoidCheck = g_systemTime;
	;***      192 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 192
	clrb a
	br $.BB@LABEL@7_11
_saltWaterTankFullCheck_nonstop:
	.STACK _saltWaterTankFullCheck_nonstop = 8
	;***      193 : }
	;***      194 : uint8_t saltWaterTankFullCheck_nonstop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 194
	push hl
	;***      195 : 	if (I_SALT_H_PIN == ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 195
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@8_3
.BB@LABEL@8_1:	; if_else_bb
	;***      196 : 		if (g_timerSetting.t18_fullSaltWaterMonitoringStart_h != 0
	;***      197 : 				&& ns_delay_ms(&g_Tick.tickSaltFullCheck,
	;***      198 : 						g_timerSetting.t18_fullSaltWaterMonitoringStart_h * 60
	;***      199 : 								* 60 * 1000)) {
	;***      200 : //			sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      201 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	;***      202 : 			g_machine_state.electrolyteOFF =
	;***      203 : 					g_machine_state.electrolyteOFF == 0 ?
	;***      204 : 							1 : g_machine_state.electrolyteOFF;
	;***      205 : 			g_alarm.refined.salt_full = 1;
	;***      206 : 			;
	;***      207 : 			return 1;
	;***      208 : 		}
	;***      209 : 	} else
	;***      210 : 		g_Tick.tickSaltFullCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 210
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
.BB@LABEL@8_2:	; bb46
	clrb a
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 212
	ret
.BB@LABEL@8_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 196
	movw bc, !LOWW(_g_timerSetting+0x00046)
	pop ax
	push bc
	movw ax, !LOWW(_g_timerSetting+0x00044)
	movw de, ax
	addw ax, bc
	sknz
.BB@LABEL@8_4:	; if_then_bb
	bnc $.BB@LABEL@8_2
.BB@LABEL@8_5:	; bb
	movw ax, de
	movw bc, #0x0036
	mulh
	movw hl, ax
	movw ax, [sp+0x00]
	movw bc, #0xEE80
	mulh
	movw [sp+0x00], ax
	movw ax, de
	movw bc, #0xEE80
	mulhu
	push bc
	pop de
	movw bc, ax
	movw ax, [sp+0x00]
	addw ax, hl
	addw ax, de
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00044)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@8_2
.BB@LABEL@8_6:	; if_then_bb24
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 201
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 202
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@8_7:	; if_then_bb24.bb35_crit_edge
	oneb a
.BB@LABEL@8_8:	; bb35
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 205
	set1 !LOWW(_g_alarm+0x00001).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 207
	oneb a
	pop hl
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      211 : 	return 0;
	;***      212 : }
	;***      213 : 
	;***      214 : uint8_t saltWaterTankEmptyCheck(void) {
	;***      215 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 215
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@9_4
.BB@LABEL@9_1:	; if_then_bb
	;***      216 : //		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	;***      217 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 217
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***      218 : 		g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 218
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@9_2:	; if_then_bb.bb15_crit_edge
	oneb a
.BB@LABEL@9_3:	; bb15
	mov !LOWW(_g_machine_state+0x00008), a
	;***      219 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      220 : 						1 : g_machine_state.electrolyteOFF;
	;***      221 : 		g_alarm.refined.salt_empty = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 221
	set1 !LOWW(_g_alarm+0x00001).1
	;***      222 : 		//TODO: Control Off
	;***      223 : 
	;***      224 : 		return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 224
	oneb a
	ret
.BB@LABEL@9_4:	; bb24
	;***      225 : 	}
	;***      226 : 	return 0;
	;***      227 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 227
	clrb a
	ret
_acidSkipErrorCheck_nonstop:
	.STACK _acidSkipErrorCheck_nonstop = 4
	;***      228 : 
	;***      229 : uint8_t acidSkipErrorCheck_nonstop(void) {
	;***      230 : 	if (((I_ACID_L_PIN_FL1 == I_OFF)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 230
	mov a, 0xFFF07
	bf a.1, $.BB@LABEL@10_3
.BB@LABEL@10_1:	; bb
	mov a, 0xFFF07
	bf a.2, $.BB@LABEL@10_6
.BB@LABEL@10_2:	; bb13
	mov a, 0xFFF07
	bf a.3, $.BB@LABEL@10_6
.BB@LABEL@10_3:	; bb32
	mov a, 0xFFF07
	bf a.2, $.BB@LABEL@10_5
.BB@LABEL@10_4:	; bb40
	mov a, 0xFFF07
	bf a.3, $.BB@LABEL@10_6
.BB@LABEL@10_5:	; bb67
	;***      231 : 			&& ((I_ACID_M_PIN_FL2 == I_ON || I_ACID_H_PIN_FL3 == I_ON)))
	;***      232 : 			|| (I_ACID_M_PIN_FL2 == I_OFF && I_ACID_H_PIN_FL3 == I_ON)) {
	;***      233 : //		sendToRasPi_f(H_ALARM, ACID_SKIP_ERROR, 1);
	;***      234 : 		g_alarm.refined.acid_skip = 1;
	;***      235 : 		//TODO: Control OFF
	;***      236 : 		return 1;
	;***      237 : 	}
	;***      238 : 	return 0;
	;***      239 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 239
	clrb a
	ret
.BB@LABEL@10_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 234
	set1 !LOWW(_g_alarm+0x00001).2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 236
	oneb a
	ret
_alkalineSkipErrorCheck:
	.STACK _alkalineSkipErrorCheck = 4
	;***      240 : 
	;***      241 : uint8_t alkalineSkipErrorCheck(void) {
	;***      242 : 	if (((I_ALKALI_L_PIN_FL4 == I_OFF)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 242
	mov a, 0xFFF00
	bf a.5, $.BB@LABEL@11_3
.BB@LABEL@11_1:	; bb
	mov a, 0xFFF00
	bf a.6, $.BB@LABEL@11_6
.BB@LABEL@11_2:	; bb13
	mov a, 0xFFF07
	bf a.0, $.BB@LABEL@11_6
.BB@LABEL@11_3:	; bb32
	mov a, 0xFFF00
	bf a.6, $.BB@LABEL@11_5
.BB@LABEL@11_4:	; bb40
	mov a, 0xFFF07
	bf a.0, $.BB@LABEL@11_6
.BB@LABEL@11_5:	; bb67
	;***      243 : 			&& ((I_ALKALI_M_PIN_FL5 == I_ON || I_ALKALI_H_PIN_FL6 == I_ON)))
	;***      244 : 			|| (I_ALKALI_M_PIN_FL5 == I_OFF && I_ALKALI_H_PIN_FL6 == I_ON)) {
	;***      245 : //		sendToRasPi_f(H_ALARM, ALKALINE_SKIP_ERROR, 1);
	;***      246 : 		g_alarm.refined.acid_skip = 1;
	;***      247 : 		//TODO: Control OFF
	;***      248 : 		return 1;
	;***      249 : 	}
	;***      250 : 	return 0;
	;***      251 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 251
	clrb a
	ret
.BB@LABEL@11_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 246
	set1 !LOWW(_g_alarm+0x00001).2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 248
	oneb a
	ret
_waterFullErrorCheck:
	.STACK _waterFullErrorCheck = 4
	;***      252 : 
	;***      253 : uint8_t waterFullErrorCheck(void) {
	;***      254 : 
	;***      255 : 	//Check g_color == BLACK for x hours
	;***      256 : 	if (g_machine_state.mode != HAND_WASHING
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 256
	mov a, !LOWW(_g_machine_state+0x0000F)
	mov x, a
	dec a
	cmp a, #0x02
	bc $.BB@LABEL@12_3
.BB@LABEL@12_1:	; entry
	mov a, x
	cmp a, #0x03
	bz $.BB@LABEL@12_3
.BB@LABEL@12_2:	; entry
	cmp a, #0x04
	bnz $.BB@LABEL@12_4
.BB@LABEL@12_3:	; if_else_bb
	;***      257 : 			&& g_machine_state.mode != WATER_WASHING
	;***      258 : 			&& g_machine_state.mode != ACID_WASHING
	;***      259 : 			&& g_machine_state.mode != ALKALINE_WASHING) {
	;***      260 : 		if (ns_delay_ms(&g_Tick.tickWaterFull, (uint32_t) 20 * 60 * 1000)) {
	;***      261 : 			sendToRasPi_f(H_ALARM, WATER_FULL_ERROR, 1);
	;***      262 : 			//TODO: Control OFF
	;***      263 : 			return 1;
	;***      264 : 		}
	;***      265 : 	} else
	;***      266 : 		g_Tick.tickWaterFull = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 266
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0006C), ax
	br $.BB@LABEL@12_5
.BB@LABEL@12_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 260
	movw de, #0x0012
	movw bc, #0x4F80
	movw ax, #LOWW(_g_Tick+0x0006C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@12_6
.BB@LABEL@12_5:	; bb48
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 268
	ret
.BB@LABEL@12_6:	; if_then_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 261
	movw de, #0x3F80
	movw ax, #0x4110
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 263
	oneb a
	ret
_filterReplacementErrorCheck:
	.STACK _filterReplacementErrorCheck = 4
	;***      267 : 	return 0;
	;***      268 : }
	;***      269 : 
	;***      270 : uint8_t filterReplacementErrorCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 270
	clrw ax
	movw de, ax
	;***      271 : 	if (g_TimeKeeper.SV1SV2OnTime_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 271
	cmpw ax, !LOWW(_g_timerSetting+0x0004E)
	movw ax, !LOWW(_g_TimeKeeper@1+0x00004)
	movw bc, ax
	sknz
.BB@LABEL@13_1:	; entry
	cmpw ax, !LOWW(_g_timerSetting+0x0004C)
.BB@LABEL@13_2:	; entry
	bnc $.BB@LABEL@13_8
.BB@LABEL@13_3:	; if_else_bb
	movw ax, de
	;***      272 : 			>= g_timerSetting.t20_waterFilterAlarmIgnore_h) {
	;***      273 : 		g_alarm.refined.filter = FILTER_REPLACEMENT_E2;
	;***      274 : 		sendToRasPi_u32(H_ALARM, FILTER_REPLACEMENT_E2,
	;***      275 : 				g_TimeKeeper.SV1SV2OnTime_h);
	;***      276 : 		//TODO: Control OFF
	;***      277 : 		return 2;
	;***      278 : 
	;***      279 : 	} else if (g_TimeKeeper.SV1SV2OnTime_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 279
	cmpw ax, !LOWW(_g_timerSetting+0x0004A)
	movw ax, bc
	sknz
.BB@LABEL@13_4:	; if_else_bb
	cmpw ax, !LOWW(_g_timerSetting+0x00048)
.BB@LABEL@13_5:	; if_else_bb
	bnc $.BB@LABEL@13_7
.BB@LABEL@13_6:	; bb26
	;***      280 : 			>= g_timerSetting.t19_waterFilterAlarm_h) {
	;***      281 : 		g_alarm.refined.filter = FILTER_REPLACEMENT_E1;
	;***      282 : 		sendToRasPi_u32(H_ALARM, FILTER_REPLACEMENT_E1,
	;***      283 : 				g_TimeKeeper.SV1SV2OnTime_h);
	;***      284 : 		return 1;
	;***      285 : 	}
	;***      286 : 	return 0;
	;***      287 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 287
	clrb a
	ret
.BB@LABEL@13_7:	; if_then_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 281
	clr1 !LOWW(_g_alarm+0x00001).5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 282
	movw bc, ax
	clrw ax
	movw de, ax
	movw ax, #0x4124
	call !!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 284
	oneb a
	ret
.BB@LABEL@13_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 273
	set1 !LOWW(_g_alarm+0x00001).5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 274
	clrw ax
	movw de, ax
	movw ax, #0x4125
	call !!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 277
	mov a, #0x02
	ret
_levelSkipErrorCheck:
	.STACK _levelSkipErrorCheck = 4
	;***      288 : 
	;***      289 : uint8_t levelSkipErrorCheck(void) {
	;***      290 : 	if (I_ACID_L_PIN_FL1 == I_OFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 290
	mov a, 0xFFF07
	bf a.1, $.BB@LABEL@14_3
.BB@LABEL@14_1:	; bb
	mov a, 0xFFF07
	bf a.2, $.BB@LABEL@14_5
.BB@LABEL@14_2:	; bb12
	mov a, 0xFFF07
	bf a.3, $.BB@LABEL@14_5
.BB@LABEL@14_3:	; if_else_bb
	;***      291 : 			&& (I_ACID_M_PIN_FL2 == I_ON || I_ACID_H_PIN_FL3 == I_ON))
	;***      292 : 		g_alarm.refined.acid_skip = ON;
	;***      293 : 	else if (I_ACID_M_PIN_FL2 == I_OFF && I_ACID_H_PIN_FL3 == I_ON)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 293
	mov a, 0xFFF07
	bf a.2, $.BB@LABEL@14_6
.BB@LABEL@14_4:	; bb42
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@14_6
.BB@LABEL@14_5:	; bb52
	mov a, #0x04
	or a, !LOWW(_g_alarm+0x00001)
	br $.BB@LABEL@14_7
.BB@LABEL@14_6:	; bb52.thread
	mov a, #0xFB
	and a, !LOWW(_g_alarm+0x00001)
.BB@LABEL@14_7:	; bb52.thread
	mov x, a
	;***      294 : 		g_alarm.refined.acid_skip = ON;
	;***      295 : 	else
	;***      296 : 		g_alarm.refined.acid_skip = OFF;
	;***      297 : 
	;***      298 : 	if (I_ALKALI_L_PIN_FL4 == I_OFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 298
	mov a, 0xFFF00
	bf a.5, $.BB@LABEL@14_10
.BB@LABEL@14_8:	; bb72
	mov a, 0xFFF00
	bf a.6, $.BB@LABEL@14_12
.BB@LABEL@14_9:	; bb79
	mov a, 0xFFF07
	bf a.0, $.BB@LABEL@14_12
.BB@LABEL@14_10:	; if_else_bb105
	;***      299 : 			&& (I_ALKALI_M_PIN_FL5 == I_ON || I_ALKALI_H_PIN_FL6 == I_ON))
	;***      300 : 		g_alarm.refined.alkaline_skip = ON;
	;***      301 : 	else if (I_ALKALI_M_PIN_FL5 == I_OFF && I_ALKALI_H_PIN_FL6 == I_ON)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 301
	mov a, 0xFFF00
	bf a.6, $.BB@LABEL@14_13
.BB@LABEL@14_11:	; bb112
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@14_13
.BB@LABEL@14_12:	; bb122
	mov a, x
	set1 a.3
	br $.BB@LABEL@14_14
.BB@LABEL@14_13:	; bb122.thread
	mov a, x
	clr1 a.3
.BB@LABEL@14_14:	; if_break_bb136
	mov !LOWW(_g_alarm+0x00001), a
	;***      302 : 		g_alarm.refined.alkaline_skip = ON;
	;***      303 : 	else
	;***      304 : 		g_alarm.refined.alkaline_skip = OFF;
	;***      305 : 
	;***      306 : 	return g_alarm.refined.acid_skip == ON
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 306
	and a, #0x0C
	oneb a
	sknz
.BB@LABEL@14_15:	; if_break_bb136
	clrb a
.BB@LABEL@14_16:	; if_break_bb136
	ret
	;***      307 : 			|| g_alarm.refined.alkaline_skip == ON ? 1 : 0;
	;***      308 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TimeKeeper@1:
	.DS (10)
_g_alarm:
	.DS (3)
