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
#@   -o src/hwm/error_check.obj
#@   ../src/hwm/error_check.c
#@  compiled at Tue Aug 23 10:01:05 2022

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
	bnz $.BB@LABEL@2_8
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
	bz $.BB@LABEL@2_9
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
	bnz $.BB@LABEL@2_9
.BB@LABEL@2_7:	; if_then_bb20
	;***       43 : 					>= g_numberSetting.upperVoltage1)) {
	;***       44 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 44
	addw sp, #0x0A
	br !!_resetAlarm
.BB@LABEL@2_8:	; if_else_bb
	;***       45 : 				//TODO: Bypass voltage 2
	;***       46 : //				g_alarm.refined.over_voltage_2 = 1;
	;***       47 : //				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
	;***       48 : //						g_io_status.refined.CVCCVoltage);
	;***       49 : 			}
	;***       50 : 		}
	;***       51 : 	} else {
	;***       52 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 52
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***       53 : 		g_alarm.refined.over_voltage_2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 53
	clr1 !LOWW(_g_alarm).1
.BB@LABEL@2_9:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 55
	ret
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***       54 : 	}
	;***       55 : }
	;***       56 : /**
	;***       57 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***       58 :  * 16/12/2021: Checked by An
	;***       59 :  * @return 0 - OK; 1 - Error
	;***       60 :  */
	;***       61 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 61
	subw sp, #0x0A
	;***       62 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 62
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
	;***       63 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 63
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
	;***       64 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***       65 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 65
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
	;***       66 : 					>= g_numberSetting.upperVoltage2)) {
	;***       67 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 67
	call !!_resetAlarm
	;***       68 : 				g_alarm.refined.over_voltage_3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 68
	set1 !LOWW(_g_alarm).2
	;***       69 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 69
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***       70 : //				g_machine_state.electrolyteOFF =
	;***       71 : //						g_machine_state.electrolyteOFF == 0 ?
	;***       72 : //								1 : g_machine_state.electrolyteOFF;
	;***       73 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 73
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@3_8:	; if_then_bb21.bb35_crit_edge
	oneb a
.BB@LABEL@3_9:	; bb35
	mov !LOWW(_g_machine_state+0x00008), a
	;***       74 : //				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
	;***       75 : //						g_io_status.refined.CVCCVoltage);
	;***       76 : 				waitAlarmConfirm_stop(OVER_VOLTAGE_3, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 76
	movw ax, #0x0700
	call !!_waitAlarmConfirm_stop
	;***       77 : 				g_alarm.refined.over_voltage_3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 77
	clr1 !LOWW(_g_alarm).2
	;***       78 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 78
	oneb a
	br $.BB@LABEL@3_12
.BB@LABEL@3_10:	; if_else_bb
	;***       79 : 			}
	;***       80 : 		}
	;***       81 : 	} else {
	;***       82 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 82
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
.BB@LABEL@3_11:	; bb47
	clrb a
.BB@LABEL@3_12:	; bb47
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 85
	ret
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***       83 : 	}
	;***       84 : 	return 0;
	;***       85 : }
	;***       86 : /**
	;***       87 :  * Checked 16/12/2021
	;***       88 :  * @return
	;***       89 :  */
	;***       90 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 90
	subw sp, #0x0A
	;***       91 : 	if ((g_systemTime - g_TimeKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 91
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
	;***       92 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***       93 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 93
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
	;***       94 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 94
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 114
	ret
.BB@LABEL@4_13:	; if_then_bb20
	;***       95 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***       96 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 96
	call !!_resetAlarm
	;***       97 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 97
	set1 !LOWW(_g_alarm).3
	;***       98 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 98
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***       99 : //				g_machine_state.electrolyteOFF =
	;***      100 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      101 : //								1 : g_machine_state.electrolyteOFF;
	;***      102 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 102
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@4_14:	; if_then_bb20.bb32_crit_edge
	oneb a
.BB@LABEL@4_15:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	;***      103 : //				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
	;***      104 : //						g_io_status.refined.CVCCVoltage);
	;***      105 : 				waitAlarmConfirm_stop(UNDER_VOLTAGE, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 105
	movw ax, #0x0800
	call !!_waitAlarmConfirm_stop
	;***      106 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 106
	clr1 !LOWW(_g_alarm).3
	;***      107 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 107
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
	;***      108 : 			}
	;***      109 : 		} else
	;***      110 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      111 : 	} else
	;***      112 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      113 : 	return 0;
	;***      114 : }
	;***      115 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 115
	subw sp, #0x0A
	;***      116 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 116
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      117 : 	const uint16_t _max_time = 10000;
	;***      118 : 	if (g_systemTime - g_TimeKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 118
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
	;***      119 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 119
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
	;***      120 : 				|| (g_io_status.refined.CVCCCurrent
	;***      121 : 						>= g_numberSetting.upperCurrent)) {
	;***      122 : 			if ((g_alarm.refined.abnormal_current == 0)
	;***      123 : 					&& (g_alarm.refined.over_curent == 0)
	;***      124 : 					&& (g_io_status.refined.CVCCCurrent
	;***      125 : 							< g_numberSetting.lowerCurrent)) {
	;***      126 : //				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
	;***      127 : //						g_io_status.refined.CVCCCurrent);
	;***      128 : 			}
	;***      129 : 			g_alarm.refined.abnormal_current =
	;***      130 : 					g_io_status.refined.CVCCCurrent
	;***      131 : 							<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      132 : 
	;***      133 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 133
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
	;***      134 : 					>= g_numberSetting.upperCurrent) {
	;***      135 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 135
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@5_26
.BB@LABEL@5_22:	; if_then_bb87
	;***      136 : 					resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 136
	call !!_resetAlarm
	;***      137 : 					g_alarm.refined.over_curent = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 137
	set1 !LOWW(_g_alarm).6
	;***      138 : 					g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 138
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***      139 : //					g_machine_state.electrolyteOFF =
	;***      140 : //							g_machine_state.electrolyteOFF == 0 ?
	;***      141 : //									1 : g_machine_state.electrolyteOFF;
	;***      142 : 					electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 142
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@5_23:	; if_then_bb87.bb101_crit_edge
	oneb a
.BB@LABEL@5_24:	; bb101
	mov !LOWW(_g_machine_state+0x00008), a
	;***      143 : //					sendToRasPi_f(H_ALARM, OVER_CURRENT,
	;***      144 : //							g_io_status.refined.CVCCCurrent);
	;***      145 : 					waitAlarmConfirm_stop(OVER_CURRENT, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 145
	movw ax, #0x0A00
	call !!_waitAlarmConfirm_stop
	;***      146 : 					g_alarm.refined.over_curent = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 146
	clr1 !LOWW(_g_alarm).6
	;***      147 : 					return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 147
	oneb a
	br $.BB@LABEL@5_27
.BB@LABEL@5_25:	; if_else_bb
	;***      148 : 				}
	;***      149 : 			} else {
	;***      150 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 150
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@5_26:	; bb115
	clrb a
.BB@LABEL@5_27:	; bb115
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 155
	ret
_FlowSensorCheck_nonstop:
	.STACK _FlowSensorCheck_nonstop = 12
	;***      151 : 			}
	;***      152 : 		}
	;***      153 : 	}
	;***      154 : 	return 0;
	;***      155 : }
	;***      156 : 
	;***      157 : /**
	;***      158 :  *
	;***      159 :  * @return 1 - Invalid, 0 - OK
	;***      160 :  */
	;***      161 : uint8_t FlowSensorCheck_nonstop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 161
	subw sp, #0x04
	;***      162 : //	if(g_alarm.refined.abnormal_flow == 1)
	;***      163 : //		return 0;
	;***      164 : 	if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 164
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
	;***      165 : 			|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      166 : 		if (O_SUPPLY_WATER_PIN_SV1 == ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 166
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@6_5
.BB@LABEL@6_3:	; if_break_bb
	clrb a
.BB@LABEL@6_4:	; if_break_bb
	clr1 !LOWW(_g_alarm).4
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 179
	ret
.BB@LABEL@6_5:	; if_then_bb21
	;***      167 : //			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      168 : //					g_io_status.refined.FlowValue);
	;***      169 : 			g_alarm.refined.abnormal_flow = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 169
	set1 !LOWW(_g_alarm).4
	;***      170 : 			waitAlarmConfirm_stop(FLOW_SENSOR_ERROR, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 170
	movw ax, #0x0400
	call !!_waitAlarmConfirm_stop
	;***      171 : 			g_alarm.refined.abnormal_flow = 0;
	;***      172 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 172
	oneb a
	br $.BB@LABEL@6_4
_solenoidCheck_nonstop:
	.STACK _solenoidCheck_nonstop = 14
	;***      173 : 		}
	;***      174 : 		g_alarm.refined.abnormal_flow = 0;
	;***      175 : 		return 0;
	;***      176 : 	}
	;***      177 : 	g_alarm.refined.abnormal_flow = 0;
	;***      178 : 	return 0;
	;***      179 : }
	;***      180 : 
	;***      181 : uint8_t solenoidCheck_nonstop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 181
	subw sp, #0x06
	;***      182 : 	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 182
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
	;***      183 : 		if (g_io_status.refined.FlowValue >= 0.1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 183
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
	;***      184 : 			if (ns_delay_ms(&g_Tick.tickSolenoidCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 184
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
	;***      185 : 					g_timerSetting.t17_solenoidLeakageStartTime_s * 1000))
	;***      186 : 				sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 186
	movw de, #0x3F80
	movw ax, #0x410B
	call !!_sendToRasPi_f
.BB@LABEL@7_10:	; if_break_bb
	;***      187 : 			g_alarm.refined.solenoid = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 187
	set1 !LOWW(_g_alarm).7
	;***      188 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 188
	oneb a
.BB@LABEL@7_11:	; if_break_bb
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 194
	ret
.BB@LABEL@7_12:	; if_break_bb39
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
	;***      189 : 		} else
	;***      190 : 			g_Tick.tickSolenoidCheck = g_systemTime;
	;***      191 : 	} else
	;***      192 : 		g_Tick.tickSolenoidCheck = g_systemTime;
	;***      193 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 193
	clrb a
	br $.BB@LABEL@7_11
