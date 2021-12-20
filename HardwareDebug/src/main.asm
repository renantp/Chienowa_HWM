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
#@   -o src/main.obj
#@   ../src/main.c
#@  compiled at Mon Dec 20 15:45:17 2021

	.EXTERN _rx_count
	.EXTERN _g_control_buffer
	.EXTERN _g_systemTime
	.EXTERN _g_uart2_sendend
	.EXTERN _g_uart3_sendend
	.EXTERN _g_rx_data
	.EXTERN _commnunication_flag
	.PUBLIC _g_timerSetting
	.PUBLIC _g_numberSetting
	.PUBLIC _g_color
	.PUBLIC _g_pre_color
	.PUBLIC _g_flow_value
	.PUBLIC _g_electrolytic_flag
	.PUBLIC _g_alarm
	.PUBLIC _g_machine_state
	.PUBLIC _g_io_status
	.PUBLIC _g_pre_io_status
	.PUBLIC _io_statusSize
	.PUBLIC _timeSettingSize
	.PUBLIC _numberSettingSize
	.PUBLIC __pre_flow_state
	.PUBLIC __flow_pulse
	.PUBLIC _handSensorLED
	.PUBLIC _setting_default
	.PUBLIC _sendToRasPi
	.EXTERN _R_UART2_Send
	.PUBLIC _sendToWaterSolfner
	.EXTERN _R_UART3_Send
	.PUBLIC _RaspberryResponse_nostop
	.EXTERN _R_WDT_Restart
	.EXTERN _crc8_1
	.EXTERN _EE_SPI_Write
	.PUBLIC _InitialOperationModeStart
	.EXTERN _ns_delay_ms
	.PUBLIC _FlowSensorCheck
	.PUBLIC _nostop_WaterSupplyOperation
	.PUBLIC _stop_waitAlarmConfirm
	.PUBLIC _nostop_waitAlarmConfirm
	.PUBLIC _Voltage1Check_waitReset
	.PUBLIC _Voltage2Check_loop
	.PUBLIC _Voltage3Check_waitReset
	.PUBLIC _LowVoltageCheck_waitReset
	.PUBLIC _OverCurrentCheck_waitReset
	.PUBLIC _ElectrolyticOperation
	.PUBLIC _solenoidCheck
	.EXTERN _delay_ms
	.PUBLIC _saltWaterTankFullCheck
	.PUBLIC _saltWaterTankEmptyCheck
	.PUBLIC _acidWaterTankSkipCheck
	.PUBLIC _alkalineWaterTankSkipCheck
	.PUBLIC _FilterReplacementCheck
	.PUBLIC _ElectrolyzeWaterGeneration
	.PUBLIC _WaterWashingMode_nostop
	.PUBLIC _HandWashingMode_nostop
	.PUBLIC _AcidWaterMode_nostop
	.PUBLIC _AlkalineWaterMode_nostop
	.PUBLIC _CallanCleaningMode_nostop
	.PUBLIC _main_init_20211111
	.PUBLIC _main_loop_20211111
	.PUBLIC _electrolyticOperationON
	.PUBLIC _electrolyticOperationOFF
	.PUBLIC _measureFlowSensor
	.EXTERN _delay
	.PUBLIC _nostop_measureFlowSensor
	.PUBLIC _UpdateMachineStatus

	.SECTION .textf,TEXTF
