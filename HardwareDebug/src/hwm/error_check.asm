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
#@  compiled at Wed Apr 06 08:39:08 2022

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
	.EXTERN _sendToRasPi_f
	.EXTERN _waitAlarmConfirm_stop
	.PUBLIC _Voltage2Check_nostop
	.PUBLIC _Voltage3Check_waitReset
	.PUBLIC _LowVoltageCheck_waitReset
	.PUBLIC _OverCurrentCheck_waitReset
	.PUBLIC _FlowSensorCheck_nonstop
	.PUBLIC _solenoidCheck_nonstop
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
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
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
.BB@LABEL@1_6:	; bb34
	clrb a
.BB@LABEL@1_7:	; bb34
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 32
	ret
.BB@LABEL@1_8:	; if_then_bb11
	;***       19 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***       20 : 			resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 20
	call !!_resetAlarm
	;***       21 : 			sendToRasPi_f(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 21
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4105
	call !!_sendToRasPi_f
	;***       22 : 					g_io_status.refined.CVCCVoltage);
	;***       23 : 			g_alarm.refined.over_voltage_1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 23
	set1 !LOWW(_g_alarm).0
	;***       24 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 24
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@1_9:	; if_then_bb11.bb23_crit_edge
	oneb a
.BB@LABEL@1_10:	; bb23
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
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
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
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@2_9
.BB@LABEL@2_7:	; if_then_bb20
	;***       43 : 					>= g_numberSetting.upperVoltage1)) {
	;***       44 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 44
	call !!_resetAlarm
	;***       45 : 				g_alarm.refined.over_voltage_2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 45
	set1 !LOWW(_g_alarm).1
	;***       46 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 46
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4106
	addw sp, #0x0A
	br !!_sendToRasPi_f
.BB@LABEL@2_8:	; if_else_bb
	;***       47 : 						g_io_status.refined.CVCCVoltage);
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
.BB@LABEL@2_9:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 54
	ret
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
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
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
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
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
	;***       73 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 73
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4107
	call !!_sendToRasPi_f
	;***       74 : 						g_io_status.refined.CVCCVoltage);
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
.BB@LABEL@3_11:	; bb48
	clrb a
.BB@LABEL@3_12:	; bb48
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
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
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
.BB@LABEL@4_11:	; bb47
	clrb a
.BB@LABEL@4_12:	; bb47
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
	;***      102 : 				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 102
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4108
	call !!_sendToRasPi_f
	;***      103 : 						g_io_status.refined.CVCCVoltage);
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
	.STACK _OverCurrentCheck_waitReset = 22
	;***      107 : 			}
	;***      108 : 		} else
	;***      109 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      110 : 	} else
	;***      111 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      112 : 	return 0;
	;***      113 : }
	;***      114 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 114
	subw sp, #0x0E
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
	.bc $!.BB@LABEL@5_34
.BB@LABEL@5_5:	; if_then_bb
	;***      118 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 118
	movw ax, !LOWW(_g_numberSetting+0x00016)
	movw [sp+0x06], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x0A], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000E)
	movw [sp+0x06], ax
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@5_11
.BB@LABEL@5_6:	; bb
	movw ax, !LOWW(_g_numberSetting+0x00012)
	movw [sp+0x0C], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	movw [sp+0x0C], ax
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_funordered
	mov [sp+0x08], a
	addw sp, #0x04
	movw ax, [sp+0x0C]
	push ax
	movw ax, [sp+0x0C]
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
.BB@LABEL@5_7:	; bb
	clrb a
.BB@LABEL@5_8:	; bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_9:	; bb
	clrb x
.BB@LABEL@5_10:	; bb
	or x, a
	.bnz $!.BB@LABEL@5_34
