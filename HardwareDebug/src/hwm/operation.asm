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
#@   -o src/hwm/operation.obj
#@   ../src/hwm/operation.c
#@  compiled at Tue Aug 23 10:01:07 2022

	.EXTERN _g_timerSetting
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_commnunication_flag
	.EXTERN _g_systemTime
	.PUBLIC _electrolyticOperationON
	.PUBLIC _isElectrolyticOperationOFF_nostop
	.EXTERN _ns_delay_ms
	.PUBLIC _TestModeOperation

	.SECTION .textf,TEXTF
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***        1 : /*
	;***        2 :  * operation.c
	;***        3 :  *
	;***        4 :  *  Created on: 11 Jan 2022
	;***        5 :  *      Author: Hung
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "operation.h"
	;***        9 : 
	;***       10 : /**
	;***       11 :  * 30/11/2021: Checked by An
	;***       12 :  */
	;***       13 : void electrolyticOperationON(void) {
	;***       14 : 	//Electrolytic operation ON
	;***       15 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 15
	set1 0xFFF01.7
	;***       16 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 16
	set1 0xFFF0E.2
	;***       17 : 	O_PUMP_SALT_PIN_SP1 = 0U; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 17
	clr1 0xFFF06.0
	;***       18 : 	g_machine_state.electrolyteOperation = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 18
	oneb !LOWW(_g_machine_state+0x00007)
	;***       19 : 	g_TimeKeeper.electrolyteOff_h = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 19
	clrb !LOWW(_g_TimeKeeper@1)
	;***       20 : 	g_TimeKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 20
	movw bc, !LOWW(_g_TimeKeeper@1+0x00008)
	movw ax, !LOWW(_g_TimeKeeper@1+0x00006)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@1_3
.BB@LABEL@1_1:	; entry
	bc $.BB@LABEL@1_3
.BB@LABEL@1_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@1_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TimeKeeper@1+0x00006), ax
	movw ax, bc
	movw !LOWW(_g_TimeKeeper@1+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 23
	ret
_isElectrolyticOperationOFF_nostop:
	.STACK _isElectrolyticOperationOFF_nostop = 6
	;***       21 : 			g_TimeKeeper.neutralization == 0 ?
	;***       22 : 					g_systemTime : g_TimeKeeper.neutralization;
	;***       23 : }
	;***       24 : /**
	;***       25 :  *
	;***       26 :  */
	;***       27 : void isElectrolyticOperationOFF_nostop(void) {
	;***       28 : 	uint8_t *state = &g_machine_state.electrolyteOFF;
	;***       29 : 	uint32_t *tick = &g_Tick.tickElectrolyticOff;
	;***       30 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 30
	mov a, !LOWW(_g_machine_state+0x00008)
	dec a
	bz $.BB@LABEL@2_5
.BB@LABEL@2_1:	; entry
	dec a
	bnz $.BB@LABEL@2_4
.BB@LABEL@2_2:	; switch_clause_bb9
	;***       31 : 	case 0:
	;***       32 : 		// Set g_machine_state.electrolyteOFF = 1 to start OFF
	;***       33 : 		// This case run when electrolyte is ON or already OFF
	;***       34 : //		if (ns_delay_ms(tick, (uint32_t) 60000 * 60)
	;***       35 : //				&& g_machine_state.electrolyteOperation == 0) {
	;***       36 : //			sendToRasPi_u32(H_READ, MID_NIGHT, 0x00);
	;***       37 : //			g_TimeKeeper.electrolyteOff_h++;
	;***       38 : //		} else if (g_machine_state.electrolyteOperation == 1) {
	;***       39 : //			if (ns_delay_ms(&g_TimeKeeper.neutralization, 1000)) {
	;***       40 : //				g_neutralization_time_s++;
	;***       41 : //			}
	;***       42 : //			(*tick) = g_systemTime;
	;***       43 : //		}
	;***       44 : 		break;
	;***       45 : 	case 1:
	;***       46 : 		g_TimeKeeper.neutralization = 0;
	;***       47 : 		O_CVCC_ON_PIN = OFF;
	;***       48 : 		O_PUMP_SALT_PIN_SP1 = 1U; //SP1
	;***       49 : 
	;***       50 : 		(*state)++;
	;***       51 : 		break;
	;***       52 : 	case 2:
	;***       53 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 53
	movw ax, !LOWW(_g_timerSetting+0x00010)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00012)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0004C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_4
.BB@LABEL@2_3:	; if_then_bb
	;***       54 : 				g_timerSetting.t5_electrolysisStopDelay_s * 1000)) {
	;***       55 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 55
	clrb !LOWW(_g_machine_state+0x00008)
	;***       56 : 			O_SUPPLY_WATER_PIN_SV1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 56
	clr1 0xFFF01.7
.BB@LABEL@2_4:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 64
	ret
.BB@LABEL@2_5:	; switch_clause_bb5
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 46
	movw !LOWW(_g_TimeKeeper@1+0x00008), ax
	movw !LOWW(_g_TimeKeeper@1+0x00006), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 47
	clr1 0xFFF0E.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 48
	set1 0xFFF06.0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 50
	inc !LOWW(_g_machine_state+0x00008)
	ret
_TestModeOperation:
	.STACK _TestModeOperation = 4
	;***       57 : 			//TODO: Change this
	;***       58 : //			g_machine_state.electrolyteOperation--;
	;***       59 : 		}
	;***       60 : 		break;
	;***       61 : 	default:
	;***       62 : 		break;
	;***       63 : 	}
	;***       64 : }
	;***       65 : 
	;***       66 : void TestModeOperation(void) {
	;***       67 : 	if (g_commnunication_flag.test_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 67
	mov a, !LOWW(_g_commnunication_flag+0x0000A)
	;***       68 : 
	;***       69 : 	}
	;***       70 : 	if (g_machine_state.test_operation == TEST_INDIVIDUAL) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/operation.c", 70
	ret
	;***       71 : 		//TODO: Pause other operation
	;***       72 : 
	;***       73 : 	}
	;***       74 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TimeKeeper@1:
	.DS (10)
