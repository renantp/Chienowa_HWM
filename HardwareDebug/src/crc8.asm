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
#@   -o src/crc8.obj
#@   ../src/crc8.c
#@  compiled at Fri Feb 25 09:28:33 2022

	.PUBLIC _crc8_4
	.PUBLIC _crc8_1

	.SECTION .textf,TEXTF
_crc8_4:
	.STACK _crc8_4 = 10
	;***        1 : /*
	;***        2 :  * Library: libcrc
	;***        3 :  * File:    src/crc8.c
	;***        4 :  * Author:  Lammert Bies
	;***        5 :  *
	;***        6 :  * This file is licensed under the MIT License as stated below
	;***        7 :  *
	;***        8 :  * Copyright (c) 1999-2016 Lammert Bies
	;***        9 :  *
	;***       10 :  * Permission is hereby granted, free of charge, to any person obtaining a copy
	;***       11 :  * of this software and associated documentation files (the "Software"), to deal
	;***       12 :  * in the Software without restriction, including without limitation the rights
	;***       13 :  * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	;***       14 :  * copies of the Software, and to permit persons to whom the Software is
	;***       15 :  * furnished to do so, subject to the following conditions:
	;***       16 :  *
	;***       17 :  * The above copyright notice and this permission notice shall be included in all
	;***       18 :  * copies or substantial portions of the Software.
	;***       19 :  * 
	;***       20 :  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	;***       21 :  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	;***       22 :  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	;***       23 :  * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	;***       24 :  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	;***       25 :  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	;***       26 :  * SOFTWARE.
	;***       27 :  *
	;***       28 :  * Description
	;***       29 :  * -----------
	;***       30 :  * The source file src/crc8.c contains routines for the calculation of 8 bit
	;***       31 :  * CRC values according to the calculation rules used in the SHT1x and SHT7x
	;***       32 :  * series of temperature and humidity sensors.
	;***       33 :  */
	;***       34 : 
	;***       35 : #include "crc8.h"
	;***       36 : static const uint8_t crc_table[] = {
	;***       37 :  0x00, 0x07, 0x0e, 0x09, 0x1c, 0x1b, 0x12, 0x15, 0x38, 0x3f, 0x36, 0x31,
	;***       38 :  0x24, 0x23, 0x2a, 0x2d, 0x70, 0x77, 0x7e, 0x79, 0x6c, 0x6b, 0x62, 0x65,
	;***       39 :  0x48, 0x4f, 0x46, 0x41, 0x54, 0x53, 0x5a, 0x5d, 0xe0, 0xe7, 0xee, 0xe9,
	;***       40 :  0xfc, 0xfb, 0xf2, 0xf5, 0xd8, 0xdf, 0xd6, 0xd1, 0xc4, 0xc3, 0xca, 0xcd,
	;***       41 :  0x90, 0x97, 0x9e, 0x99, 0x8c, 0x8b, 0x82, 0x85, 0xa8, 0xaf, 0xa6, 0xa1,
	;***       42 :  0xb4, 0xb3, 0xba, 0xbd, 0xc7, 0xc0, 0xc9, 0xce, 0xdb, 0xdc, 0xd5, 0xd2,
	;***       43 :  0xff, 0xf8, 0xf1, 0xf6, 0xe3, 0xe4, 0xed, 0xea, 0xb7, 0xb0, 0xb9, 0xbe,
	;***       44 :  0xab, 0xac, 0xa5, 0xa2, 0x8f, 0x88, 0x81, 0x86, 0x93, 0x94, 0x9d, 0x9a,
	;***       45 :  0x27, 0x20, 0x29, 0x2e, 0x3b, 0x3c, 0x35, 0x32, 0x1f, 0x18, 0x11, 0x16,
	;***       46 :  0x03, 0x04, 0x0d, 0x0a, 0x57, 0x50, 0x59, 0x5e, 0x4b, 0x4c, 0x45, 0x42,
	;***       47 :  0x6f, 0x68, 0x61, 0x66, 0x73, 0x74, 0x7d, 0x7a, 0x89, 0x8e, 0x87, 0x80,
	;***       48 :  0x95, 0x92, 0x9b, 0x9c, 0xb1, 0xb6, 0xbf, 0xb8, 0xad, 0xaa, 0xa3, 0xa4,
	;***       49 :  0xf9, 0xfe, 0xf7, 0xf0, 0xe5, 0xe2, 0xeb, 0xec, 0xc1, 0xc6, 0xcf, 0xc8,
	;***       50 :  0xdd, 0xda, 0xd3, 0xd4, 0x69, 0x6e, 0x67, 0x60, 0x75, 0x72, 0x7b, 0x7c,
	;***       51 :  0x51, 0x56, 0x5f, 0x58, 0x4d, 0x4a, 0x43, 0x44, 0x19, 0x1e, 0x17, 0x10,
	;***       52 :  0x05, 0x02, 0x0b, 0x0c, 0x21, 0x26, 0x2f, 0x28, 0x3d, 0x3a, 0x33, 0x34,
	;***       53 :  0x4e, 0x49, 0x40, 0x47, 0x52, 0x55, 0x5c, 0x5b, 0x76, 0x71, 0x78, 0x7f,
	;***       54 :  0x6a, 0x6d, 0x64, 0x63, 0x3e, 0x39, 0x30, 0x37, 0x22, 0x25, 0x2c, 0x2b,
	;***       55 :  0x06, 0x01, 0x08, 0x0f, 0x1a, 0x1d, 0x14, 0x13, 0xae, 0xa9, 0xa0, 0xa7,
	;***       56 :  0xb2, 0xb5, 0xbc, 0xbb, 0x96, 0x91, 0x98, 0x9f, 0x8a, 0x8d, 0x84, 0x83,
	;***       57 :  0xde, 0xd9, 0xd0, 0xd7, 0xc2, 0xc5, 0xcc, 0xcb, 0xe6, 0xe1, 0xe8, 0xef,
	;***       58 :  0xfa, 0xfd, 0xf4, 0xf3
	;***       59 : };
	;***       60 : uint8_t crc8_4(uint8_t *p, uint8_t len)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/crc8.c", 60
	push bc
	subw sp, #0x04
	movw de, ax
	clrb a
	mov [sp+0x00], a