.BB@LABEL@5_11:	; if_then_bb24
	mov a, #0x60
	;***      119 : 				|| (g_io_status.refined.CVCCCurrent
	;***      120 : 						>= g_numberSetting.upperCurrent)) {
	;***      121 : 			if ((g_alarm.refined.abnormal_current == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 121
	and a, !LOWW(_g_alarm)
	bnz $.BB@LABEL@5_18
.BB@LABEL@5_12:	; if_then_bb24
	movw ax, [sp+0x06]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
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
.BB@LABEL@5_13:	; if_then_bb24
	clrb a
.BB@LABEL@5_14:	; if_then_bb24
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_15:	; if_then_bb24
	clrb x
.BB@LABEL@5_16:	; if_then_bb24
	or x, a
	bnz $.BB@LABEL@5_18
.BB@LABEL@5_17:	; if_then_bb58
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      122 : 					&& (g_alarm.refined.over_curent == 0)
	;***      123 : 					&& (g_io_status.refined.CVCCCurrent
	;***      124 : 							<= g_numberSetting.lowerCurrent)) {
	;***      125 : 				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 125
	movw ax, #0x4109
	call !!_sendToRasPi_f
.BB@LABEL@5_18:	; if_break_bb
	;***      126 : 						g_io_status.refined.CVCCCurrent);
	;***      127 : 			}
	;***      128 : 			g_alarm.refined.abnormal_current =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 128
	movw ax, !LOWW(_g_numberSetting+0x00016)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000E)
	movw [sp+0x08], ax
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_19:	; if_break_bb
	clrb a
.BB@LABEL@5_20:	; if_break_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_21:	; if_break_bb
	clrb x
.BB@LABEL@5_22:	; if_break_bb
	or x, a
	mov x, #0x20
	skz
.BB@LABEL@5_23:	; bb65
	clrb x
.BB@LABEL@5_24:	; bb67
	mov a, #0xDF
	and a, !LOWW(_g_alarm)
	or a, x
	mov !LOWW(_g_alarm), a
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
	movw ax, [sp+0x08]
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_25:	; bb67
	clrb a
.BB@LABEL@5_26:	; bb67
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_27:	; bb67
	clrb x
.BB@LABEL@5_28:	; bb67
	or x, a
	bnz $.BB@LABEL@5_33
.BB@LABEL@5_29:	; if_then_bb81
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
	bz $.BB@LABEL@5_34
.BB@LABEL@5_30:	; if_then_bb88
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
.BB@LABEL@5_31:	; if_then_bb88.bb102_crit_edge
	oneb a
.BB@LABEL@5_32:	; bb102
	mov !LOWW(_g_machine_state+0x00008), a
	;***      142 : 					sendToRasPi_f(H_ALARM, OVER_CURRENT,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 142
	movw bc, !LOWW(_g_io_status+0x0000E)
	movw de, !LOWW(_g_io_status+0x00010)
	movw ax, #0x410A
	call !!_sendToRasPi_f
	;***      143 : 							g_io_status.refined.CVCCCurrent);
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
	br $.BB@LABEL@5_35
.BB@LABEL@5_33:	; if_else_bb
	;***      147 : 				}
	;***      148 : 			} else {
	;***      149 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 149
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@5_34:	; bb117
	clrb a
.BB@LABEL@5_35:	; bb117
	addw sp, #0x0E
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
	;***      161 : 	if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 161
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
	push ax
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x00006)
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
	;***      162 : 			|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      163 : 		if(O_SUPPLY_WATER_PIN_SV1 == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 163
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@6_5
.BB@LABEL@6_3:	; if_break_bb
	clr1 !LOWW(_g_alarm).4
	clrb a
.BB@LABEL@6_4:	; if_break_bb
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 174
	ret
.BB@LABEL@6_5:	; if_then_bb21
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      164 : 			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 164
	movw ax, #0x4104
	call !!_sendToRasPi_f
	;***      165 : 					g_io_status.refined.FlowValue);
	;***      166 : 			g_alarm.refined.abnormal_flow = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 166
	set1 !LOWW(_g_alarm).4
	;***      167 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 167
	oneb a
	br $.BB@LABEL@6_4
_solenoidCheck_nonstop:
	.STACK _solenoidCheck_nonstop = 14
	;***      168 : 		}
	;***      169 : 		g_alarm.refined.abnormal_flow = 0;
	;***      170 : 		return 0;
	;***      171 : 	}
	;***      172 : 	g_alarm.refined.abnormal_flow = 0;
	;***      173 : 	return 0;
	;***      174 : }
	;***      175 : 
	;***      176 : uint8_t solenoidCheck_nonstop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 176
	subw sp, #0x06
	;***      177 : 	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 177
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
	;***      178 : 		if (g_io_status.refined.FlowValue >= 0.1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 178
	push ax
	movw ax, #0xCCCD
	push ax
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x00006)
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
	;***      179 : 			if (ns_delay_ms(&g_Tick.tickSolenoidCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 179
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
	;***      180 : 					g_timerSetting.t17_solenoidLeakageStartTime_s * 1000))
	;***      181 : 				sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 181
	movw de, #0x3F80
	movw ax, #0x410B
	call !!_sendToRasPi_f