_handSensorLED:
	.STACK _handSensorLED = 4
	;***        1 : /*
	;***        2 :  * main.c
	;***        3 :  *
	;***        4 :  *  Created on: 29 Oct 2021
	;***        5 :  *      Author: Renan
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "r_cg_macrodriver.h"
	;***        9 : #include "r_cg_userdefine.h"
	;***       10 : #include "usr_setting_sheet.h"
	;***       11 : #include "usr_timer.h"
	;***       12 : #include "r_cg_cgc.h"
	;***       13 : #include "r_cg_port.h"
	;***       14 : #include "r_cg_serial.h"
	;***       15 : #include "r_cg_adc.h"
	;***       16 : #include "r_cg_timer.h"
	;***       17 : #include "r_cg_wdt.h"
	;***       18 : #include "main.h"
	;***       19 : 
	;***       20 : #define VCC (24.0)
	;***       21 : 
	;***       22 : struct Timer_Setting_s g_timerSetting = { 1000, 15 };
	;***       23 : struct Number_Setting_s g_numberSetting;
	;***       24 : enum HS_COLOR g_color, g_pre_color;
	;***       25 : float g_flow_value;
	;***       26 : volatile uint8_t g_electrolytic_flag = 0;
	;***       27 : union Alarm_Flag_u g_alarm;
	;***       28 : struct Machine_State_u g_machine_state;
	;***       29 : union IO_Status_u g_io_status, g_pre_io_status;
	;***       30 : //const uint8_t io_statusSize = sizeof(union IO_Status_u);
	;***       31 : const uint8_t io_statusSize = 5;
	;***       32 : //const uint8_t timeSettingSize = sizeof(struct Timer_Setting_s);
	;***       33 : const uint8_t timeSettingSize = 69;
	;***       34 : //const uint8_t numberSettingSize = sizeof(struct Number_Setting_s);
	;***       35 : const uint8_t numberSettingSize = 33;
	;***       36 : 
	;***       37 : //struct Tick_s g_Tick;
	;***       38 : 
	;***       39 : //void electrolyticOperationON(void);
	;***       40 : //void electrolyticOperationOFF(void);
	;***       41 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 41
	mov !LOWW(_g_color), a
	;***       42 : 	g_color = color;
	;***       43 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 43
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       44 : 		switch (color) {
	;***       45 : 		case RED:
	;***       46 : 			O_HS_ICL_PIN = 1;
	;***       47 : 			O_HS_IDA_PIN = 0;
	;***       48 : 			break;
	;***       49 : 		case BLUE:
	;***       50 : 			O_HS_ICL_PIN = 0;
	;***       51 : 			O_HS_IDA_PIN = 0;
	;***       52 : 			break;
	;***       53 : 		case WHITE:
	;***       54 : 			O_HS_ICL_PIN = 0;
	;***       55 : 			O_HS_IDA_PIN = 1;
	;***       56 : 			break;
	;***       57 : 		default:
	;***       58 : 			O_HS_ICL_PIN = 1;
	;***       59 : 			O_HS_IDA_PIN = 1;
	;***       60 : 			break;
	;***       61 : 		}
	;***       62 : 		g_pre_color = g_color;
	;***       63 : 	}
	;***       64 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 64
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 44
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 58
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 46
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 47
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 50
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 51
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 54
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 62
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_setting_default:
	.STACK _setting_default = 4
	;***       65 : void setting_default(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	movw ax, #0x4086
	;***       66 : 	g_numberSetting.upperVoltage1 = 4.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x6666
	movw !LOWW(_g_numberSetting), ax
	movw ax, #0x4060
	;***       67 : 	g_numberSetting.upperVoltage2 = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	movw !LOWW(_g_numberSetting+0x00006), ax
	;***       68 : 	g_numberSetting.upperVoltage3 = 2.2;
	;***       69 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       70 : 	g_numberSetting.upperCurrent = 4.3;
	;***       71 : 	g_numberSetting.lowerCurrent = 0.2;
	;***       72 : 	g_numberSetting.upperFlow = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***       73 : 	g_numberSetting.lowerFlow = 0.4;
	;***       74 : 
	;***       75 : 	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***       76 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       77 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       78 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_timerSetting+0x0000E), ax
	;***       79 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x00012), ax
	;***       80 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       81 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x0001A), ax
	;***       82 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x0001E), ax
	;***       83 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00022), ax
	;***       84 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00026), ax
	;***       85 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       86 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x0002E), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_numberSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F00
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw ax, #0x4089
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_numberSetting+0x00016), ax
	mov x, #0xCC
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_timerSetting), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_timerSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_timerSetting+0x0000C), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x00010), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x0001C), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00020), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00024), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00028), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x0002C), ax
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 10
	;***       87 : }
	;***       88 : #ifdef RENAN_CODE
	;***       89 : void renanCode(void){
	;***       90 : 	//Power On Mode
	;***       91 : 	O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       92 : 	O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       93 : 	do{
	;***       94 : 		O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN;	// Turn on SV5 if ACID tank empty
	;***       95 : 		O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN;	// Turn on SV6 if ALK tank empty
	;***       96 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***       97 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***       98 : 		R_WDT_Restart();
	;***       99 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      100 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***      101 : 	O_DRAIN_ACID_PIN = O_DRAIN_ALK_PIN = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***      102 : 
	;***      103 : 	// Drainage operation
	;***      104 : 	O_SPOUT_WATER_PIN = ON;	// SV2 On
	;***      105 : 	delay(st[1]);			// Default 30 seconds
	;***      106 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	;***      107 : 	delay_ms(500);
	;***      108 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	;***      109 : }
	;***      110 : 
	;***      111 : 
	;***      112 : void code_20211029(void){
	;***      113 : 	//---------------Electrolytic operation-----------------------------
	;***      114 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	;***      115 : 	O_CVCC_ON_PIN = ON;
	;***      116 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***      117 : 	delay(10);
	;***      118 : 	//TODO: Neutralization timer On
	;***      119 : 
	;***      120 : 	overVoltage1Error();
	;***      121 : }
	;***      122 : #endif
	;***      123 : 
	;***      124 : //----------------------Begin code 11112021--------------------------------------
	;***      125 : void sendToRasPi(enum UART_header_e head, enum Control_status type, float value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 125
	push hl
	push ax
	movw ax, bc
	push de
	pop bc
	;***      126 : 	uint8_t state = g_uart2_sendend;
	;***      127 : 	g_control_buffer.head = head;
	;***      128 : 	g_control_buffer.set_number = type;
	;***      129 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	call !!__COM_ftoul
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 126
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x02], a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 127
	mov !LOWW(_g_control_buffer), a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
	mov !LOWW(_g_control_buffer+0x00001), a
	;***      130 : 	R_UART2_Send((uint8_t*) &g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@3_1:	; bb10
	mov a, [sp+0x02]
	;***      131 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 131
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@3_1
.BB@LABEL@3_2:	; return
	;***      132 : 		;
	;***      133 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	addw sp, #0x04
	ret
_sendToWaterSolfner:
	.STACK _sendToWaterSolfner = 6
	;***      134 : void sendToWaterSolfner(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	push hl
	;***      135 : 		uint32_t value) {
	;***      136 : 	uint8_t state = g_uart3_sendend;
	;***      137 : 	g_control_buffer.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 137
	mov !LOWW(_g_control_buffer), a
	mov a, x
	;***      138 : 	g_control_buffer.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	mov !LOWW(_g_control_buffer+0x00001), a
	movw ax, bc
	;***      139 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 139
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 136
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	;***      140 : 	R_UART3_Send((uint8_t*) &g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 140
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART3_Send
.BB@LABEL@4_1:	; bb9
	mov a, [sp+0x00]
	;***      141 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@4_1
.BB@LABEL@4_2:	; return
	;***      142 : 		;
	;***      143 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	pop hl
	ret
_RaspberryResponse_nostop:
	.STACK _RaspberryResponse_nostop = 8
	;***      144 : void RaspberryResponse_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	subw sp, #0x04
	;***      145 : 	if (commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 145
	cmp0 !LOWW(_commnunication_flag)
	bz $.BB@LABEL@5_5
.BB@LABEL@5_1:	; if_then_bb
	;***      146 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 146
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      147 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@5_2:	; bb19
	mov a, [sp+0x00]
	;***      148 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@5_4
.BB@LABEL@5_3:	; bb
	;***      149 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
	call !!_R_WDT_Restart
	br $.BB@LABEL@5_2
.BB@LABEL@5_4:	; bb27
	;***      150 : 		}
	;***      151 : 		commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 151
	clrb !LOWW(_commnunication_flag)
.BB@LABEL@5_5:	; if_break_bb
	;***      152 : 	}
	;***      153 : 	if (commnunication_flag.send_respone_status_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	cmp0 !LOWW(_commnunication_flag+0x00005)
	bz $.BB@LABEL@5_10
.BB@LABEL@5_6:	; if_then_bb33
	;***      154 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 154
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      155 : 		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 155
	inc !LOWW(_rx_count)
	;***      156 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 156
	movw bc, #0x0005
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@5_7:	; bb41
	mov a, [sp+0x00]
	;***      157 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@5_9
.BB@LABEL@5_8:	; bb40
	;***      158 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	call !!_R_WDT_Restart
	br $.BB@LABEL@5_7
.BB@LABEL@5_9:	; bb49
	;***      159 : 		}
	;***      160 : 		commnunication_flag.send_respone_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	clrb !LOWW(_commnunication_flag+0x00005)
.BB@LABEL@5_10:	; if_break_bb50
	;***      161 : 	}
	;***      162 : 	if (commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	cmp0 !LOWW(_commnunication_flag+0x00001)
	bz $.BB@LABEL@5_15
.BB@LABEL@5_11:	; if_then_bb56
	;***      163 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 163
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      164 : 		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 164
	inc !LOWW(_rx_count)
	;***      165 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 165
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00044), a
	;***      166 : 				timeSettingSize - 1);
	;***      167 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 167
	movw bc, #0x0045
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@5_12:	; bb69
	mov a, [sp+0x00]
	;***      168 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@5_14
.BB@LABEL@5_13:	; bb68
	;***      169 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 169
	call !!_R_WDT_Restart
	br $.BB@LABEL@5_12
.BB@LABEL@5_14:	; bb77
	;***      170 : 		}
	;***      171 : 		commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	clrb !LOWW(_commnunication_flag+0x00001)
.BB@LABEL@5_15:	; if_break_bb78
	;***      172 : 	}
	;***      173 : 	if (commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 173
	cmp0 !LOWW(_commnunication_flag+0x00002)
	bz $.BB@LABEL@5_20
.BB@LABEL@5_16:	; if_then_bb84
	;***      174 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      175 : 		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	inc !LOWW(_rx_count)
	;***      176 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
	mov c, #0x20
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00020), a
	;***      177 : 				numberSettingSize - 1);
	;***      178 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 178
	movw bc, #0x0021
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@5_17:	; bb97
	mov a, [sp+0x00]
	;***      179 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@5_19
.BB@LABEL@5_18:	; bb96
	;***      180 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	call !!_R_WDT_Restart
	br $.BB@LABEL@5_17
.BB@LABEL@5_19:	; bb105
	;***      181 : 		}
	;***      182 : 		commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 182
	clrb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@5_20:	; if_break_bb106
	;***      183 : 	}
	;***      184 : 	if (commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	cmp !LOWW(_commnunication_flag+0x00004), #0x02
	.bnz $!.BB@LABEL@5_36
.BB@LABEL@5_21:	; if_break_bb106.bb187_crit_edge
	clrb a
.BB@LABEL@5_22:	; if_break_bb106.bb187_crit_edge
	mov [sp+0x00], a
	;***      185 : 		uint8_t *p = (uint8_t*) &_settingTime;
	;***      186 : 		//Do not Edit this, must keep!!!!
	;***      187 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 187
	cmp a, #0x44
	bz $.BB@LABEL@5_32
.BB@LABEL@5_23:	; bb113
	;***      188 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	shrw ax, 8+0x00000
	movw [sp+0x02], ax
	mov a, [sp+0x00]
	and a, #0x03
	bz $.BB@LABEL@5_28
.BB@LABEL@5_24:	; bb113
	dec a
	bz $.BB@LABEL@5_27
.BB@LABEL@5_25:	; bb113
	dec a
	bnz $.BB@LABEL@5_31
.BB@LABEL@5_26:	; switch_clause_bb133
	movw ax, [sp+0x02]
	;***      189 : 			case 4:
	;***      190 : 				p[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
	;***      191 : 				break;
	;***      192 : 			case 2:
	;***      193 : 				p[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 193
	addw ax, #LOWW(_g_rx_data+0x0FFFF)
	movw de, ax
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, #0x0043
	subw ax, bc
	movw bc, ax
	mov a, [de]
	br $.BB@LABEL@5_30
.BB@LABEL@5_27:	; switch_clause_bb150
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, #0x0041
	;***      194 : 				break;
	;***      195 : 			case 1:
	;***      196 : 				p[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	subw ax, bc
	movw [sp+0x02], ax
	mov a, [sp+0x00]
	mov b, a
	mov a, LOWW(_g_rx_data+0x00001)[b]
	br $.BB@LABEL@5_29
.BB@LABEL@5_28:	; switch_clause_bb167
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, #0x003F
	;***      197 : 				break;
	;***      198 : 			case 0:
	;***      199 : 				p[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	subw ax, bc
	movw [sp+0x02], ax
	mov a, [sp+0x00]
	mov b, a
	mov a, LOWW(_g_rx_data+0x00003)[b]
.BB@LABEL@5_29:	; switch_clause_bb167
	mov b, a
	movw ax, [sp+0x02]
	xchw ax, bc
.BB@LABEL@5_30:	; switch_clause_bb167
	mov LOWW(__settingTime@4)[bc], a
.BB@LABEL@5_31:	; switch_break_bb
	mov a, [sp+0x00]
	inc a
	br $.BB@LABEL@5_22
.BB@LABEL@5_32:	; bb196
	;***      200 : 				break;
	;***      201 : 			default:
	;***      202 : 				break;
	;***      203 : 			}
	;***      204 : 		}
	;***      205 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 205
	mov a, !LOWW(_g_rx_data+0x00044)
	mov [sp+0x00], a
	mov !LOWW(__settingTime@4+0x00044), a
	;***      206 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 206
	mov c, #0x43
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	movw de, #0x0000
	clrw bc
	cmp x, a
	mov a, #0x53
	bnz $.BB@LABEL@5_34
.BB@LABEL@5_33:	; if_then_bb219
	;***      207 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 2)) {
	;***      208 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 208
	clrb x
	call $!_sendToRasPi
	;***      209 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 209
	movw de, #0x0062
	movw bc, #LOWW(__settingTime@4)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	;***      210 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, 0x040,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	movw de, #0x0062
	movw bc, #0x0040
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	br $.BB@LABEL@5_35
.BB@LABEL@5_34:	; if_else_bb
	;***      211 : 					sizeof(g_timerSetting));
	;***      212 : 		} else {
	;***      213 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
	mov x, #0x16
	call $!_sendToRasPi
.BB@LABEL@5_35:	; if_break_bb220
	;***      214 : //				R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
	;***      215 : 		}
	;***      216 : 		commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	clrb !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@5_36:	; if_break_bb221
	;***      217 : 	}
	;***      218 : 	if (commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	cmp !LOWW(_commnunication_flag+0x00003), #0x02
	bnz $.BB@LABEL@5_50
.BB@LABEL@5_37:	; if_break_bb221.bb280_crit_edge
	clrb a
	mov b, a
.BB@LABEL@5_38:	; bb280
	;***      219 : 		uint8_t *p = (uint8_t*) &_settingNumber;
	;***      220 : 		//Do not Edit this, must keep!!!!
	;***      221 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	cmp a, #0x20
	bz $.BB@LABEL@5_46
.BB@LABEL@5_39:	; bb228
	;***      222 : //				p[i] = g_rx_data[i];
	;***      223 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	and a, #0x03
	bz $.BB@LABEL@5_44
.BB@LABEL@5_40:	; bb228
	dec a
	bz $.BB@LABEL@5_43
.BB@LABEL@5_41:	; bb228
	dec a
	bnz $.BB@LABEL@5_45
.BB@LABEL@5_42:	; switch_clause_bb243
	mov a, b
	;***      224 : 			case 4:
	;***      225 : 				p[i - 3] = g_rx_data[i];
	;***      226 : 				break;
	;***      227 : 			case 2:
	;***      228 : 				p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber@5+0x0FFFF)
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@5_45
.BB@LABEL@5_43:	; switch_clause_bb254
	;***      229 : 				break;
	;***      230 : 			case 1:
	;***      231 : 				p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber@5+0x00001)[b], a
	br $.BB@LABEL@5_45
.BB@LABEL@5_44:	; switch_clause_bb265
	;***      232 : 				break;
	;***      233 : 			case 0:
	;***      234 : 				p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 234
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber@5+0x00003)[b], a
.BB@LABEL@5_45:	; switch_break_bb277
	inc b
	mov a, b
	br $.BB@LABEL@5_38
.BB@LABEL@5_46:	; bb289
	;***      235 : 				break;
	;***      236 : 			default:
	;***      237 : 				break;
	;***      238 : 			}
	;***      239 : 		}
	;***      240 : 		_settingNumber.crc = g_rx_data[numberSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	mov a, !LOWW(_g_rx_data+0x00020)
	mov [sp+0x00], a
	mov !LOWW(__settingNumber@5+0x00020), a
	;***      241 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	mov c, #0x1F
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	movw de, #0x0000
	clrw bc
	cmp x, a
	mov a, #0x53
	bnz $.BB@LABEL@5_48
.BB@LABEL@5_47:	; if_then_bb312
	;***      242 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 2)) {
	;***      243 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 243
	clrb x
	call $!_sendToRasPi
	;***      244 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	movw de, #0x0026
	movw bc, #LOWW(__settingNumber@5)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	;***      245 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, 0x000,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 245
	movw de, #0x0026
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	br $.BB@LABEL@5_49
.BB@LABEL@5_48:	; if_else_bb313
	;***      246 : 					sizeof(g_numberSetting));
	;***      247 : 		} else {
	;***      248 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 248
	mov x, #0x16
	call $!_sendToRasPi
.BB@LABEL@5_49:	; if_break_bb314
	;***      249 : //				R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
	;***      250 : 		}
	;***      251 : 		commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	clrb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@5_50:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 14
	;***      252 : 	}
	;***      253 : }
	;***      254 : /**
	;***      255 :  * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
	;***      256 :  * 13/12/2021: Checked!
	;***      257 :  */
	;***      258 : void InitialOperationModeStart(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	subw sp, #0x0A
	;***      259 : 	uint32_t _tick[2];
	;***      260 : 	uint8_t pre_acid, pre_akaline;
	;***      261 : 	pre_acid = O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 261
	mov a, 0xFFF07
	mov1 CY, a.1
	mov a, #0x80
	sknc
.BB@LABEL@6_1:	; bb9
	and a, 0xFFF06
.BB@LABEL@6_2:	; bb13
	mov x, a
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	mov a, 0xFFF06
	;***      262 : 	pre_akaline = O_DRAIN_ALK_PIN =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x40
	sknc
.BB@LABEL@6_3:	; bb30
	and a, 0xFFF06
.BB@LABEL@6_4:	; bb36
	mov x, a
	mov a, #0xBF
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	mov a, 0xFFF06
.BB@LABEL@6_5:	; bb190
	;***      263 : 	I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN;// Turn on SV6 if ALK tank empty
	;***      264 : 	while (1) {
	;***      265 : 		O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN;// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	mov a, 0xFFF07
	mov1 CY, a.1
	mov a, #0x80
	sknc
.BB@LABEL@6_6:	; bb56
	and a, 0xFFF06
.BB@LABEL@6_7:	; bb61
	mov x, a
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      266 : 		O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN;// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x40
	sknc
.BB@LABEL@6_8:	; bb77
	and a, 0xFFF06
.BB@LABEL@6_9:	; bb83
	mov x, a
	mov a, #0xBF
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      267 : 		pre_acid = I_ACID_L_PIN == I_ON ? ON : OFF;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 267
	mov a, 0xFFF07
	oneb x
	bf a.1, $.BB@LABEL@6_11
.BB@LABEL@6_10:	; bb99
	clrb x
.BB@LABEL@6_11:	; bb99
	mov a, x
	mov [sp+0x01], a
	;***      268 : 		pre_akaline = I_ALKALI_L_PIN == I_ON ? ON : OFF;// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 268
	mov a, 0xFFF00
	mov1 CY, a.5
	oneb a
	sknc
.BB@LABEL@6_12:	; bb112
	clrb a
.BB@LABEL@6_13:	; bb112
	mov [sp+0x00], a
	;***      269 : 		if (pre_acid != O_DRAIN_ACID_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 269
	mov a, 0xFFF06
	shr a, 0x07
	cmp x, a
	bnz $.BB@LABEL@6_15
.BB@LABEL@6_14:	; if_else_bb
	;***      270 : 			if (ns_delay_ms(&_tick[0], 500)) {
	;***      271 : 				O_DRAIN_ACID_PIN = pre_acid;
	;***      272 : 			}
	;***      273 : 		} else
	;***      274 : 			_tick[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 274
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
	br $.BB@LABEL@6_17
.BB@LABEL@6_15:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, sp
	incw ax
	incw ax
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_17
.BB@LABEL@6_16:	; if_then_bb132
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 271
	mov1 CY, a.0
	mov a, 0xFFF06
	mov1 a.7, CY
	mov 0xFFF06, a
.BB@LABEL@6_17:	; if_break_bb142
	pop ax
	push ax
	;***      275 : 		if (pre_akaline != O_DRAIN_ALK_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	mov a, 0xFFF06
	shr a, 0x06
	and a, #0x01
	cmp x, a
	bnz $.BB@LABEL@6_19
.BB@LABEL@6_18:	; if_else_bb167
	;***      276 : 			if (ns_delay_ms(&_tick[1], 500)) {
	;***      277 : 				O_DRAIN_ALK_PIN = pre_akaline;
	;***      278 : 			}
	;***      279 : 		} else
	;***      280 : 			_tick[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 280
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x06], ax
	br $.BB@LABEL@6_21
.BB@LABEL@6_19:	; if_then_bb152
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, sp
	addw ax, #0x0006
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_21
.BB@LABEL@6_20:	; if_then_bb159
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	mov1 CY, a.0
	mov a, 0xFFF06
	mov1 a.6, CY
	mov 0xFFF06, a
.BB@LABEL@6_21:	; if_break_bb171
	mov a, #0x80
	;***      281 : 		if ((O_DRAIN_ACID_PIN == OFF) & (O_DRAIN_ALK_PIN == OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 281
	and a, 0xFFF06
	mov x, a
	mov a, 0xFFF06
	bt a.6, $.BB@LABEL@6_23
.BB@LABEL@6_22:	; if_break_bb171
	cmp0 x
	bz $.BB@LABEL@6_24
.BB@LABEL@6_23:	; if_break_bb189
	;***      282 : 			break;
	;***      283 : 		}
	;***      284 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	call $!_UpdateMachineStatus
	;***      285 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	call !!_R_WDT_Restart
	br $!.BB@LABEL@6_5
.BB@LABEL@6_24:	; return
	;***      286 : 	}
	;***      287 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	addw sp, #0x0A
	ret
_FlowSensorCheck:
	.STACK _FlowSensorCheck = 18
	;***      288 : /**
	;***      289 :  * FlowSensorCheck
	;***      290 :  * 30/11/2021: Checked!
	;***      291 :  * @return 0 is Error, 1 is OK, 2 Still taking
	;***      292 :  */
	;***      293 : uint8_t FlowSensorCheck(uint32_t *_time) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	subw sp, #0x0A
	;***      294 : //	g_flow_value = measureFlowSensor();
	;***      295 : 	if ((g_flow_value < g_numberSetting.upperFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 295
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_flow_value+0x00002)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_flow_value)
	movw [sp+0x06], ax
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
	call !!__COM_fle
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@7_1:	; entry
	clrb a
.BB@LABEL@7_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@7_3:	; entry
	clrb x
.BB@LABEL@7_4:	; entry
	or x, a
	movw bc, !LOWW(_g_numberSetting+0x0001A)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_numberSetting+0x00018)
	movw [sp+0x06], ax
	bnz $.BB@LABEL@7_12
.BB@LABEL@7_5:	; entry
	push bc
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
	call !!__COM_fge
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@7_6:	; entry
	clrb a
.BB@LABEL@7_7:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@7_8:	; entry
	clrb x
.BB@LABEL@7_9:	; entry
	or x, a
	bnz $.BB@LABEL@7_12
.BB@LABEL@7_10:	; bb14
	;***      296 : 			& (g_flow_value > g_numberSetting.lowerFlow)) {
	;***      297 : 		return 1;
	;***      298 : 	} else {
	;***      299 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      300 : 		return 0;
	;***      301 : 	}
	;***      302 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
	oneb a
.BB@LABEL@7_11:	; bb14
	addw sp, #0x0A
	ret
.BB@LABEL@7_12:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 300
	clrb a
	br $.BB@LABEL@7_11
_nostop_WaterSupplyOperation:
	.STACK _nostop_WaterSupplyOperation = 4
	;***      303 : /**
	;***      304 :  * WaterSupplyOperation
	;***      305 :  * 30/11/2021: Checked by An
	;***      306 :  */
	;***      307 : uint8_t nostop_WaterSupplyOperation(void) {
	;***      308 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      309 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      310 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 310
	mov b, !LOWW(_g_machine_state+0x00004)
	cmp0 b
	bz $.BB@LABEL@8_12
.BB@LABEL@8_1:	; entry
	dec b
	bz $.BB@LABEL@8_6
.BB@LABEL@8_2:	; entry
	dec b
	bz $.BB@LABEL@8_7
.BB@LABEL@8_3:	; entry
	dec b
	bz $.BB@LABEL@8_8
.BB@LABEL@8_4:	; entry
	dec b
	bz $.BB@LABEL@8_11
.BB@LABEL@8_5:	; switch_clause_bb43
	;***      311 : 	case 0:
	;***      312 : 		*tick = g_systemTime;
	;***      313 : 		(*state)++;
	;***      314 : 		break;
	;***      315 : 	case 1:
	;***      316 : 		O_SPOUT_WATER_PIN = ON;		// SV2 On
	;***      317 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 30000)) {
	;***      318 : 			(*state)++;
	;***      319 : 		}
	;***      320 : 		break;
	;***      321 : 	case 2:
	;***      322 : 		O_SUPPLY_WATER_PIN = ON;	// SV1 On
	;***      323 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 500)) {
	;***      324 : 			(*state)++;
	;***      325 : 		}
	;***      326 : 		break;
	;***      327 : 	case 3:
	;***      328 : 		O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	;***      329 : //			nostop_measureFlowSensor();
	;***      330 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 15000)) {
	;***      331 : 			(*state)++;
	;***      332 : 		}
	;***      333 : 		break;
	;***      334 : 	case 4:
	;***      335 : 		measureFlowSensor();
	;***      336 : 		(*state)++;
	;***      337 : 		break;
	;***      338 : 	default:
	;***      339 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 339
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@8_13
.BB@LABEL@8_6:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 316
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 317
	movw bc, #0x7530
	br $.BB@LABEL@8_9