_saltWaterTankFullCheck_nonstop:
	.STACK _saltWaterTankFullCheck_nonstop = 8
	;***      194 : }
	;***      195 : uint8_t saltWaterTankFullCheck_nonstop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 195
	push hl
	;***      196 : 	if (I_SALT_H_PIN == ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 196
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@8_3
.BB@LABEL@8_1:	; if_else_bb
	;***      197 : 		if (g_timerSetting.t18_fullSaltWaterMonitoringStart_h != 0
	;***      198 : 				&& ns_delay_ms(&g_Tick.tickSaltFullCheck,
	;***      199 : 						g_timerSetting.t18_fullSaltWaterMonitoringStart_h * 60
	;***      200 : 								* 60 * 1000)) {
	;***      201 : //			sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      202 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	;***      203 : 			g_machine_state.electrolyteOFF =
	;***      204 : 					g_machine_state.electrolyteOFF == 0 ?
	;***      205 : 							1 : g_machine_state.electrolyteOFF;
	;***      206 : 			g_alarm.refined.salt_full = 1;
	;***      207 : 			;
	;***      208 : 			return 1;
	;***      209 : 		}
	;***      210 : 	} else
	;***      211 : 		g_Tick.tickSaltFullCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 211
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
.BB@LABEL@8_2:	; bb46
	clrb a
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 213
	ret
