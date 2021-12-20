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
#@  compiled at Mon Dec 20 15:45:32 2021

	.EXTERN _g_systemTime
	.PUBLIC _delay_ms
	.PUBLIC _delay
	.EXTERN _R_WDT_Restart
	.PUBLIC _ns_delay_ms
	.PUBLIC _non_block_delay
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
	.STACK _ns_delay_ms = 10
	;***       26 : int ns_delay_ms(uint32_t *stamp, uint32_t ms){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 26
	push ax
	subw sp, #0x04
	movw hl, ax
	;***       27 : //	if(0xffffffff - *stamp < ms)
	;***       28 : //		if((g_systemTime <= ms - (0xffffffff - *stamp))&(g_systemTime < 0xffff0000))
	;***       29 : //			return 0;
	;***       30 : //	else
	;***       31 : 	if(g_systemTime - *stamp < ms) // if g_systemTime < *stamp (x) -> out=stamp+x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 31
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x00], ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, [hl+0x00]
	movw [sp+0x02], ax
	movw ax, [sp+0x00]
	sknc
.BB@LABEL@3_1:	; entry
	decw ax
.BB@LABEL@3_2:	; entry
	subw ax, [hl+0x02]
	cmpw ax, de
	movw ax, [sp+0x02]
	sknz
.BB@LABEL@3_3:	; entry
	cmpw ax, bc
.BB@LABEL@3_4:	; entry
	bnc $.BB@LABEL@3_7
.BB@LABEL@3_5:	; bb13
	;***       32 : 		return 0;
	;***       33 : 	*stamp = g_systemTime;
	;***       34 : 	return 1;
	;***       35 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 35
	clrw ax
.BB@LABEL@3_6:	; bb13
	addw sp, #0x06
	ret
.BB@LABEL@3_7:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 33
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x04]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 34
	onew ax
	br $.BB@LABEL@3_6
_non_block_delay:
	.STACK _non_block_delay = 4
	;***       36 : int non_block_delay(uint32_t *stamp, uint32_t ms){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 36
	onew ax
	;***       37 : 	return 1;
	;***       38 : 
	;***       39 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 39
	ret
_mTask:
	.STACK _mTask = 14
	;***       40 : 
	;***       41 : void mTask(void (*func)(void), uint32_t *_p_stamp ,uint32_t ms){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 41
	push bc
	subw sp, #0x06
	mov [sp+0x00], a
	push bc
	pop hl
	;***       42 : 	if(g_systemTime - *_p_stamp >= ms){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 42
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, [hl+0x00]
	movw [sp+0x02], ax
	movw ax, [sp+0x0E]
	movw bc, ax
	movw ax, [sp+0x04]
	sknc
.BB@LABEL@5_1:	; entry
	decw ax
.BB@LABEL@5_2:	; entry
	subw ax, [hl+0x02]
	cmpw ax, bc
	movw ax, [sp+0x0C]
	movw bc, ax
	movw ax, [sp+0x02]
	sknz
.BB@LABEL@5_3:	; entry
	cmpw ax, bc
.BB@LABEL@5_4:	; entry
	bnc $.BB@LABEL@5_6
.BB@LABEL@5_5:	; return
	addw sp, #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 46
	ret
.BB@LABEL@5_6:	; if_then_bb
	mov a, [sp+0x00]
	;***       43 : 		func();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 43
	mov cs, a
	push de
	pop hl
	call hl
	;***       44 : 		*_p_stamp = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/usr_timer.c", 44
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x06]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
	br $.BB@LABEL@5_5
	;***       45 : 	}
	;***       46 : }
	;***       47 : 