.BB@LABEL@8_7:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 322
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 323
	movw bc, #0x01F4
	br $.BB@LABEL@8_9
.BB@LABEL@8_8:	; switch_clause_bb27
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 328
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 330
	movw bc, #0x3A98
.BB@LABEL@8_9:	; switch_clause_bb27
	clrw ax
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@8_13
.BB@LABEL@8_10:	; if_then_bb32
	inc !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@8_13
.BB@LABEL@8_11:	; switch_clause_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 335
	call $!_measureFlowSensor
	br $.BB@LABEL@8_10
.BB@LABEL@8_12:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 312
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
.BB@LABEL@8_13:	; switch_break_bb
	;***      340 : 		break;
	;***      341 : 	}
	;***      342 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 342
	call !!_R_WDT_Restart
	;***      343 : 	return *state == 5 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 343
	cmp !LOWW(_g_machine_state+0x00004), #0x05
	oneb a
	sknz
.BB@LABEL@8_14:	; switch_break_bb
	clrb a
.BB@LABEL@8_15:	; switch_break_bb
	ret
_stop_waitAlarmConfirm:
	.STACK _stop_waitAlarmConfirm = 6
	;***      344 : }
	;***      345 : 
	;***      346 : void stop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 346
	push hl
	mov [sp+0x00], a