.BB@LABEL@8_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 197
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 202
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 203
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@8_7:	; if_then_bb24.bb35_crit_edge
	oneb a
.BB@LABEL@8_8:	; bb35
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 206
	set1 !LOWW(_g_alarm+0x00001).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 208
	oneb a
	pop hl
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      212 : 	return 0;
	;***      213 : }
	;***      214 : 
	;***      215 : uint8_t saltWaterTankEmptyCheck(void) {
	;***      216 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 216
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@9_4
.BB@LABEL@9_1:	; if_then_bb
	;***      217 : //		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	;***      218 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 218
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***      219 : 		g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 219
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@9_2:	; if_then_bb.bb15_crit_edge
	oneb a
.BB@LABEL@9_3:	; bb15
	mov !LOWW(_g_machine_state+0x00008), a
	;***      220 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      221 : 						1 : g_machine_state.electrolyteOFF;
	;***      222 : 		g_alarm.refined.salt_empty = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 222
	set1 !LOWW(_g_alarm+0x00001).1
	;***      223 : 		//TODO: Control Off
	;***      224 : 
	;***      225 : 		return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 225
	oneb a
	ret
.BB@LABEL@9_4:	; bb24
	;***      226 : 	}
	;***      227 : 	return 0;
	;***      228 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 228
	clrb a
	ret