.BB@LABEL@7_10:	; if_break_bb
	;***      182 : 			g_alarm.refined.solenoid = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 182
	set1 !LOWW(_g_alarm).7
	;***      183 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 183
	oneb a
.BB@LABEL@7_11:	; if_break_bb
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 189
	ret
.BB@LABEL@7_12:	; if_break_bb39
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
	;***      184 : 		} else
	;***      185 : 			g_Tick.tickSolenoidCheck = g_systemTime;
	;***      186 : 	} else
	;***      187 : 		g_Tick.tickSolenoidCheck = g_systemTime;
	;***      188 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 188
	clrb a
	br $.BB@LABEL@7_11
_saltWaterTankFullCheck_nonstop:
	.STACK _saltWaterTankFullCheck_nonstop = 8
	;***      189 : }
	;***      190 : uint8_t saltWaterTankFullCheck_nonstop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 190
	push hl
	;***      191 : 	if (I_SALT_H_PIN == ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 191
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@8_2
.BB@LABEL@8_1:	; if_else_bb
	;***      192 : 		if (ns_delay_ms(&g_Tick.tickSaltFullCheck,
	;***      193 : 				g_timerSetting.t18_fullSaltWaterMonitoringStart_h * 60 * 60
	;***      194 : 						* 1000)) {
	;***      195 : 			sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      196 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	;***      197 : 			g_machine_state.electrolyteOFF =
	;***      198 : 					g_machine_state.electrolyteOFF == 0 ?
	;***      199 : 							1 : g_machine_state.electrolyteOFF;
	;***      200 : 			g_alarm.refined.salt_full = 1;
	;***      201 : 			;
	;***      202 : 			return 1;
	;***      203 : 		}
	;***      204 : 	} else
	;***      205 : 		g_Tick.tickSaltFullCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 205
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	br $.BB@LABEL@8_3
.BB@LABEL@8_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 192
	movw ax, !LOWW(_g_timerSetting+0x00044)
	movw hl, ax
	movw bc, #0x0036
	mulh
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00046)
	movw bc, #0xEE80
	mulh
	movw [sp+0x00], ax
	movw ax, hl
	movw bc, #0xEE80
	mulhu
	push bc
	pop hl
	movw bc, ax
	movw ax, [sp+0x00]
	addw ax, de
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00044)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_3:	; bb35
	clrb a
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 207
	ret
.BB@LABEL@8_4:	; if_then_bb15
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 195
	movw de, #0x3F80
	movw ax, #0x410C
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 196
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 197
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@8_5:	; if_then_bb15.bb24_crit_edge
	oneb a
.BB@LABEL@8_6:	; bb24
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 200
	set1 !LOWW(_g_alarm+0x00001).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 202
	oneb a
	pop hl
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      206 : 	return 0;
	;***      207 : }
	;***      208 : 
	;***      209 : uint8_t saltWaterTankEmptyCheck(void) {
	;***      210 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 210
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@9_4
.BB@LABEL@9_1:	; if_then_bb
	;***      211 : 		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 211
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	call !!_sendToRasPi_f
	;***      212 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 212
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***      213 : 		g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 213
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@9_2:	; if_then_bb.bb15_crit_edge
	oneb a
.BB@LABEL@9_3:	; bb15
	mov !LOWW(_g_machine_state+0x00008), a
	;***      214 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      215 : 						1 : g_machine_state.electrolyteOFF;
	;***      216 : 		g_alarm.refined.salt_empty = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 216
	set1 !LOWW(_g_alarm+0x00001).1
	;***      217 : 		//TODO: Control Off
	;***      218 : 
	;***      219 : 		return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 219
	oneb a
	ret
.BB@LABEL@9_4:	; bb24
	;***      220 : 	}
	;***      221 : 	return 0;
	;***      222 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 222
	clrb a
	ret
