#CC-RL Compiler RL78 Assembler Source
#@  CC-RL Version : V1.10.00 [20 Nov 2020]
#@  Commmand :
#@   -cpu=S3
#@   -c
#@   -dev=D:/Chieniwa/E2_Studio/.eclipse/com.renesas.platform_1435879475/DebugComp/RL78/RL78/Common/DR5F104ML.DVF
#@   -MAKEUD=D:\Chieniwa\E2_Studio\ControlPCB_HWM\HardwareDebug\src
#@   -I C:\Program Files (x86)\Renesas Electronics\CS+\CC\CC-RL\V1.10.00\inc
#@   -I D:\Chieniwa\E2_Studio\ControlPCB_HWM\generate
#@   -character_set=utf8
#@   -lang=c99
#@   -g
#@   -asmopt=-prn_path=src
#@   -asm_path=src/
#@   -pass_source
#@   -o src/usr_timer.obj
#@   ../src/usr_timer.c
#@  compiled at Wed Jun 22 12:09:14 2022

	.EXTERN _g_systemTime
	.PUBLIC _delay_ms
	.PUBLIC _delay
	.EXTERN _R_WDT_Restart
	.PUBLIC _ns_delay_ms
	.PUBLIC _mTask

	.SECTION .textf,TEXTF