_acidSkipErrorCheck_nonstop:
	.STACK _acidSkipErrorCheck_nonstop = 4
	;***      229 : 
	;***      230 : uint8_t acidSkipErrorCheck_nonstop(void) {
	;***      231 : 	if (((I_ACID_L_PIN_FL1 == I_OFF)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 231
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
	;***      232 : 			&& ((I_ACID_M_PIN_FL2 == I_ON || I_ACID_H_PIN_FL3 == I_ON)))
	;***      233 : 			|| (I_ACID_M_PIN_FL2 == I_OFF && I_ACID_H_PIN_FL3 == I_ON)) {
	;***      234 : //		sendToRasPi_f(H_ALARM, ACID_SKIP_ERROR, 1);
	;***      235 : 		g_alarm.refined.acid_skip = 1;
	;***      236 : 		//TODO: Control OFF
	;***      237 : 		return 1;
	;***      238 : 	}
	;***      239 : 	return 0;
	;***      240 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 240
	clrb a
	ret
.BB@LABEL@10_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 235
	set1 !LOWW(_g_alarm+0x00001).2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 237
	oneb a
	ret
_alkalineSkipErrorCheck:
	.STACK _alkalineSkipErrorCheck = 4
	;***      241 : 
	;***      242 : uint8_t alkalineSkipErrorCheck(void) {
	;***      243 : 	if (((I_ALKALI_L_PIN_FL4 == I_OFF)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 243
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
	;***      244 : 			&& ((I_ALKALI_M_PIN_FL5 == I_ON || I_ALKALI_H_PIN_FL6 == I_ON)))
	;***      245 : 			|| (I_ALKALI_M_PIN_FL5 == I_OFF && I_ALKALI_H_PIN_FL6 == I_ON)) {
	;***      246 : //		sendToRasPi_f(H_ALARM, ALKALINE_SKIP_ERROR, 1);
	;***      247 : 		g_alarm.refined.acid_skip = 1;
	;***      248 : 		//TODO: Control OFF
	;***      249 : 		return 1;
	;***      250 : 	}
	;***      251 : 	return 0;
	;***      252 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 252
	clrb a
	ret
.BB@LABEL@11_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 247
	set1 !LOWW(_g_alarm+0x00001).2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 249
	oneb a
	ret
_waterFullErrorCheck:
	.STACK _waterFullErrorCheck = 4
	;***      253 : 
	;***      254 : uint8_t waterFullErrorCheck(void) {
	;***      255 : 
	;***      256 : 	//Check g_color == BLACK for x hours
	;***      257 : 	if (g_machine_state.mode != HAND_WASHING
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 257
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
	;***      258 : 			&& g_machine_state.mode != WATER_WASHING
	;***      259 : 			&& g_machine_state.mode != ACID_WASHING
	;***      260 : 			&& g_machine_state.mode != ALKALINE_WASHING) {
	;***      261 : 		if (ns_delay_ms(&g_Tick.tickWaterFull, (uint32_t) 20 * 60 * 1000)) {
	;***      262 : 			sendToRasPi_f(H_ALARM, WATER_FULL_ERROR, 1);
	;***      263 : 			//TODO: Control OFF
	;***      264 : 			return 1;
	;***      265 : 		}
	;***      266 : 	} else
	;***      267 : 		g_Tick.tickWaterFull = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 267
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0006C), ax
	br $.BB@LABEL@12_5
.BB@LABEL@12_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 261
	movw de, #0x0012
	movw bc, #0x4F80
	movw ax, #LOWW(_g_Tick+0x0006C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@12_6
.BB@LABEL@12_5:	; bb48
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 269
	ret
.BB@LABEL@12_6:	; if_then_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 262
	movw de, #0x3F80
	movw ax, #0x4110
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 264
	oneb a
	ret
_filterReplacementErrorCheck:
	.STACK _filterReplacementErrorCheck = 4
	;***      268 : 	return 0;
	;***      269 : }
	;***      270 : 
	;***      271 : uint8_t filterReplacementErrorCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 271
	clrw ax
	movw de, ax
	;***      272 : 	if (g_TimeKeeper.SV1SV2OnTime_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 272
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
	;***      273 : 			>= g_timerSetting.t20_waterFilterAlarmIgnore_h) {
	;***      274 : 		g_alarm.refined.filter = FILTER_REPLACEMENT_E2;
	;***      275 : 		sendToRasPi_u32(H_ALARM, FILTER_REPLACEMENT_E2,
	;***      276 : 				g_TimeKeeper.SV1SV2OnTime_h);
	;***      277 : 		//TODO: Control OFF
	;***      278 : 		return 2;
	;***      279 : 
	;***      280 : 	} else if (g_TimeKeeper.SV1SV2OnTime_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 280
	cmpw ax, !LOWW(_g_timerSetting+0x0004A)
	movw ax, bc
	sknz
.BB@LABEL@13_4:	; if_else_bb
	cmpw ax, !LOWW(_g_timerSetting+0x00048)
.BB@LABEL@13_5:	; if_else_bb
	bnc $.BB@LABEL@13_7
.BB@LABEL@13_6:	; bb26
	;***      281 : 			>= g_timerSetting.t19_waterFilterAlarm_h) {
	;***      282 : 		g_alarm.refined.filter = FILTER_REPLACEMENT_E1;
	;***      283 : 		sendToRasPi_u32(H_ALARM, FILTER_REPLACEMENT_E1,
	;***      284 : 				g_TimeKeeper.SV1SV2OnTime_h);
	;***      285 : 		return 1;
	;***      286 : 	}
	;***      287 : 	return 0;
	;***      288 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 288
	clrb a
	ret
.BB@LABEL@13_7:	; if_then_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 282
	clr1 !LOWW(_g_alarm+0x00001).5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 283
	movw bc, ax
	clrw ax
	movw de, ax
	movw ax, #0x4124
	call !!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 285
	oneb a
	ret
.BB@LABEL@13_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 274
	set1 !LOWW(_g_alarm+0x00001).5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 275
	clrw ax
	movw de, ax
	movw ax, #0x4125
	call !!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 278
	mov a, #0x02
	ret
_levelSkipErrorCheck:
	.STACK _levelSkipErrorCheck = 4
	;***      289 : 
	;***      290 : uint8_t levelSkipErrorCheck(void) {
	;***      291 : 	if (I_ACID_L_PIN_FL1 == I_OFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 291
	mov a, 0xFFF07
	bf a.1, $.BB@LABEL@14_3
.BB@LABEL@14_1:	; bb
	mov a, 0xFFF07
	bf a.2, $.BB@LABEL@14_5
.BB@LABEL@14_2:	; bb12
	mov a, 0xFFF07
	bf a.3, $.BB@LABEL@14_5
.BB@LABEL@14_3:	; if_else_bb
	;***      292 : 			&& (I_ACID_M_PIN_FL2 == I_ON || I_ACID_H_PIN_FL3 == I_ON))
	;***      293 : 		g_alarm.refined.acid_skip = ON;
	;***      294 : 	else if (I_ACID_M_PIN_FL2 == I_OFF && I_ACID_H_PIN_FL3 == I_ON)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 294
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
	;***      295 : 		g_alarm.refined.acid_skip = ON;
	;***      296 : 	else
	;***      297 : 		g_alarm.refined.acid_skip = OFF;
	;***      298 : 
	;***      299 : 	if (I_ALKALI_L_PIN_FL4 == I_OFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 299
	mov a, 0xFFF00
	bf a.5, $.BB@LABEL@14_10
.BB@LABEL@14_8:	; bb72
	mov a, 0xFFF00
	bf a.6, $.BB@LABEL@14_12
.BB@LABEL@14_9:	; bb79
	mov a, 0xFFF07
	bf a.0, $.BB@LABEL@14_12
.BB@LABEL@14_10:	; if_else_bb105
	;***      300 : 			&& (I_ALKALI_M_PIN_FL5 == I_ON || I_ALKALI_H_PIN_FL6 == I_ON))
	;***      301 : 		g_alarm.refined.alkaline_skip = ON;
	;***      302 : 	else if (I_ALKALI_M_PIN_FL5 == I_OFF && I_ALKALI_H_PIN_FL6 == I_ON)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 302
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
	;***      303 : 		g_alarm.refined.alkaline_skip = ON;
	;***      304 : 	else
	;***      305 : 		g_alarm.refined.alkaline_skip = OFF;
	;***      306 : 
	;***      307 : 	return g_alarm.refined.acid_skip == ON
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 307
	and a, #0x0C
	oneb a
	sknz
.BB@LABEL@14_15:	; if_break_bb136
	clrb a
.BB@LABEL@14_16:	; if_break_bb136
	ret
	;***      308 : 			|| g_alarm.refined.alkaline_skip == ON ? 1 : 0;
	;***      309 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TimeKeeper@1:
	.DS (10)
_g_alarm:
	.DS (3)