_acidSkipErrorCheck_nonstop:
	.STACK _acidSkipErrorCheck_nonstop = 4
	;***      223 : 
	;***      224 : uint8_t acidSkipErrorCheck_nonstop(void) {
	;***      225 : 	if (((I_ACID_L_PIN_FL1 == I_OFF)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 225
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
	;***      226 : 			&& ((I_ACID_M_PIN_FL2 == I_ON || I_ACID_H_PIN_FL3 == I_ON)))
	;***      227 : 			|| (I_ACID_M_PIN_FL2 == I_OFF && I_ACID_H_PIN_FL3 == I_ON)) {
	;***      228 : 		sendToRasPi_f(H_ALARM, ACID_SKIP_ERROR, 1);
	;***      229 : 		g_alarm.refined.acid_skip = 1;
	;***      230 : 		//TODO: Control OFF
	;***      231 : 		return 1;
	;***      232 : 	}
	;***      233 : 	return 0;
	;***      234 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 234
	clrb a
	ret
.BB@LABEL@10_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 228
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410E
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 229
	set1 !LOWW(_g_alarm+0x00001).2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 231
	oneb a
	ret
_alkalineSkipErrorCheck:
	.STACK _alkalineSkipErrorCheck = 4
	;***      235 : 
	;***      236 : uint8_t alkalineSkipErrorCheck(void) {
	;***      237 : 	if (((I_ALKALI_L_PIN_FL4 == I_OFF)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 237
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
	;***      238 : 			&& ((I_ALKALI_M_PIN_FL5 == I_ON || I_ALKALI_H_PIN_FL6 == I_ON)))
	;***      239 : 			|| (I_ALKALI_M_PIN_FL5 == I_OFF && I_ALKALI_H_PIN_FL6 == I_ON)) {
	;***      240 : 		sendToRasPi_f(H_ALARM, ALKALINE_SKIP_ERROR, 1);
	;***      241 : 		g_alarm.refined.acid_skip = 1;
	;***      242 : 		//TODO: Control OFF
	;***      243 : 		return 1;
	;***      244 : 	}
	;***      245 : 	return 0;
	;***      246 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 246
	clrb a
	ret
.BB@LABEL@11_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 240
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410F
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 241
	set1 !LOWW(_g_alarm+0x00001).2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 243
	oneb a
	ret
_waterFullErrorCheck:
	.STACK _waterFullErrorCheck = 4
	;***      247 : 
	;***      248 : uint8_t waterFullErrorCheck(void) {
	;***      249 : 
	;***      250 : 	//Check g_color == BLACK for x hours
	;***      251 : 	if (g_machine_state.mode != HAND_WASHING
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 251
	mov a, !LOWW(_g_machine_state+0x0000E)
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
	;***      252 : 			&& g_machine_state.mode != WATER_WASHING
	;***      253 : 			&& g_machine_state.mode != ACID_WASHING
	;***      254 : 			&& g_machine_state.mode != ALKALINE_WASHING) {
	;***      255 : 		if(ns_delay_ms(&g_Tick.tickWaterFull, (uint32_t)20*60*1000)){
	;***      256 : 			sendToRasPi_f(H_ALARM, WATER_FULL_ERROR, 1);
	;***      257 : 			//TODO: Control OFF
	;***      258 : 			return 1;
	;***      259 : 		}
	;***      260 : 	}else
	;***      261 : 		g_Tick.tickWaterFull = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 261
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0006C), ax
	br $.BB@LABEL@12_5
.BB@LABEL@12_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 255
	movw de, #0x0012
	movw bc, #0x4F80
	movw ax, #LOWW(_g_Tick+0x0006C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@12_6
.BB@LABEL@12_5:	; bb48
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 263
	ret
.BB@LABEL@12_6:	; if_then_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 256
	movw de, #0x3F80
	movw ax, #0x4110
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 258
	oneb a
	ret
_filterReplacementErrorCheck:
	.STACK _filterReplacementErrorCheck = 4
	;***      262 : 	return 0;
	;***      263 : }
	;***      264 : 
	;***      265 : uint8_t filterReplacementErrorCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 265
	clrw ax
	movw de, ax
	;***      266 : 	if (g_TimeKeeper.SV1SV2OnTime_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 266
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
	;***      267 : 			>= g_timerSetting.t20_waterFilterAlarmIgnore_h) {
	;***      268 : 		g_alarm.refined.filter = FILTER_REPLACEMENT_E2;
	;***      269 : 		sendToRasPi_u32(H_ALARM, FILTER_REPLACEMENT_E2,
	;***      270 : 				g_TimeKeeper.SV1SV2OnTime_h);
	;***      271 : 		//TODO: Control OFF
	;***      272 : 		return 2;
	;***      273 : 
	;***      274 : 	} else if (g_TimeKeeper.SV1SV2OnTime_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 274
	cmpw ax, !LOWW(_g_timerSetting+0x0004A)
	movw ax, bc
	sknz
.BB@LABEL@13_4:	; if_else_bb
	cmpw ax, !LOWW(_g_timerSetting+0x00048)
.BB@LABEL@13_5:	; if_else_bb
	bnc $.BB@LABEL@13_7
.BB@LABEL@13_6:	; bb26
	;***      275 : 			>= g_timerSetting.t19_waterFilterAlarm_h) {
	;***      276 : 		g_alarm.refined.filter = FILTER_REPLACEMENT_E1;
	;***      277 : 		sendToRasPi_u32(H_ALARM, FILTER_REPLACEMENT_E1,
	;***      278 : 				g_TimeKeeper.SV1SV2OnTime_h);
	;***      279 : 		return 1;
	;***      280 : 	}
	;***      281 : 	return 0;
	;***      282 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 282
	clrb a
	ret
.BB@LABEL@13_7:	; if_then_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 276
	clr1 !LOWW(_g_alarm+0x00001).5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 277
	movw bc, ax
	clrw ax
	movw de, ax
	movw ax, #0x4124
	call !!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 279
	oneb a
	ret
.BB@LABEL@13_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 268
	set1 !LOWW(_g_alarm+0x00001).5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 269
	clrw ax
	movw de, ax
	movw ax, #0x4125
	call !!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 272
	mov a, #0x02
	ret
_levelSkipErrorCheck:
	.STACK _levelSkipErrorCheck = 4
	;***      283 : 
	;***      284 : uint8_t levelSkipErrorCheck(void){
	;***      285 : 	if(I_ACID_L_PIN_FL1 == I_OFF && (I_ACID_M_PIN_FL2 == I_ON || I_ACID_H_PIN_FL3 == I_ON))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 285
	mov a, 0xFFF07
	bf a.1, $.BB@LABEL@14_3
.BB@LABEL@14_1:	; bb
	mov a, 0xFFF07
	bf a.2, $.BB@LABEL@14_5
.BB@LABEL@14_2:	; bb12
	mov a, 0xFFF07
	bf a.3, $.BB@LABEL@14_5
.BB@LABEL@14_3:	; if_else_bb
	;***      286 : 		g_alarm.refined.acid_skip = ON;
	;***      287 : 	else if (I_ACID_M_PIN_FL2 == I_OFF && I_ACID_H_PIN_FL3 == I_ON)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 287
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
	;***      288 : 		g_alarm.refined.acid_skip = ON;
	;***      289 : 	else
	;***      290 : 		g_alarm.refined.acid_skip = OFF;
	;***      291 : 
	;***      292 : 	if(I_ALKALI_L_PIN_FL4 == I_OFF && (I_ALKALI_M_PIN_FL5 == I_ON || I_ALKALI_H_PIN_FL6 == I_ON))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 292
	mov a, 0xFFF00
	bf a.5, $.BB@LABEL@14_10
.BB@LABEL@14_8:	; bb72
	mov a, 0xFFF00
	bf a.6, $.BB@LABEL@14_12
.BB@LABEL@14_9:	; bb79
	mov a, 0xFFF07
	bf a.0, $.BB@LABEL@14_12
.BB@LABEL@14_10:	; if_else_bb105
	;***      293 : 		g_alarm.refined.alkaline_skip = ON;
	;***      294 : 	else if(I_ALKALI_M_PIN_FL5 == I_OFF && I_ALKALI_H_PIN_FL6 == I_ON)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 294
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
	;***      295 : 		g_alarm.refined.alkaline_skip = ON;
	;***      296 : 	else
	;***      297 : 		g_alarm.refined.alkaline_skip = OFF;
	;***      298 : 
	;***      299 : 	return g_alarm.refined.acid_skip == ON || g_alarm.refined.alkaline_skip == ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/error_check.c", 299
	and a, #0x0C
	oneb a
	sknz
.BB@LABEL@14_15:	; if_break_bb136
	clrb a
.BB@LABEL@14_16:	; if_break_bb136
	ret
	;***      300 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TimeKeeper@1:
	.DS (10)
_g_alarm:
	.DS (2)