.BB@LABEL@9_1:	; bb2
	pop ax
	push ax
	;***      347 : 	while ((g_rx_data[0] != H_CLEAR) & (g_rx_data[1] != alarm)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 347
	mov a, !LOWW(_g_rx_data+0x00001)
	cmp a, x
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@9_4
.BB@LABEL@9_2:	; bb2
	cmp a, #0x43
	bz $.BB@LABEL@9_4
.BB@LABEL@9_3:	; bb
	;***      348 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 348
	call !!_R_WDT_Restart
	br $.BB@LABEL@9_1
.BB@LABEL@9_4:	; bb15
	;***      349 : 	}
	;***      350 : 	g_rx_data[0] = g_rx_data[1] = OK_ALL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 350
	clrb !LOWW(_g_rx_data+0x00001)
	clrb !LOWW(_g_rx_data)
	pop hl
	ret
_nostop_waitAlarmConfirm:
	.STACK _nostop_waitAlarmConfirm = 4
	;***      351 : }
	;***      352 : uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 352
	mov x, !LOWW(_g_rx_data+0x00001)
	;***      353 : 	if ((g_rx_data[0] != H_CLEAR) & (g_rx_data[1] != alarm)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 353
	cmp x, a
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@10_3
.BB@LABEL@10_1:	; entry
	cmp a, #0x43
	bz $.BB@LABEL@10_3
.BB@LABEL@10_2:	; bb17
	;***      354 : 		return 1;
	;***      355 : 	}
	;***      356 : 	g_rx_data[0] = g_rx_data[1] = OK_ALL;
	;***      357 : 	return 0;
	;***      358 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 358
	oneb a
	ret
.BB@LABEL@10_3:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 356
	clrb !LOWW(_g_rx_data+0x00001)
	clrb !LOWW(_g_rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 357
	clrb a
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      359 : /**
	;***      360 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      361 :  * 30/11/2021: Checked by An
	;***      362 :  * @return 0 - OK; 1 - Error
	;***      363 :  */
	;***      364 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 364
	subw sp, #0x0A
	;***      365 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 365
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
.BB@LABEL@11_1:	; entry
	clrb a
.BB@LABEL@11_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@11_3:	; entry
	clrb x
.BB@LABEL@11_4:	; entry
	or x, a
	bnz $.BB@LABEL@11_9
.BB@LABEL@11_5:	; if_then_bb
	;***      366 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 366
	movw ax, !LOWW(_g_timerSetting+0x0000C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0000E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0002C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@11_8
.BB@LABEL@11_6:	; bb24
	clrb a
.BB@LABEL@11_7:	; bb24
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 379
	ret
.BB@LABEL@11_8:	; if_then_bb11
	;***      367 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      368 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 368
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      369 : 					(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      370 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 370
	call $!_electrolyticOperationOFF
	;***      371 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 371
	set1 !LOWW(_g_alarm).0
	;***      372 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 372
	mov a, #0x05
	call $!_stop_waitAlarmConfirm
	;***      373 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 373
	clr1 !LOWW(_g_alarm).0
	;***      374 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 374
	oneb a
	br $.BB@LABEL@11_7
.BB@LABEL@11_9:	; if_else_bb
	;***      375 : 		}
	;***      376 : 	} else
	;***      377 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 377
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0002C), ax
	br $.BB@LABEL@11_6
_Voltage2Check_loop:
	.STACK _Voltage2Check_loop = 18
	;***      378 : 	return 0;
	;***      379 : }
	;***      380 : /**
	;***      381 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      382 :  * 16/12/2021: Checked by An
	;***      383 :  * @return 0 - OK
	;***      384 :  */
	;***      385 : void Voltage2Check_loop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 385
	subw sp, #0x0A
	;***      386 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 386
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
.BB@LABEL@12_1:	; entry
	clrb a
.BB@LABEL@12_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@12_3:	; entry
	clrb x
.BB@LABEL@12_4:	; entry
	or x, a
	bnz $.BB@LABEL@12_8
.BB@LABEL@12_5:	; if_then_bb
	;***      387 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 387
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
	movw ax, #LOWW(_g_Tick@1+0x00030)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@12_7
.BB@LABEL@12_6:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 397
	ret
.BB@LABEL@12_7:	; if_then_bb10
	;***      388 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      389 : 			g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 389
	set1 !LOWW(_g_alarm).1
	;***      390 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 390
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4106
	addw sp, #0x0A
	br $!_sendToRasPi
.BB@LABEL@12_8:	; if_else_bb
	;***      391 : 					g_io_status.refined.CVCCVoltage);
	;***      392 : 		}
	;***      393 : 	} else {
	;***      394 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 394
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00030), ax
	;***      395 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 395
	clr1 !LOWW(_g_alarm).1
	br $.BB@LABEL@12_6
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      396 : 	}
	;***      397 : }
	;***      398 : /**
	;***      399 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      400 :  * 16/12/2021: Checked by An
	;***      401 :  * @return 0 - OK; 1 - Error
	;***      402 :  */
	;***      403 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 403
	subw sp, #0x0A
	;***      404 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 404
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
.BB@LABEL@13_1:	; entry
	clrb a
.BB@LABEL@13_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@13_3:	; entry
	clrb x
.BB@LABEL@13_4:	; entry
	or x, a
	bnz $.BB@LABEL@13_9
.BB@LABEL@13_5:	; if_then_bb
	;***      405 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 405
	movw ax, !LOWW(_g_timerSetting+0x00014)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00016)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x00034)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@13_8
.BB@LABEL@13_6:	; bb24
	clrb a
.BB@LABEL@13_7:	; bb24
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 418
	ret
.BB@LABEL@13_8:	; if_then_bb11
	;***      406 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      407 : 			g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 407
	set1 !LOWW(_g_alarm).2
	;***      408 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 408
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      409 : 					(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      410 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_3);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 410
	mov a, #0x07
	call $!_stop_waitAlarmConfirm
	;***      411 : 			g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 411
	clr1 !LOWW(_g_alarm).2
	;***      412 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 412
	oneb a
	br $.BB@LABEL@13_7
.BB@LABEL@13_9:	; if_else_bb
	;***      413 : 		}
	;***      414 : 	} else {
	;***      415 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 415
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00034), ax
	br $.BB@LABEL@13_6
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      416 : 	}
	;***      417 : 	return 0;
	;***      418 : }
	;***      419 : /**
	;***      420 :  * Checked 16/12/2021
	;***      421 :  * @return
	;***      422 :  */
	;***      423 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 423
	subw sp, #0x0A
	;***      424 : 	if ((g_systemTime - g_TickKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 424
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x00], ax
	movw ax, !LOWW(_g_timerSetting+0x00018)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0001A)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	movw bc, ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TickKeeper@2+0x00010)
	movw hl, ax
	movw ax, [sp+0x00]
	sknc
.BB@LABEL@14_1:	; entry
	decw ax
.BB@LABEL@14_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@2+0x00012)
	cmpw ax, bc
	movw ax, hl
	sknz
.BB@LABEL@14_3:	; entry
	cmpw ax, de
.BB@LABEL@14_4:	; entry
	.bc $!.BB@LABEL@14_14
.BB@LABEL@14_5:	; if_then_bb
	;***      425 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      426 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 426
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
.BB@LABEL@14_6:	; if_then_bb
	clrb a
.BB@LABEL@14_7:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@14_8:	; if_then_bb
	clrb x
.BB@LABEL@14_9:	; if_then_bb
	or x, a
	bnz $.BB@LABEL@14_14
.BB@LABEL@14_10:	; if_then_bb13
	;***      427 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 427
	movw ax, !LOWW(_g_timerSetting+0x0001C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0001E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x00038)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@14_13
.BB@LABEL@14_11:	; bb36
	clrb a
.BB@LABEL@14_12:	; bb36
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 442
	ret
.BB@LABEL@14_13:	; if_then_bb20
	;***      428 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      429 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 429
	call $!_electrolyticOperationOFF
	;***      430 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 430
	set1 !LOWW(_g_alarm).5
	;***      431 : 				sendToRasPi(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 431
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4108
	call $!_sendToRasPi
	;***      432 : 						(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      433 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 433
	mov a, #0x08
	call $!_stop_waitAlarmConfirm
	;***      434 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 434
	clr1 !LOWW(_g_alarm).5
	;***      435 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 435
	oneb a
	br $.BB@LABEL@14_12
.BB@LABEL@14_14:	; if_else_bb
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00038), ax
	br $.BB@LABEL@14_11
_OverCurrentCheck_waitReset:
	.STACK _OverCurrentCheck_waitReset = 18
	;***      436 : 			}
	;***      437 : 		} else
	;***      438 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      439 : 	} else
	;***      440 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      441 : 	return 0;
	;***      442 : }
	;***      443 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 443
	subw sp, #0x0A
	;***      444 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 444
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      445 : 	const uint16_t _max_time = 60000;
	;***      446 : 	if (g_systemTime - g_TickKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 446
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TickKeeper@2+0x00010)
	movw de, ax
	movw ax, bc
	sknc
.BB@LABEL@15_1:	; entry
	decw ax
.BB@LABEL@15_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@2+0x00012)
	clrw bc
	cmpw ax, bc
	movw ax, de
	sknz
.BB@LABEL@15_3:	; entry
	cmpw ax, #0x1388
.BB@LABEL@15_4:	; entry
	.bc $!.BB@LABEL@15_28
.BB@LABEL@15_5:	; if_then_bb
	;***      447 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 447
	movw ax, !LOWW(_g_numberSetting+0x00012)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	push ax
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000E)
	movw [sp+0x06], ax
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	movw bc, !LOWW(_g_numberSetting+0x00016)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x06], ax
	bnz $.BB@LABEL@15_11
.BB@LABEL@15_6:	; if_then_bb
	push bc
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
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@15_7:	; if_then_bb
	clrb a
.BB@LABEL@15_8:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@15_9:	; if_then_bb
	clrb x
.BB@LABEL@15_10:	; if_then_bb
	or x, a
	.bnz $!.BB@LABEL@15_28
.BB@LABEL@15_11:	; if_then_bb21
	mov a, #0x48
	;***      448 : 				| (g_io_status.refined.CVCCCurrent
	;***      449 : 						>= g_numberSetting.upperCurrent)) {
	;***      450 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 450
	and a, !LOWW(_g_alarm)
	bnz $.BB@LABEL@15_19
.BB@LABEL@15_12:	; if_then_bb38
	pop bc
	push bc
	movw ax, [sp+0x02]
	;***      451 : 					& (g_alarm.refined.overCurrent == 0)) {
	;***      452 : 				sendToRasPi(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 452
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4109
	call $!_sendToRasPi
	;***      453 : 						(uint32_t) (g_io_status.refined.CVCCCurrent));
	;***      454 : 				g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 454
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
	movw [sp+0x06], ax
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
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@15_13:	; if_then_bb38
	clrb a
.BB@LABEL@15_14:	; if_then_bb38
	cmp0 x
	oneb x
	sknz
.BB@LABEL@15_15:	; if_then_bb38
	clrb x
.BB@LABEL@15_16:	; if_then_bb38
	or x, a
	mov x, #0x40
	skz
.BB@LABEL@15_17:	; bb46
	clrb x
.BB@LABEL@15_18:	; bb47
	mov a, #0xBF
	and a, !LOWW(_g_alarm)
	or a, x
	mov !LOWW(_g_alarm), a
.BB@LABEL@15_19:	; if_break_bb
	;***      455 : 						g_io_status.refined.CVCCCurrent
	;***      456 : 								<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      457 : 			}
	;***      458 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 458
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
.BB@LABEL@15_20:	; if_break_bb
	clrb a