.BB@LABEL@1_1:	; entry
	mov [sp+0x01], a
	mov a, [sp+0x04]
	;***       61 : {
	;***       62 :     uint16_t crc = 0x00;
	;***       63 :     for(uint8_t size = 0;size<len/4;size++){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/crc8.c", 63
	shrw ax, 8+0x00002
	movw bc, ax
	mov a, [sp+0x01]
	shrw ax, 8+0x00000
	movw [sp+0x02], ax
	cmpw ax, bc
	bnc $.BB@LABEL@1_5
.BB@LABEL@1_2:	; bb35.bb6_crit_edge
	clrb a
	mov [sp+0x05], a
.BB@LABEL@1_3:	; bb6
	;***       64 :     	for(uint8_t i=0;i<4;i++){
	;***       65 : 			crc = crc_table[(crc ^ p[3-i+size*4]) & 0xff];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/crc8.c", 65
	shrw ax, 8+0x00000
	movw bc, ax
	movw ax, [sp+0x02]
	shlw ax, 0x02
	addw ax, #0x0003
	subw ax, bc
	addw ax, de
	movw hl, ax
	mov a, [sp+0x00]
	xor a, [hl]
	mov b, a
	mov a, SMRLW(_crc_table@1)[b]
	mov [sp+0x00], a
	mov a, [sp+0x05]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/crc8.c", 64
	inc a
	mov [sp+0x05], a
	cmp a, #0x04
	bnz $.BB@LABEL@1_3
.BB@LABEL@1_4:	; bb32
	mov a, [sp+0x01]
	inc a
	br $.BB@LABEL@1_1
.BB@LABEL@1_5:	; bb44
	mov a, [sp+0x00]
	;***       66 : 		}
	;***       67 :     }
	;***       68 :     return crc;
	;***       69 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/crc8.c", 69
	addw sp, #0x06
	ret
_crc8_1:
	.STACK _crc8_1 = 6
	;***       70 : uint8_t crc8_1(uint8_t *p, uint8_t len)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/crc8.c", 70
	push hl
	movw de, ax
	clrb a
	mov b, a
.BB@LABEL@2_1:	; entry
	mov [sp+0x00], a
	;***       71 : {
	;***       72 :     uint8_t crc = 0x00;
	;***       73 : 	for(uint8_t i=0;i<len;i++){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/crc8.c", 73
	cmp a, c
	bz $.BB@LABEL@2_3
.BB@LABEL@2_2:	; bb
	;***       74 : 		crc = crc_table[(crc ^ p[i]) & 0xff];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/crc8.c", 74
	shrw ax, 8+0x00000
	addw ax, de
	movw hl, ax
	mov a, b
	xor a, [hl]
	mov b, a
	mov a, SMRLW(_crc_table@1)[b]
	mov b, a
	mov a, [sp+0x00]
	inc a
	br $.BB@LABEL@2_1
.BB@LABEL@2_3:	; bb26
	;***       75 : 	}
	;***       76 :     return crc;
	;***       77 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/crc8.c", 77
	mov a, b
	pop hl
	ret
	.SECTION .const,CONST
_crc_table@1:
	.DS (1)
	.DB 0x07,0x0E,0x09,0x1C,0x1B,0x12,0x15,0x38,0x3F,0x36,0x31,0x24,0x23,0x2A,0x2D,0x70
	.DB 0x77,0x7E,0x79,0x6C,0x6B,0x62,0x65,0x48,0x4F,0x46,0x41,0x54,0x53,0x5A,0x5D,0xE0
	.DB 0xE7,0xEE,0xE9,0xFC,0xFB,0xF2,0xF5,0xD8,0xDF,0xD6,0xD1,0xC4,0xC3,0xCA,0xCD,0x90
	.DB 0x97,0x9E,0x99,0x8C,0x8B,0x82,0x85,0xA8,0xAF,0xA6,0xA1,0xB4,0xB3,0xBA,0xBD,0xC7
	.DB 0xC0,0xC9,0xCE,0xDB,0xDC,0xD5,0xD2,0xFF,0xF8,0xF1,0xF6,0xE3,0xE4,0xED,0xEA,0xB7
	.DB 0xB0,0xB9,0xBE,0xAB,0xAC,0xA5,0xA2,0x8F,0x88,0x81,0x86,0x93,0x94,0x9D,0x9A,0x27
	.DB 0x20,0x29,0x2E,0x3B,0x3C,0x35,0x32,0x1F,0x18,0x11,0x16,0x03,0x04,0x0D,0x0A,0x57
	.DB 0x50,0x59,0x5E,0x4B,0x4C,0x45,0x42,0x6F,0x68,0x61,0x66,0x73,0x74,0x7D,0x7A,0x89
	.DB 0x8E,0x87,0x80,0x95,0x92,0x9B,0x9C,0xB1,0xB6,0xBF,0xB8,0xAD,0xAA,0xA3,0xA4,0xF9
	.DB 0xFE,0xF7,0xF0,0xE5,0xE2,0xEB,0xEC,0xC1,0xC6,0xCF,0xC8,0xDD,0xDA,0xD3,0xD4,0x69
	.DB 0x6E,0x67,0x60,0x75,0x72,0x7B,0x7C,0x51,0x56,0x5F,0x58,0x4D,0x4A,0x43,0x44,0x19
	.DB 0x1E,0x17,0x10,0x05,0x02,0x0B,0x0C,0x21,0x26,0x2F,0x28,0x3D,0x3A,0x33,0x34,0x4E
	.DB 0x49,0x40,0x47,0x52,0x55,0x5C,0x5B,0x76,0x71,0x78,0x7F,0x6A,0x6D,0x64,0x63,0x3E
	.DB 0x39,0x30,0x37,0x22,0x25,0x2C,0x2B,0x06,0x01,0x08,0x0F,0x1A,0x1D,0x14,0x13,0xAE
	.DB 0xA9,0xA0,0xA7,0xB2,0xB5,0xBC,0xBB,0x96,0x91,0x98,0x9F,0x8A,0x8D,0x84,0x83,0xDE
	.DB 0xD9,0xD0,0xD7,0xC2,0xC5,0xCC,0xCB,0xE6,0xE1,0xE8,0xEF,0xFA,0xFD,0xF4,0xF3