_delay_ms:
	.STACK _delay_ms = 14
	;***        1 : /*
	;***        2 :  * usr_timer.c
	;***        3 :  *
	;***        4 :  *  Created on: 6 Oct 2021
	;***        5 :  *      Author: Renan
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "usr_timer.h"
	;***        9 : #include "r_cg_wdt.h"
	;***       10 : 
	;***       11 : void delay_ms(uint32_t ms){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 11
	push ax
	subw sp, #0x06
	push bc
	pop de
	;***       12 : 	uint32_t stamp = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 12
	movw hl, !LOWW(_g_systemTime+0x00002)
	pop ax
	push hl
	movw bc, !LOWW(_g_systemTime)
	movw ax, bc
	movw [sp+0x02], ax
	clrw ax
	decw ax
	;***       13 : 	if(0xffffffff - stamp < ms){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 13
	subw ax, bc
	movw bc, ax
	clrw ax
	decw ax
	subw ax, hl
	cmpw ax, de
	movw ax, [sp+0x06]
	xchw ax, bc
	sknz
.BB@LABEL@1_1:	; entry
	cmpw ax, bc
.BB@LABEL@1_2:	; entry
	bnc $.BB@LABEL@1_10
.BB@LABEL@1_3:	; bb8
	;***       14 : 		while(g_systemTime <= ms - 0xffffffff - stamp);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 14
	movw ax, bc
	addw ax, #0x0001
	movw hl, ax
	movw ax, de
	sknc
.BB@LABEL@1_4:	; bb8
	incw ax
.BB@LABEL@1_5:	; bb8
	movw [sp+0x06], ax
	movw ax, [sp+0x02]
	xchw ax, hl
	subw ax, hl
	movw [sp+0x04], ax
	pop hl
	push hl
	movw ax, [sp+0x06]
	sknc
.BB@LABEL@1_6:	; bb8
	decw ax
.BB@LABEL@1_7:	; bb8
	subw ax, hl
	cmpw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x04]
	sknz
.BB@LABEL@1_8:	; bb8
	cmpw ax, !LOWW(_g_systemTime)
.BB@LABEL@1_9:	; bb8
	bnc $.BB@LABEL@1_3
	br $.BB@LABEL@1_15
.BB@LABEL@1_10:	; bb19
	;***       15 : 	}else{
	;***       16 : 		while(g_systemTime - stamp < ms);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 16
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x06], ax
	movw ax, [sp+0x02]
	movw hl, ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, hl
	movw [sp+0x04], ax
	pop hl
	push hl
	movw ax, [sp+0x06]
	sknc
.BB@LABEL@1_11:	; bb19
	decw ax
.BB@LABEL@1_12:	; bb19
	subw ax, hl
	cmpw ax, de
	movw ax, [sp+0x04]
	sknz
.BB@LABEL@1_13:	; bb19
	cmpw ax, bc
.BB@LABEL@1_14:	; bb19
	bc $.BB@LABEL@1_10
.BB@LABEL@1_15:	; return
	;***       17 : 	}
	;***       18 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 18
	addw sp, #0x08
	ret
_delay:
	.STACK _delay = 6
	;***       19 : void delay(uint8_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 19
	push hl
	inc a
.BB@LABEL@2_1:	; bb3
	;***       20 : 	while(s != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 20
	dec a
	mov [sp+0x00], a
	bz $.BB@LABEL@2_3
.BB@LABEL@2_2:	; bb
	;***       21 : 		delay_ms(1000);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 21
	clrw bc
	movw ax, #0x03E8
	call $!_delay_ms
	;***       22 : 		s--;
	;***       23 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 23
	call !!_R_WDT_Restart
	mov a, [sp+0x00]
	br $.BB@LABEL@2_1
.BB@LABEL@2_3:	; return
	;***       24 : 	}
	;***       25 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 25
	pop hl
	ret
_ns_delay_ms:
	.STACK _ns_delay_ms = 12
	;***       26 : int ns_delay_ms(uint32_t *stamp, uint32_t ms){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 26
	push bc
	subw sp, #0x04
	movw hl, ax
	push de
	;***       27 : 	if(g_systemTime >= *stamp){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 27
	movw ax, [hl+0x02]
	movw [sp+0x02], ax
	cmpw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, [hl]
	movw bc, ax
	sknz
.BB@LABEL@3_1:	; entry
	cmpw ax, !LOWW(_g_systemTime)
.BB@LABEL@3_2:	; entry
	bnh $.BB@LABEL@3_11
.BB@LABEL@3_3:	; if_else_bb
	movw ax, [sp+0x06]
	;***       28 : 		if(g_systemTime - (*stamp) < ms)
	;***       29 : 			return 0;
	;***       30 : 	}else{
	;***       31 : 		if(g_systemTime < ms - (0xffffffff - (*stamp)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 31
	addw ax, bc
	movw de, ax
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, [sp+0x00]
	sknc
.BB@LABEL@3_4:	; if_else_bb
	incw ax
.BB@LABEL@3_5:	; if_else_bb
	addw ax, bc
	movw [sp+0x00], ax
	movw ax, de
	addw ax, #0x0001
	movw bc, ax
	movw ax, [sp+0x00]
	sknc
.BB@LABEL@3_6:	; if_else_bb
	incw ax
.BB@LABEL@3_7:	; if_else_bb
	cmpw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, bc
	sknz
.BB@LABEL@3_8:	; if_else_bb
	cmpw ax, !LOWW(_g_systemTime)
.BB@LABEL@3_9:	; if_else_bb
	bh $.BB@LABEL@3_16
.BB@LABEL@3_10:	; if_break_bb29
	;***       32 : 			return 0;
	;***       33 : 	}
	;***       34 : 	*stamp = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 34
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	movw [hl], ax
	movw ax, bc
	movw [hl+0x02], ax
	;***       35 : 	return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 35
	onew ax
	br $.BB@LABEL@3_17
.BB@LABEL@3_11:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 28
	movw de, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, bc
	movw [sp+0x04], ax
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@3_12:	; if_then_bb
	decw ax
.BB@LABEL@3_13:	; if_then_bb
	subw ax, bc
	movw bc, ax
	movw ax, [sp+0x00]
	xchw ax, bc
	cmpw ax, bc
	movw ax, [sp+0x06]
	movw bc, ax
	movw ax, [sp+0x04]
	sknz
.BB@LABEL@3_14:	; if_then_bb
	cmpw ax, bc
.BB@LABEL@3_15:	; if_then_bb
	bnc $.BB@LABEL@3_10
.BB@LABEL@3_16:	; bb33
	;***       36 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 36
	clrw ax
.BB@LABEL@3_17:	; bb33
	addw sp, #0x08
	ret
_mTask:
	.STACK _mTask = 14
	;***       37 : 
	;***       38 : void mTask(void (*func)(void), uint32_t *_p_stamp ,uint32_t ms){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 38
	push bc
	subw sp, #0x06
	mov [sp+0x00], a
	push bc
	pop hl
	;***       39 : 	if(g_systemTime - *_p_stamp >= ms){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 39
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, [hl+0x00]
	movw [sp+0x02], ax
	movw ax, [sp+0x0E]
	movw bc, ax
	movw ax, [sp+0x04]
	sknc
.BB@LABEL@4_1:	; entry
	decw ax
.BB@LABEL@4_2:	; entry
	subw ax, [hl+0x02]
	cmpw ax, bc
	movw ax, [sp+0x0C]
	movw bc, ax
	movw ax, [sp+0x02]
	sknz
.BB@LABEL@4_3:	; entry
	cmpw ax, bc
.BB@LABEL@4_4:	; entry
	bnc $.BB@LABEL@4_6
.BB@LABEL@4_5:	; return
	addw sp, #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 43
	ret
.BB@LABEL@4_6:	; if_then_bb
	mov a, [sp+0x00]
	;***       40 : 		func();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 40
	mov cs, a
	push de
	pop hl
	call hl
	;***       41 : 		*_p_stamp = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 41
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x06]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
	br $.BB@LABEL@4_5
	;***       42 : 	}
	;***       43 : }
	;***       44 : 