.BB@LABEL@15_21:	; if_break_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@15_22:	; if_break_bb
	clrb x
.BB@LABEL@15_23:	; if_break_bb
	or x, a
	bnz $.BB@LABEL@15_27
.BB@LABEL@15_24:	; if_then_bb61
	;***      459 : 					>= g_numberSetting.upperCurrent) {
	;***      460 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 460
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick@1+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@15_26
.BB@LABEL@15_25:	; if_break_bb79
	;***      461 : 					g_alarm.refined.overCurrent = 1;
	;***      462 : 					sendToRasPi(H_ALARM, OVER_CURRENT,
	;***      463 : 							(uint32_t) (g_io_status.refined.CVCCCurrent));
	;***      464 : 					stop_waitAlarmConfirm(OVER_CURRENT);
	;***      465 : 					g_alarm.refined.overCurrent = 0;
	;***      466 : 					return 1;
	;***      467 : 				}
	;***      468 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 468
	call !!_R_WDT_Restart
	br $.BB@LABEL@15_28
.BB@LABEL@15_26:	; if_then_bb68
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 461
	set1 !LOWW(_g_alarm).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 462
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, !LOWW(_g_io_status+0x0000E)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x410A
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 464
	mov a, #0x0A
	call $!_stop_waitAlarmConfirm
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 465
	clr1 !LOWW(_g_alarm).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 466
	oneb a
	br $.BB@LABEL@15_29
.BB@LABEL@15_27:	; if_else_bb
	;***      469 : 			} else
	;***      470 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 470
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0003C), ax
.BB@LABEL@15_28:	; bb85
	clrb a
.BB@LABEL@15_29:	; bb85
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 474
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@16_1:	; WAIT_RESET
	call $!_electrolyticOperationON
.BB@LABEL@16_2:	; bb
	;***      471 : 		}
	;***      472 : 	}
	;***      473 : 	return 0;
	;***      474 : }
	;***      475 : void ElectrolyticOperation(void) {
	;***      476 : 	WAIT_RESET: electrolyticOperationON();
	;***      477 : 	do {
	;***      478 : 		if (Voltage1Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 478
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@16_1
.BB@LABEL@16_3:	; if_break_bb
	;***      479 : 			goto WAIT_RESET;
	;***      480 : 		Voltage2Check_loop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 480
	call $!_Voltage2Check_loop
	;***      481 : 		if (Voltage3Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 481
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@16_1
.BB@LABEL@16_4:	; if_break_bb12
	;***      482 : 			goto WAIT_RESET;
	;***      483 : 		if (LowVoltageCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 483
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@16_1
.BB@LABEL@16_5:	; if_break_bb20
	;***      484 : 			goto WAIT_RESET;
	;***      485 : 		if (OverCurrentCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 485
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@16_1
.BB@LABEL@16_6:	; if_break_bb28
	;***      486 : 			goto WAIT_RESET;
	;***      487 : 		//----------CVCC Alarm Input-----------------
	;***      488 : 		if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 488
	mov a, 0xFFF00
	bf a.4, $.BB@LABEL@16_9
.BB@LABEL@16_7:	; if_break_bb44
	;***      489 : 			g_alarm.refined.cvcc = 1;
	;***      490 : 			electrolyticOperationOFF();
	;***      491 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	;***      492 : 			stop_waitAlarmConfirm(CVCC_ALARM);
	;***      493 : 			g_alarm.refined.cvcc = 0;
	;***      494 : 			goto WAIT_RESET;
	;***      495 : 		}
	;***      496 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 496
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 477
	mov a, 0xFFF07
	shr a, 0x03
	or a, 0xFFF07
	bt a.0, $.BB@LABEL@16_2
.BB@LABEL@16_8:	; bb62
	;***      497 : 	} while ((I_ACID_H_PIN == I_OFF) | (I_ALKALI_H_PIN == I_OFF));
	;***      498 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 498
	br $!_electrolyticOperationOFF
.BB@LABEL@16_9:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 489
	set1 !LOWW(_g_alarm+0x00001).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 490
	call $!_electrolyticOperationOFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 491
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 492
	mov a, #0x12
	call $!_stop_waitAlarmConfirm
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 493
	clr1 !LOWW(_g_alarm+0x00001).0
	br $.BB@LABEL@16_1
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      499 : }
	;***      500 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 500
	subw sp, #0x04
	;***      501 : 	uint32_t _time_count = 0;
	;***      502 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 502
	movw ax, !LOWW(_g_timerSetting+0x00020)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00022)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	addw ax, de
	movw bc, !LOWW(_g_flow_value+0x00002)
	movw de, !LOWW(_g_flow_value)
	bnz $.BB@LABEL@17_3
.BB@LABEL@17_1:	; entry
	bc $.BB@LABEL@17_3
.BB@LABEL@17_2:	; entry
	movw ax, #0x3DCC
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, de
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@17_4
.BB@LABEL@17_3:	; entry.if_break_bb_crit_edge
	clrw ax
	movw [sp+0x02], ax
	movw [sp+0x00], ax
	br $.BB@LABEL@17_5
.BB@LABEL@17_4:	; if_then_bb
	onew ax
	movw [sp+0x02], ax
	decw ax
	movw [sp+0x00], ax
	;***      503 : 			& (_time_count
	;***      504 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      505 : 		_time_count++;
	;***      506 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 506
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@17_5:	; if_break_bb
	;***      507 : 	}
	;***      508 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 508
	movw ax, !LOWW(_g_timerSetting+0x00020)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00022)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	movw bc, ax
	movw ax, [sp+0x00]
	cmpw ax, bc
	movw ax, [sp+0x02]
	sknz
.BB@LABEL@17_6:	; if_break_bb
	cmpw ax, de
.BB@LABEL@17_7:	; if_break_bb
	addw sp, #0x04
	bnz $.BB@LABEL@17_9
.BB@LABEL@17_8:	; if_then_bb20
	;***      509 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi
.BB@LABEL@17_9:	; return
	;***      510 : 	}
	;***      511 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 511
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      512 : void saltWaterTankFullCheck(void) {
	;***      513 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 513
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@18_2
.BB@LABEL@18_1:	; return
	;***      514 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      515 : 		electrolyticOperationOFF();
	;***      516 : 		//TODO: Fault in the flowchart
	;***      517 : 	}
	;***      518 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 518
	ret
.BB@LABEL@18_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 514
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 515
	br $!_electrolyticOperationOFF
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      519 : void saltWaterTankEmptyCheck(void) {
	;***      520 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 520
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@19_2
.BB@LABEL@19_1:	; if_then_bb
	;***      521 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 521
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi
.BB@LABEL@19_2:	; return
	;***      522 : 		//TODO: Control OFF
	;***      523 : 	}
	;***      524 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      525 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 525
	movw de, #0xFF07
	;***      526 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
	mov a, [de]
	mov c, a
	mov a, [de]
	shr a, 0x02
	mov b, a
	mov a, [de]
	shr a, 0x03
	mov x, a
	mov a, b
	or x, a
	mov a, c
	shr a, 0x01
	and a, #0x01
	xor a, #0x01
	and a, x
	mov b, a
	mov a, [de]
	mov1 CY, a.2
	oneb a
	subc a, #0x00
	mov x, a
	mov a, [de]
	mov1 CY, a.3
	clrb a
	addc a, #0x00
	and a, x
	or a, b
	shrw ax, 8+0x00000
	clrw bc
	cmpw ax, bc
	sknz
.BB@LABEL@20_1:	; return
	;***      527 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      528 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      529 : 		//TODO: Control OFF
	;***      530 : 	}
	;***      531 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 531
	ret
.BB@LABEL@20_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 528
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      532 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 532
	push hl
	;***      533 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 533
	mov x, 0xFFF00
	mov a, 0xFFF00
	shr a, 0x06
	or a, 0xFFF07
	mov b, a
	mov a, x
	shr a, 0x05
	and a, #0x01
	xor a, #0x01
	mov x, a
	mov a, b
	and x, a
	mov a, x
	mov [sp+0x00], a
	mov a, 0xFFF00
	mov1 CY, a.6
	oneb a
	subc a, #0x00
	mov x, a
	mov a, 0xFFF07
	mov1 CY, a.0
	clrb a
	addc a, #0x00
	and a, x
	mov x, a
	mov a, [sp+0x00]
	or a, x
	shrw ax, 8+0x00000
	clrw bc
	pop hl
	cmpw ax, bc
	sknz
.BB@LABEL@21_1:	; return
	;***      534 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      535 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      536 : 		//TODO: Control OFF
	;***      537 : 	}
	;***      538 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 538
	ret
.BB@LABEL@21_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 535
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      539 : 
	;***      540 : //void OpenSV1(void){
	;***      541 : //	O_SUPPLY_WATER_PIN = ON;
	;***      542 : //}
	;***      543 : //void CloseSV1(void){
	;***      544 : //	O_SUPPLY_WATER_PIN = OFF;
	;***      545 : //}
	;***      546 : //void OpenSV2(void){
	;***      547 : //	O_SPOUT_WATER_PIN = ON;
	;***      548 : //}
	;***      549 : //void CloseSV2(void){
	;***      550 : //	O_SPOUT_WATER_PIN = OFF;
	;***      551 : //}
	;***      552 : uint8_t FilterReplacementCheck(void) {
	;***      553 : 
	;***      554 : 	return 0;
	;***      555 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 555
	clrb a
	ret
_ElectrolyzeWaterGeneration:
	.STACK _ElectrolyzeWaterGeneration = 4
	;***      556 : void ElectrolyzeWaterGeneration(void) {
	;***      557 : 	if ((I_ACID_L_PIN == I_OFF) | (I_ALKALI_L_PIN = I_OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 557
	mov a, 0xFFF07
	set1 0xFFF00.5
	shr a, 0x01
	mov x, a
	mov a, 0xFFF00
	shr a, 0x05
	or a, x
	bt a.0, $.BB@LABEL@23_4
.BB@LABEL@23_1:	; if_else_bb
	movw hl, #0xFF07
	;***      558 : 		g_machine_state.mode = ELECTROLYTIC_GENERATION;
	;***      559 : 		electrolyticOperationON();
	;***      560 : 	} else if ((I_ACID_H_PIN = I_ON) & (I_ALKALI_H_PIN = I_ON)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 560
	clr1 [hl].3
	mov a, [hl]
	clr1 [hl].0
	shr a, 0x03
	and a, [hl]
	bt a.0, $.BB@LABEL@23_3
.BB@LABEL@23_2:	; return
	;***      561 : 		g_machine_state.mode = pre_machine_mode;
	;***      562 : 		electrolyticOperationOFF();
	;***      563 : 	}
	;***      564 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 564
	ret
.BB@LABEL@23_3:	; if_then_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 561
	mov a, !LOWW(_pre_machine_mode@3)
	mov !LOWW(_g_machine_state+0x00007), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 562
	br $!_electrolyticOperationOFF
.BB@LABEL@23_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 558
	mov !LOWW(_g_machine_state+0x00007), #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 559
	br $!_electrolyticOperationON
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      565 : /**
	;***      566 :  * Tested: 10/12/2021 by Mr.An
	;***      567 :  */
	;***      568 : void WaterWashingMode_nostop(void) {
	;***      569 : 	uint8_t *state = &g_machine_state.water;
	;***      570 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      571 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 571
	mov a, !LOWW(_g_machine_state+0x00002)
	cmp0 a
	bz $.BB@LABEL@24_3
.BB@LABEL@24_1:	; entry
	dec a
	bz $.BB@LABEL@24_4
.BB@LABEL@24_2:	; switch_clause_bb20
	;***      572 : 	case 0:
	;***      573 : 		g_machine_state.mode = WATER_WASHING;
	;***      574 : 		O_SPOUT_WATER_PIN = ON;
	;***      575 : 		g_color = WHITE;
	;***      576 : 		*tick = g_systemTime;
	;***      577 : 		(*state)++;
	;***      578 : 		break;
	;***      579 : 	case 1:
	;***      580 : 		if (DETECT_U == I_ON) {
	;***      581 : 			O_SPOUT_WATER_PIN = OFF;
	;***      582 : 			g_color = BLACK;
	;***      583 : 			(*state)++;
	;***      584 : 			g_machine_state.mode = BUSY;
	;***      585 : 		}
	;***      586 : 		break;
	;***      587 : 	default:
	;***      588 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 588
	clrb !LOWW(_g_machine_state+0x00002)
	br $.BB@LABEL@24_6
.BB@LABEL@24_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 573
	mov !LOWW(_g_machine_state+0x00007), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 574
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 575
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 576
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 577
	inc !LOWW(_g_machine_state+0x00002)
	br $.BB@LABEL@24_6
.BB@LABEL@24_4:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 580
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@24_6
.BB@LABEL@24_5:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 581
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 582
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 583
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 584
	mov !LOWW(_g_machine_state+0x00007), #0x07
.BB@LABEL@24_6:	; switch_break_bb
	;***      589 : 		break;
	;***      590 : 	}
	;***      591 : 	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 591
	mov a, !LOWW(_g_color)
	br $!_handSensorLED
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***      592 : }
	;***      593 : /**
	;***      594 :  * Tested: 10/12/2021 by Mr.An
	;***      595 :  */
	;***      596 : void HandWashingMode_nostop(void) {
	;***      597 : 	uint8_t *state = &g_machine_state.handwash;
	;***      598 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      599 : 	const uint32_t delayPump_ms = 50;
	;***      600 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 600
	mov a, !LOWW(_g_machine_state+0x00003)
	cmp0 a
	bz $.BB@LABEL@25_9
.BB@LABEL@25_1:	; entry
	dec a
	bz $.BB@LABEL@25_10
.BB@LABEL@25_2:	; entry
	dec a
	bz $.BB@LABEL@25_13
.BB@LABEL@25_3:	; entry
	dec a
	.bz $!.BB@LABEL@25_17
.BB@LABEL@25_4:	; entry
	dec a
	.bz $!.BB@LABEL@25_21
.BB@LABEL@25_5:	; entry
	dec a
	.bz $!.BB@LABEL@25_27
.BB@LABEL@25_6:	; entry
	dec a
	.bz $!.BB@LABEL@25_32
.BB@LABEL@25_7:	; entry
	dec a
	.bz $!.BB@LABEL@25_35
.BB@LABEL@25_8:	; switch_clause_bb99
	;***      601 : 	case 0:
	;***      602 : //			*state = DETECT_U == I_ON?1:0;
	;***      603 : 		*state = 1;
	;***      604 : 		*tick = g_systemTime;
	;***      605 : 		break;
	;***      606 : 	case 1:
	;***      607 : 		g_machine_state.mode = HAND_WASHING;
	;***      608 : 		O_SPOUT_ALK_PIN = ON;
	;***      609 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      610 : 			O_PUMP_ALK_PIN = ON;
	;***      611 : 			handSensorLED(BLUE);
	;***      612 : 			(*state)++;
	;***      613 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      614 : 		}
	;***      615 : 		break;
	;***      616 : 	case 2:
	;***      617 : 		if (ns_delay_ms(tick,
	;***      618 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      619 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      620 : 			O_PUMP_ALK_PIN = OFF;
	;***      621 : 			O_SPOUT_ACID_PIN = ON;
	;***      622 : 			(*state)++;
	;***      623 : 		}
	;***      624 : 		break;
	;***      625 : 	case 3:
	;***      626 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      627 : 			O_PUMP_ACID_PIN = ON;
	;***      628 : 			handSensorLED(RED);
	;***      629 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      630 : 			(*state)++;
	;***      631 : 		}
	;***      632 : 		break;
	;***      633 : 	case 4:
	;***      634 : 		if (ns_delay_ms(tick,
	;***      635 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      636 : 			O_SPOUT_ALK_PIN = OFF;
	;***      637 : 			(*state)++;
	;***      638 : 		}
	;***      639 : 		break;
	;***      640 : 	case 5:
	;***      641 : 		if (ns_delay_ms(tick,
	;***      642 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      643 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      644 : 			O_PUMP_ACID_PIN = OFF;
	;***      645 : 			handSensorLED(WHITE);
	;***      646 : 			O_SPOUT_WATER_PIN = ON;
	;***      647 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      648 : 			(*state)++;
	;***      649 : 		}
	;***      650 : 		break;
	;***      651 : 	case 6:
	;***      652 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      653 : 			O_SPOUT_ACID_PIN = OFF;
	;***      654 : 			(*state)++;
	;***      655 : 		}
	;***      656 : 		break;
	;***      657 : 	case 7:
	;***      658 : 		if (ns_delay_ms(tick,
	;***      659 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      660 : 			O_SPOUT_WATER_PIN = OFF;
	;***      661 : 			handSensorLED(BLACK);
	;***      662 : 			(*state)++;
	;***      663 : 			g_machine_state.mode = BUSY;
	;***      664 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      665 : 		}
	;***      666 : 		break;
	;***      667 : 	default:
	;***      668 : 		g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 668
	clrb !LOWW(_g_machine_state+0x00006)
	;***      669 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 669
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@25_9:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 603
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 604
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0001C), ax
	ret
.BB@LABEL@25_10:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 607
	oneb !LOWW(_g_machine_state+0x00007)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 608
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 609
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@25_18
.BB@LABEL@25_11:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 610
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 611
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 612
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@25_12:	; if_then_bb
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi
.BB@LABEL@25_13:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 617
	movw ax, !LOWW(_g_timerSetting+0x00024)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x00026)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x00030)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@25_14:	; switch_clause_bb18
	decw ax
.BB@LABEL@25_15:	; switch_clause_bb18
	subw ax, !LOWW(_g_timerSetting+0x00032)
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@25_24
.BB@LABEL@25_16:	; if_then_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 620
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 621
	set1 0xFFF07.6
	br $.BB@LABEL@25_26
.BB@LABEL@25_17:	; switch_clause_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 626
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@25_18:	; switch_clause_bb33
	bz $.BB@LABEL@25_30
.BB@LABEL@25_19:	; if_then_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 627
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 628
	oneb a
	call $!_handSensorLED
.BB@LABEL@25_20:	; if_then_bb40
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	br $.BB@LABEL@25_26
.BB@LABEL@25_21:	; switch_clause_bb45
	movw ax, #0xFFCE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 634
	addw ax, !LOWW(_g_timerSetting+0x00030)
	movw bc, ax
	clrw ax
	decw ax
	sknc
.BB@LABEL@25_22:	; switch_clause_bb45
	incw ax
.BB@LABEL@25_23:	; switch_clause_bb45
	addw ax, !LOWW(_g_timerSetting+0x00032)
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@25_24:	; switch_clause_bb45
	bz $.BB@LABEL@25_33
.BB@LABEL@25_25:	; if_then_bb54
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 636
	clr1 0xFFF07.7
.BB@LABEL@25_26:	; if_then_bb54
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 673
	ret
.BB@LABEL@25_27:	; switch_clause_bb59
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 641
	movw ax, !LOWW(_g_timerSetting+0x00028)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0002A)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x00030)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@25_28:	; switch_clause_bb59
	decw ax
.BB@LABEL@25_29:	; switch_clause_bb59
	subw ax, !LOWW(_g_timerSetting+0x00032)
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@25_30:	; switch_clause_bb59
	bz $.BB@LABEL@25_37
.BB@LABEL@25_31:	; if_then_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 644
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 645
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 646
	set1 0xFFF05.5
	br $.BB@LABEL@25_20
.BB@LABEL@25_32:	; switch_clause_bb74
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 652
	movw bc, !LOWW(_g_timerSetting+0x00030)
	movw de, !LOWW(_g_timerSetting+0x00032)
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@25_33:	; switch_clause_bb74
	bz $.BB@LABEL@25_37
.BB@LABEL@25_34:	; if_then_bb81
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 653
	clr1 0xFFF07.6
	br $.BB@LABEL@25_26
.BB@LABEL@25_35:	; switch_clause_bb86
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 658
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
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@25_37
.BB@LABEL@25_36:	; if_then_bb94
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 660
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 661
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 662
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 663
	mov !LOWW(_g_machine_state+0x00007), #0x07
	br $!.BB@LABEL@25_12
.BB@LABEL@25_37:	; return
	;***      670 : 		break;
	;***      671 : 	}
	;***      672 : 
	;***      673 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 673
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      674 : /**
	;***      675 :  * Tested: 10/12/2021 by Mr.An
	;***      676 :  */
	;***      677 : void AcidWaterMode_nostop(void) {
	;***      678 : 	uint8_t *state = &g_machine_state.acid;
	;***      679 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      680 : 	const uint32_t delayPump_ms = 50;
	;***      681 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 681
	mov a, !LOWW(_g_machine_state+0x00001)
	cmp0 a
	bz $.BB@LABEL@26_5
.BB@LABEL@26_1:	; entry
	dec a
	bz $.BB@LABEL@26_8
.BB@LABEL@26_2:	; entry
	dec a
	bz $.BB@LABEL@26_10
.BB@LABEL@26_3:	; entry
	dec a
	bz $.BB@LABEL@26_13
.BB@LABEL@26_4:	; switch_clause_bb62
	;***      682 : 	case 0:
	;***      683 : 		*state = DETECT_U == I_ON ? 1 : 0;
	;***      684 : 		*tick = g_systemTime;
	;***      685 : 		break;
	;***      686 : 	case 1:
	;***      687 : 		O_SPOUT_ACID_PIN = ON;
	;***      688 : 		g_color = RED;
	;***      689 : 		handSensorLED(g_color);
	;***      690 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      691 : 			O_PUMP_ACID_PIN = ON;
	;***      692 : 			(*state)++;
	;***      693 : 		}
	;***      694 : 		break;
	;***      695 : 	case 2:
	;***      696 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      697 : 				| (DETECT_D == I_ON)) {
	;***      698 : 			O_PUMP_ACID_PIN = OFF;
	;***      699 : 			(*state)++;
	;***      700 : 		}
	;***      701 : 		break;
	;***      702 : 	case 3:
	;***      703 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      704 : 			O_SPOUT_ACID_PIN = OFF;
	;***      705 : 			g_color = BLACK;
	;***      706 : 			handSensorLED(g_color);
	;***      707 : 			(*state)++;
	;***      708 : 		}
	;***      709 : 		break;
	;***      710 : 	default:
	;***      711 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 711
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@26_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 683
	mov a, 0xFFF07
	mov1 CY, a.5
	oneb a
	sknc
.BB@LABEL@26_6:	; bb13
	clrb a
.BB@LABEL@26_7:	; bb14
	mov !LOWW(_g_machine_state+0x00001), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 684
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00014), ax
	ret
.BB@LABEL@26_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 687
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 688
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 689
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 690
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@26_15
.BB@LABEL@26_9:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 691
	set1 0xFFF06.2
	br $.BB@LABEL@26_12
.BB@LABEL@26_10:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 696
	movw ax, !LOWW(_g_timerSetting+0x00034)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00036)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	movw bc, ax
	mov a, 0xFFF07
	shr a, 0x04
	and a, #0x01
	xor a, #0x01
	shrw ax, 8+0x00000
	or a, b
	xch a, x
	or a, c
	xch a, x
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@26_15
.BB@LABEL@26_11:	; if_then_bb45
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 698
	clr1 0xFFF06.2
.BB@LABEL@26_12:	; if_then_bb45
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 714
	ret
.BB@LABEL@26_13:	; switch_clause_bb50
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 703
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@26_15
.BB@LABEL@26_14:	; if_then_bb56
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 704
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 705
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 706
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@26_12
.BB@LABEL@26_15:	; return
	;***      712 : 		break;
	;***      713 : 	}
	;***      714 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 714
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      715 : /**
	;***      716 :  * Tested: 10/12/2021 by Mr.An
	;***      717 :  */
	;***      718 : void AlkalineWaterMode_nostop(void) {
	;***      719 : 	uint8_t *state = &g_machine_state.akaline;
	;***      720 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      721 : 	const uint32_t delayPump_ms = 50;
	;***      722 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 722
	mov a, !LOWW(_g_machine_state)
	cmp0 a
	bz $.BB@LABEL@27_5
.BB@LABEL@27_1:	; entry
	dec a
	bz $.BB@LABEL@27_8
.BB@LABEL@27_2:	; entry
	dec a
	bz $.BB@LABEL@27_10
.BB@LABEL@27_3:	; entry
	dec a
	bz $.BB@LABEL@27_13
.BB@LABEL@27_4:	; switch_clause_bb62
	;***      723 : 	case 0:
	;***      724 : 		*state = DETECT_U == I_ON ? 1 : 0;
	;***      725 : 		*tick = g_systemTime;
	;***      726 : 		break;
	;***      727 : 	case 1:
	;***      728 : 		O_SPOUT_ALK_PIN = ON;
	;***      729 : 		g_color = BLUE;
	;***      730 : 		handSensorLED(g_color);
	;***      731 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      732 : 			O_PUMP_ALK_PIN = ON;
	;***      733 : 			(*state)++;
	;***      734 : 		}
	;***      735 : 		break;
	;***      736 : 	case 2:
	;***      737 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***      738 : 				| (DETECT_D == I_ON)) {
	;***      739 : 			O_PUMP_ALK_PIN = OFF;
	;***      740 : 			(*state)++;
	;***      741 : 		}
	;***      742 : 		break;
	;***      743 : 	case 3:
	;***      744 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      745 : 			O_SPOUT_ALK_PIN = OFF;
	;***      746 : 			g_color = BLACK;
	;***      747 : 			handSensorLED(g_color);
	;***      748 : 			(*state)++;
	;***      749 : 		}
	;***      750 : 		break;
	;***      751 : 	default:
	;***      752 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 752
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@27_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 724
	mov a, 0xFFF07
	mov1 CY, a.5
	oneb a
	sknc
.BB@LABEL@27_6:	; bb13
	clrb a
.BB@LABEL@27_7:	; bb14
	mov !LOWW(_g_machine_state), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 725
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00010), ax
	ret
.BB@LABEL@27_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 728
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 729
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 730
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 731
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_15
.BB@LABEL@27_9:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 732
	set1 0xFFF06.1
	br $.BB@LABEL@27_12
.BB@LABEL@27_10:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 737
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
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	movw bc, ax
	mov a, 0xFFF07
	shr a, 0x04
	and a, #0x01
	xor a, #0x01
	shrw ax, 8+0x00000
	or a, b
	xch a, x
	or a, c
	xch a, x
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_15
.BB@LABEL@27_11:	; if_then_bb45
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 739
	clr1 0xFFF06.1
.BB@LABEL@27_12:	; if_then_bb45
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 755
	ret
.BB@LABEL@27_13:	; switch_clause_bb50
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 744
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_15
.BB@LABEL@27_14:	; if_then_bb56
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 745
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 746
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 747
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@27_12
.BB@LABEL@27_15:	; return
	;***      753 : 		break;
	;***      754 : 	}
	;***      755 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 755
	ret
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***      756 : 
	;***      757 : void CallanCleaningMode_nostop(void) {
	;***      758 : 	if ((g_TickKeeper.SV1_OFF_minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 758
	movw de, !LOWW(_g_timerSetting+0x0003E)
	movw bc, !LOWW(_g_timerSetting+0x0003C)
	movw ax, !LOWW(_g_TickKeeper@2+0x0000E)
	cmpw ax, de
	movw ax, !LOWW(_g_TickKeeper@2+0x0000C)
	sknz
.BB@LABEL@28_1:	; entry
	cmpw ax, bc
.BB@LABEL@28_2:	; entry
	movw hl, !LOWW(_g_TickKeeper@2+0x00004)
	movw ax, !LOWW(_g_TickKeeper@2+0x00006)
	bc $.BB@LABEL@28_7
.BB@LABEL@28_3:	; entry
	cmpw ax, de
	movw ax, hl
	sknz
.BB@LABEL@28_4:	; entry
	cmpw ax, bc
.BB@LABEL@28_5:	; entry
	bc $.BB@LABEL@28_7
.BB@LABEL@28_6:	; if_then_bb
	;***      759 : 			>= g_timerSetting.t61_curranCleaningIntervalTime_h)
	;***      760 : 			& (g_TickKeeper.SV2_OFF_minutes
	;***      761 : 					>= g_timerSetting.t61_curranCleaningIntervalTime_h)) {
	;***      762 : 		g_callan_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 762
	oneb !LOWW(_g_callan_clear_flag@6)
	;***      763 : 		g_Tick.tickCustom[6] = g_Tick.tickCustom[7] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 763
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00066), ax
	movw !LOWW(_g_Tick@1+0x00062), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00064), ax
	movw !LOWW(_g_Tick@1+0x00060), ax
	;***      764 : 		O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 764
	set1 0xFFF05.5
.BB@LABEL@28_7:	; if_break_bb
	;***      765 : 	}
	;***      766 : 	if (g_callan_clear_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 766
	cmp0 !LOWW(_g_callan_clear_flag@6)
	bz $.BB@LABEL@28_14
.BB@LABEL@28_8:	; if_then_bb18
	;***      767 : 		if (ns_delay_ms(&g_Tick.tickCustom[6], 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 767
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick@1+0x00060)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@28_12
.BB@LABEL@28_9:	; if_then_bb23
	;***      768 : 			g_color = g_color == WHITE ? BLACK : WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 768
	cmp !LOWW(_g_color), #0x02
	clrb a
	skz
.BB@LABEL@28_10:	; bb28
	mov a, #0x02
.BB@LABEL@28_11:	; bb29
	mov !LOWW(_g_color), a
	;***      769 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 769
	call $!_handSensorLED
.BB@LABEL@28_12:	; if_break_bb34
	;***      770 : 		}
	;***      771 : 		if (ns_delay_ms(&g_Tick.tickCustom[7],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 771
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
	movw ax, #LOWW(_g_Tick@1+0x00064)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@28_14
.BB@LABEL@28_13:	; if_then_bb41
	;***      772 : 				g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***      773 : 			g_callan_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 773
	clrb !LOWW(_g_callan_clear_flag@6)
	;***      774 : 			O_SPOUT_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 774
	clr1 0xFFF05.5
	;***      775 : 			g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 775
	clrb !LOWW(_g_color)
	;***      776 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 776
	clrb a
	br $!_handSensorLED
.BB@LABEL@28_14:	; return
	;***      777 : 		}
	;***      778 : 	}
	;***      779 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 779
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***      780 : // Newest
	;***      781 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 781
	subw sp, #0x0A
	;***      782 : 
	;***      783 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 783
	call $!_UpdateMachineStatus
	;***      784 : 	InitialOperationModeStart(); //Worked!!;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 784
	call $!_InitialOperationModeStart
	;***      785 : 
	;***      786 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 786
	call $!_UpdateMachineStatus
.BB@LABEL@29_1:	; bb1
	;***      787 : 	while (nostop_WaterSupplyOperation()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 787
	call $!_nostop_WaterSupplyOperation
	cmp0 a
	bnz $.BB@LABEL@29_1
.BB@LABEL@29_2:	; bb5
	;***      788 : //		if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	;***      789 : //			P6_bit.no3 = ~P6_bit.no3;
	;***      790 : //		}
	;***      791 : 	}
	;***      792 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 792
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x00006)
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
	call !!__COM_fge
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@29_3:	; bb5
	clrb a
.BB@LABEL@29_4:	; bb5
	cmp0 x
	oneb x
	sknz
.BB@LABEL@29_5:	; bb5
	clrb x
.BB@LABEL@29_6:	; bb5
	or x, a
	bnz $.BB@LABEL@29_8
.BB@LABEL@29_7:	; if_then_bb
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	;***      793 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, g_io_status.refined.FlowValue);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 793
	movw ax, #0x4104
	call $!_sendToRasPi
.BB@LABEL@29_8:	; if_break_bb
	;***      794 : 	}
	;***      795 : 
	;***      796 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 796
	call $!_UpdateMachineStatus
	;***      797 : 	ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 797
	call $!_ElectrolyticOperation
	;***      798 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 798
	addw sp, #0x0A
	br $!_UpdateMachineStatus
_main_loop_20211111:
	.STACK _main_loop_20211111 = 4
	;***      799 : 
	;***      800 : }
	;***      801 : void main_loop_20211111(void) {
	;***      802 : 	ElectrolyzeWaterGeneration();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 802
	br $!_ElectrolyzeWaterGeneration
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      803 : 
	;***      804 : //	WaterWashingMode_nostop();
	;***      805 : 
	;***      806 : }
	;***      807 : 
	;***      808 : /**
	;***      809 :  * 30/11/2021: Checked by An
	;***      810 :  */
	;***      811 : void electrolyticOperationON(void) {
	;***      812 : 	//Electrolytic operation ON
	;***      813 : 	O_SUPPLY_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 813
	set1 0xFFF01.7
	;***      814 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 814
	set1 0xFFF0E.2
	;***      815 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 815
	set1 0xFFF06.0
	;***      816 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 816
	oneb !LOWW(_g_electrolytic_flag)
	;***      817 : 	g_TickKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 817
	movw bc, !LOWW(_g_TickKeeper@2+0x00012)
	movw ax, !LOWW(_g_TickKeeper@2+0x00010)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@31_3
.BB@LABEL@31_1:	; entry
	bc $.BB@LABEL@31_3
.BB@LABEL@31_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@31_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TickKeeper@2+0x00010), ax
	movw ax, bc
	movw !LOWW(_g_TickKeeper@2+0x00012), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 821
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      818 : 			g_TickKeeper.neutralization == 0 ?
	;***      819 : 					g_systemTime : g_TickKeeper.neutralization;
	;***      820 : 	//TODO: Add Neutralization timer ON
	;***      821 : }
	;***      822 : /**
	;***      823 :  * 30/11/2021: Checked by An, missing Neutralization timer OFF
	;***      824 :  */
	;***      825 : void electrolyticOperationOFF(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 825
	clrw ax
	;***      826 : 	//TODO: Add Neutralization timer OFF
	;***      827 : 	g_TickKeeper.neutralization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 827
	movw !LOWW(_g_TickKeeper@2+0x00012), ax
	movw !LOWW(_g_TickKeeper@2+0x00010), ax
	;***      828 : 	//Electrolytic operation OFF
	;***      829 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 829
	clr1 0xFFF0E.2
	;***      830 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 830
	clr1 0xFFF06.0
	;***      831 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 831
	mov a, #0x05
	call !!_delay
	;***      832 : 	O_SUPPLY_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 832
	clr1 0xFFF01.7
	;***      833 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 833
	clrb !LOWW(_g_electrolytic_flag)
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 18
	;***      834 : }
	;***      835 : 
	;***      836 : float measureFlowSensor(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 836
	subw sp, #0x0A
	;***      837 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 837
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
.BB@LABEL@33_1:	; bb26
	;***      838 : 	float flow_pluse = 0.0;
	;***      839 : 	uint8_t flow_pulse_state = I_OFF;
	;***      840 : 	while (!ns_delay_ms(&stamp_flow_sensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 840
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00006)
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
	bnz $.BB@LABEL@33_7
.BB@LABEL@33_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      841 : 			g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***      842 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 842
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@33_6
.BB@LABEL@33_3:	; if_then_bb
	;***      843 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 843
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@33_5
.BB@LABEL@33_4:	; if_then_bb19
	movw ax, #0x3F80
	;***      844 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 844
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
.BB@LABEL@33_5:	; if_break_bb
	;***      845 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 845
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@33_6:	; if_break_bb25
	;***      846 : 		}
	;***      847 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 847
	call !!_R_WDT_Restart
	br $.BB@LABEL@33_1
.BB@LABEL@33_7:	; bb38
	movw ax, #0x3F33
	;***      848 : 	}
	;***      849 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 849
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
	movw bc, !LOWW(_g_timerSetting+0x00006)
	movw ax, !LOWW(_g_timerSetting+0x00004)
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
	;***      850 : 			/ g_timerSetting.t3_flowSensorMonitorTime_s; // L/minutes
	;***      851 : 	return g_io_status.refined.FlowValue;
	;***      852 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 852
	movw bc, ax
	movw ax, de
	addw sp, #0x0A
	ret
_nostop_measureFlowSensor:
	.STACK _nostop_measureFlowSensor = 12
	;***      853 : 
	;***      854 : uint8_t _pre_flow_state = I_OFF;
	;***      855 : float _flow_pulse;
	;***      856 : float nostop_measureFlowSensor(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 856
	subw sp, #0x04
	;***      857 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***      858 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***      859 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 859
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@34_4
.BB@LABEL@34_1:	; entry
	dec a
	bz $.BB@LABEL@34_5
.BB@LABEL@34_2:	; entry
	dec a
	bz $.BB@LABEL@34_12
.BB@LABEL@34_3:	; switch_clause_bb60
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@34_11
.BB@LABEL@34_4:	; switch_clause_bb
	;***      860 : 	case 0:
	;***      861 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 861
	movw bc, !LOWW(_g_timerSetting)
	movw de, !LOWW(_g_timerSetting+0x00002)
	br $.BB@LABEL@34_9
.BB@LABEL@34_5:	; switch_clause_bb13
	;***      862 : 			(*state)++;
	;***      863 : 		}
	;***      864 : 		break;
	;***      865 : 	case 1:
	;***      866 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 866
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@34_8
.BB@LABEL@34_6:	; if_then_bb23
	;***      867 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 867
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***      868 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 868
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@34_8
.BB@LABEL@34_7:	; if_then_bb34
	movw ax, #0x3F80
	;***      869 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 869
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
.BB@LABEL@34_8:	; if_break_bb38
	;***      870 : 			}
	;***      871 : 		}
	;***      872 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 872
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00006)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
.BB@LABEL@34_9:	; if_break_bb38
	movw ax, #LOWW(_g_Tick@1+0x00024)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@34_10:	; if_then_bb46
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@34_11:	; switch_break_bb
	;***      873 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***      874 : 			(*state)++;
	;***      875 : 		}
	;***      876 : 		break;
	;***      877 : 	case 2:
	;***      878 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***      879 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***      880 : 		_flow_pulse = 0;
	;***      881 : 		(*state) = 0;
	;***      882 : 		break;
	;***      883 : 	default:
	;***      884 : 		(*state) = 0;
	;***      885 : 		break;
	;***      886 : 	}
	;***      887 : 	return g_io_status.refined.FlowValue;
	;***      888 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 888
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@34_12:	; switch_clause_bb51
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 878
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
	movw bc, !LOWW(_g_timerSetting+0x00006)
	movw ax, !LOWW(_g_timerSetting+0x00004)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 880
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@34_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***      889 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 889
	push hl
	;***      890 : 	if(g_machine_state.mode != ELECTROLYTIC_GENERATION)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 890
	mov a, !LOWW(_g_machine_state+0x00007)
	cmp a, #0x08
	skz
.BB@LABEL@35_1:	; if_then_bb
	;***      891 : 		pre_machine_mode = g_machine_state.mode;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 891
	mov !LOWW(_pre_machine_mode@3), a
.BB@LABEL@35_2:	; if_break_bb
	;***      892 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 892
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@35_4
.BB@LABEL@35_3:	; bb11
	clrb x
.BB@LABEL@35_4:	; bb12
	;***      893 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 893
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@35_6
.BB@LABEL@35_5:	; bb28
	clrb c
.BB@LABEL@35_6:	; bb30
	;***      894 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 894
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@35_8
.BB@LABEL@35_7:	; bb46
	clrb b
.BB@LABEL@35_8:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***      895 : 
	;***      896 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 896
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@35_10
.BB@LABEL@35_9:	; bb64
	clrb x
.BB@LABEL@35_10:	; bb66
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***      897 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 897
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@35_12
.BB@LABEL@35_11:	; bb82
	clrb b
.BB@LABEL@35_12:	; bb84
	mov a, c
	or a, x
	mov c, a
	;***      898 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 898
	mov a, 0xFFF07
	mov x, #0x04
	bf a.0, $.BB@LABEL@35_14
.BB@LABEL@35_13:	; bb100
	clrb x
.BB@LABEL@35_14:	; bb102
	mov a, c
	or a, b
	mov c, a
	;***      899 : 
	;***      900 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 900
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@35_16
.BB@LABEL@35_15:	; bb118
	clrb b
.BB@LABEL@35_16:	; bb120
	mov a, c
	or a, x
	mov c, a
	;***      901 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 901
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@35_18
.BB@LABEL@35_17:	; bb136
	clrb x
.BB@LABEL@35_18:	; bb138
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***      902 : 
	;***      903 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 903
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***      904 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 904
	mov x, 0xFFF05
	;***      905 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 905
	mov c, 0xFFF07
	;***      906 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 906
	mov a, 0xFFF07
	mov h, a
	;***      907 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 907
	mov a, [de]
	mov l, a
	;***      908 : 	O_DRAIN_ACID_PIN;
	;***      909 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 909
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 903
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 904
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 905
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 906
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 907
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***      910 : 	O_DRAIN_ALK_PIN;
	;***      911 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 911
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 907
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 911
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 909
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 911
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***      912 : 
	;***      913 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 913
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***      914 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 914
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***      915 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 915
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***      916 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_Tick@1:
	.DS (104)
	.ALIGN 2
_g_TickKeeper@2:
	.DS (20)
_pre_machine_mode@3:
	.DS (1)
	.ALIGN 2
__settingTime@4:
	.DS (98)
	.ALIGN 2
__settingNumber@5:
	.DS (38)
_g_callan_clear_flag@6:
	.DS (1)
	.ALIGN 2
_g_numberSetting:
	.DS (38)
_g_color:
	.DS (1)
_g_pre_color:
	.DS (1)
	.ALIGN 2
_g_flow_value:
	.DS (4)
_g_alarm:
	.DS (2)
_g_machine_state:
	.DS (8)
	.ALIGN 2
_g_io_status:
	.DS (18)
	.ALIGN 2
_g_pre_io_status:
	.DS (18)
	.ALIGN 2
__flow_pulse:
	.DS (4)
	.SECTION .data,DATA
	.ALIGN 2
_g_timerSetting:
	.DB4 0x000003E8
	.DB4 0x0000000F
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (1)
	.DS (1)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
_g_electrolytic_flag:
	.DS (1)
__pre_flow_state:
	.DB 0x01
	.SECTION .const,CONST
_io_statusSize:
	.DB 0x05
_timeSettingSize:
	.DB 0x45
_numberSettingSize:
	.DB 0x21
