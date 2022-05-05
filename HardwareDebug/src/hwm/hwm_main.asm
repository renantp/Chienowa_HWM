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
#@   -o src/hwm/hwm_main.obj
#@   ../src/hwm/hwm_main.c
#@  compiled at Thu May 05 10:01:47 2022

	.EXTERN _g_commnunication_flag
	.EXTERN _g_systemTime
	.EXTERN _g_uart3_sendend
	.EXTERN _g_alarm
	.EXTERN _g_test_control
	.PUBLIC _g_timerSetting
	.PUBLIC _g_numberSetting
	.PUBLIC _g_neutralization_time_s
	.PUBLIC _g_color
	.PUBLIC _g_pre_color
	.PUBLIC _g_flow_value
	.PUBLIC _g_machine_state
	.PUBLIC _g_io_status
	.PUBLIC _g_mean_io_status
	.PUBLIC _g_res_io_status
	.PUBLIC __settingTime
	.PUBLIC __settingNumber
	.PUBLIC _g_machine_mode
	.PUBLIC _g_machine_test_mode
	.PUBLIC _btod
	.PUBLIC _g_Tick
	.PUBLIC _water_solfner_buf
	.PUBLIC _setting_default
	.PUBLIC _sendRS485
	.EXTERN _R_UART3_Send
	.PUBLIC _sendR485_7byte
	.PUBLIC _isThisCommand
	.PUBLIC _DrainageAcidAndAlkalineTankStart_nostop
	.PUBLIC _WaterSupplyStart_nostop
	.EXTERN _ns_delay_ms
	.EXTERN _measureFlowSensor_nostop
	.EXTERN _measureFlowSensor
	.EXTERN _FlowSensorCheck_nonstop
	.PUBLIC _ElectrolyticOperation_nostop
	.EXTERN _electrolyticOperationON
	.EXTERN _Voltage2Check_nostop
	.EXTERN _Voltage1Check_waitReset
	.EXTERN _Voltage3Check_waitReset
	.EXTERN _LowVoltageCheck_waitReset
	.EXTERN _OverCurrentCheck_waitReset
	.EXTERN _sendToRasPi_f
	.EXTERN _waitAlarmConfirm_stop
	.EXTERN _isAcidTankFull
	.EXTERN _isAlkalineTankFull
	.PUBLIC _acidWaterTankSkipCheck
	.PUBLIC _alkalineWaterTankSkipCheck
	.PUBLIC _FilterReplacementCheck
	.PUBLIC _main_init_20211111
	.EXTERN _RaspberryCommunication_nostop
	.EXTERN _R_WDT_Restart
	.PUBLIC _userAuthHandler_nostop
	.EXTERN _sendToRasPi_u32
	.EXTERN _HandWashingMode_nostop
	.EXTERN _WaterWashingMode_nostop
	.EXTERN _AcidWaterMode_nostop
	.EXTERN _AlkalineWaterMode_nostop
	.PUBLIC _ElectrolyzeWaterGeneration_nostop
	.EXTERN _isAcidTankEmpty
	.EXTERN _isAlkalineTankEmpty_nonstop
	.EXTERN _levelSkipErrorCheck
	.EXTERN _handSensorLED
	.PUBLIC _isSV1andSV2Off8h
	.PUBLIC _CallanCleaningMode_nostop
	.EXTERN _handSensorLEDBlink
	.PUBLIC _DrainageMode_nostop
	.PUBLIC _NormalMode_nostop
	.PUBLIC _TestPowerOn_nostop_keepstate
	.PUBLIC _FlowRateAdjustmentMode_nostop_keepstate
	.PUBLIC _CurrentAdjustmentMode_nostop_keepstate
	.PUBLIC _ElectrolyteAdjustmentOperation
	.PUBLIC _TestOperation_nostop
	.PUBLIC _NeutralizationTreatment
	.PUBLIC _main_loop_20211111
	.PUBLIC _realTimeResponse
	.PUBLIC _UpdateMachineStatus
	.EXTERN _HandSensorLEDEndBlink
	.EXTERN _isElectrolyticOperationOFF_nostop
	.EXTERN _filterReplacementErrorCheck
	.PUBLIC _manufactureReset
	.EXTERN _EE_SPI_Write

	.SECTION .textf,TEXTF
_setting_default:
	.STACK _setting_default = 4
	;***        1 : /*
	;***        2 :  * main.c
	;***        3 :  *
	;***        4 :  *  Created on: 29 Oct 2021
	;***        5 :  *      Author: Renan
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "hwm_main.h"
	;***        9 : 
	;***       10 : #include <iodefine.h>
	;***       11 : 
	;***       12 : #define VCC (24.0)
	;***       13 : 
	;***       14 : struct Timer_Setting_s g_timerSetting = { 1000, 15 };
	;***       15 : struct Number_Setting_s g_numberSetting;
	;***       16 : uint32_t g_neutralization_time_s;
	;***       17 : enum HS_COLOR g_color, g_pre_color;
	;***       18 : float g_flow_value;
	;***       19 : struct Machine_State_u g_machine_state;
	;***       20 : union IO_Status_u g_io_status, g_mean_io_status, g_res_io_status;
	;***       21 : 
	;***       22 : struct Timer_Setting_s _settingTime;
	;***       23 : struct Number_Setting_s _settingNumber;
	;***       24 : 
	;***       25 : uint8_t g_machine_mode, g_machine_test_mode;
	;***       26 : union BytesToDouble {
	;***       27 : 	struct {
	;***       28 : 		uint8_t data[4];
	;***       29 : 	} refined;
	;***       30 : 	uint32_t raw;
	;***       31 : } btod;
	;***       32 : struct Tick_s g_Tick;
	;***       33 : 
	;***       34 : void setting_default(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 34
	movw ax, #0x4086
	;***       35 : 	g_numberSetting.upperVoltage1 = 4.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 35
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x6666
	movw !LOWW(_g_numberSetting), ax
	movw ax, #0x4060
	;***       36 : 	g_numberSetting.upperVoltage2 = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 36
	movw !LOWW(_g_numberSetting+0x00006), ax
	;***       37 : 	g_numberSetting.upperVoltage3 = 2.2;
	;***       38 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       39 : 	g_numberSetting.upperCurrent = 4.3;
	;***       40 : 	g_numberSetting.lowerCurrent = 0.2;
	;***       41 : 	g_numberSetting.upperFlow = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 41
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 36
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 38
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 41
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***       42 : 	g_numberSetting.lowerFlow = 0.4;
	;***       43 : 
	;***       44 : 	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 44
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       45 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 45
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       46 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 46
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       47 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 47
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       48 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 48
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***       49 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 49
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***       50 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 50
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***       51 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 51
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***       52 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 52
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***       53 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 53
	movw !LOWW(_g_timerSetting+0x0006A), ax
	;***       54 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 54
	movw !LOWW(_g_timerSetting+0x0006E), ax
	;***       55 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 55
	movw !LOWW(_g_timerSetting+0x00072), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 37
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 40
	movw !LOWW(_g_numberSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 42
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F00
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 38
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw ax, #0x4089
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 39
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 40
	movw !LOWW(_g_numberSetting+0x00016), ax
	mov x, #0xCC
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 42
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 44
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 45
	movw !LOWW(_g_timerSetting+0x00008), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 46
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 47
	movw !LOWW(_g_timerSetting+0x00028), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 48
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 51
	movw !LOWW(_g_timerSetting+0x00038), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 49
	movw !LOWW(_g_timerSetting+0x00030), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 50
	movw !LOWW(_g_timerSetting+0x00034), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 52
	movw !LOWW(_g_timerSetting+0x00040), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 53
	movw !LOWW(_g_timerSetting+0x00068), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 54
	movw !LOWW(_g_timerSetting+0x0006C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 55
	movw !LOWW(_g_timerSetting+0x00070), ax
	ret
_sendRS485:
	.STACK _sendRS485 = 6
	;***       56 : }
	;***       57 : 
	;***       58 : struct UART3_Buffer_s {
	;***       59 : 	uint8_t busy;
	;***       60 : 	uint8_t head; // 1 byte
	;***       61 : 	uint8_t set_number; // 1 byte
	;***       62 : 	uint8_t set_value[4]; // 4 byte
	;***       63 : } water_solfner_buf;
	;***       64 : void sendRS485(uint8_t busy, uint8_t head, uint8_t type, uint32_t value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 64
	push hl
	;***       65 : 	uint8_t state = g_uart3_sendend;
	;***       66 : 	btod.raw = value;
	;***       67 : 	water_solfner_buf.busy = busy;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 67
	mov !LOWW(_water_solfner_buf), a
	mov a, x
	;***       68 : 	water_solfner_buf.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 68
	mov !LOWW(_water_solfner_buf+0x00001), a
	mov a, c
	;***       69 : 	water_solfner_buf.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 69
	mov !LOWW(_water_solfner_buf+0x00002), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 65
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	movw ax, [sp+0x08]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 66
	movw !LOWW(_btod+0x00002), ax
	movw ax, [sp+0x06]
	movw !LOWW(_btod), ax
	clrb a
.BB@LABEL@2_1:	; bb
	mov b, a
	;***       70 : 	for (uint8_t i = 0; i < 4; i++) {
	;***       71 : 		water_solfner_buf.set_value[i] = btod.refined.data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 71
	mov a, LOWW(_btod)[b]
	mov LOWW(_water_solfner_buf+0x00003)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 70
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@2_1
.BB@LABEL@2_2:	; bb25
	;***       72 : 	}
	;***       73 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 73
	set1 0xFFF00.0
	;***       74 : 	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 74
	movw bc, #0x0007
	movw ax, #LOWW(_water_solfner_buf)
	call !!_R_UART3_Send
.BB@LABEL@2_3:	; bb28
	mov a, [sp+0x00]
	;***       75 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 75
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@2_3
.BB@LABEL@2_4:	; return
	;***       76 : 		;
	;***       77 : 
	;***       78 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 78
	pop hl
	ret
_sendR485_7byte:
	.STACK _sendR485_7byte = 16
	;***       79 : void sendR485_7byte(uint8_t addr, uint8_t head, uint8_t *val5) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 79
	subw sp, #0x0A
	mov h, a
	push bc
	pop de
	;***       80 : 	uint8_t buf[7] = { addr, head };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 80
	mov [sp+0x06], #0x00
	mov [sp+0x05], #0x00
	mov [sp+0x04], #0x00
	mov [sp+0x03], #0x00
	mov [sp+0x02], #0x00
	mov [sp+0x01], #0x00
	mov [sp+0x00], #0x00
	mov a, h
	mov [sp+0x00], a
	mov a, x
	mov [sp+0x01], a
	clrb b
	;***       81 : 	uint8_t state = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 81
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x07], a
.BB@LABEL@3_1:	; bb
	movw ax, sp
	movw [sp+0x08], ax
	mov a, b
	add a, #0x02
	mov c, a
	;***       82 : 	for (uint8_t i = 2; i < 7; i++) {
	;***       83 : 		buf[i] = val5[i - 2];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 83
	shrw ax, 8+0x00000
	addw ax, de
	decw ax
	decw ax
	movw hl, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 82
	inc b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 83
	mov a, [hl]
	mov h, a
	movw ax, [sp+0x08]
	xchw ax, hl
	mov [hl+c], a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 82
	cmp a, #0x05
	bnz $.BB@LABEL@3_1
.BB@LABEL@3_2:	; bb31
	;***       84 : 	}
	;***       85 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 85
	set1 0xFFF00.0
	;***       86 : 	R_UART3_Send(buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 86
	movw bc, #0x0007
	movw ax, sp
	call !!_R_UART3_Send
.BB@LABEL@3_3:	; bb35
	mov a, [sp+0x07]
	;***       87 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 87
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@3_3
.BB@LABEL@3_4:	; return
	;***       88 : 		;
	;***       89 : 
	;***       90 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 90
	addw sp, #0x0A
	ret
_isThisCommand:
	.STACK _isThisCommand = 6
	;***       91 : uint8_t isThisCommand(uint8_t *input_buf, enum UART_header_e header,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 91
	push hl
	movw hl, ax
	mov a, b
	mov [sp+0x00], a
	clrb a
	mov b, a
.BB@LABEL@4_1:	; bb
	;***       92 : 		enum Control_status control, uint32_t data) {
	;***       93 : 	for (uint8_t i = 0; i < 4; i++) {
	;***       94 : 		btod.refined.data[i] = input_buf[2 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 94
	shrw ax, 8+0x00000
	addw ax, hl
	incw ax
	incw ax
	movw de, ax
	mov a, [de]
	mov LOWW(_btod)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 93
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@4_1
.BB@LABEL@4_2:	; bb23
	mov a, c
	;***       95 : 	}
	;***       96 : 
	;***       97 : 	if ((input_buf[0] == header) && (input_buf[1] == control)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 97
	cmp a, [hl]
	bnz $.BB@LABEL@4_10
.BB@LABEL@4_3:	; bb32
	mov a, [sp+0x00]
	cmp a, [hl+0x01]
	bnz $.BB@LABEL@4_7
.BB@LABEL@4_4:	; bb47
	movw ax, [sp+0x08]
	cmpw ax, !LOWW(_btod+0x00002)
	movw ax, [sp+0x06]
	sknz
.BB@LABEL@4_5:	; bb47
	cmpw ax, !LOWW(_btod)
.BB@LABEL@4_6:	; bb47
	;***       98 : 			&& (btod.raw == data))
	;***       99 : 		return 2;
	;***      100 : 	else if ((input_buf[0] == header) && (input_buf[1] == control))
	;***      101 : 		return 1;
	;***      102 : 	else
	;***      103 : 		return 0;
	;***      104 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 104
	mov a, #0x02
	bz $.BB@LABEL@4_9
.BB@LABEL@4_7:	; bb70
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 100
	cmp a, [hl+0x01]
	oneb a
	skz
.BB@LABEL@4_8:	; bb70
	clrb a
.BB@LABEL@4_9:	; bb70
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 104
	ret
.BB@LABEL@4_10:	; if_else_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 103
	clrb a
	br $.BB@LABEL@4_9
_DrainageAcidAndAlkalineTankStart_nostop:
	.STACK _DrainageAcidAndAlkalineTankStart_nostop = 4
	;***      105 : 
	;***      106 : /**
	;***      107 :  * Drain Tank 1 and Tank 2 if there are any liquid left
	;***      108 :  * 13/12/2021: Checked!
	;***      109 :  * @return: 0 - Done; 1 - Not done
	;***      110 :  */
	;***      111 : uint8_t DrainageAcidAndAlkalineTankStart_nostop(void) {
	;***      112 : //	O_DRAIN_ACID_PIN_SV5 = isAcidTankEmpty() ? OFF : ON;
	;***      113 : //	O_DRAIN_ALK_PIN_SV6 = isAlkalineTankEmpty_nonstop() ? OFF : ON;
	;***      114 : //	return !(O_DRAIN_ACID_PIN_SV5 == OFF && O_DRAIN_ALK_PIN_SV6 == OFF);
	;***      115 : 	return 0;
	;***      116 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 116
	clrb a
	ret
_WaterSupplyStart_nostop:
	.STACK _WaterSupplyStart_nostop = 6
	;***      117 : 
	;***      118 : /*!
	;***      119 :  * Supply water to CVCC
	;***      120 :  * @return 0 - Done, 1 - Not done yet
	;***      121 :  */
	;***      122 : uint8_t WaterSupplyStart_nostop(void) {
	;***      123 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      124 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      125 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 125
	mov b, !LOWW(_g_machine_state+0x00004)
	cmp0 b
	bz $.BB@LABEL@6_9
.BB@LABEL@6_1:	; entry
	dec b
	bz $.BB@LABEL@6_10
.BB@LABEL@6_2:	; entry
	dec b
	bz $.BB@LABEL@6_12
.BB@LABEL@6_3:	; entry
	dec b
	.bz $!.BB@LABEL@6_14
.BB@LABEL@6_4:	; entry
	dec b
	.bz $!.BB@LABEL@6_18
.BB@LABEL@6_5:	; entry
	dec b
	.bz $!.BB@LABEL@6_19
.BB@LABEL@6_6:	; entry
	dec b
	bnz $.BB@LABEL@6_8
.BB@LABEL@6_7:	; switch_clause_bb61
	;***      126 : 	case 0:
	;***      127 : 		*tick = g_systemTime;
	;***      128 : 		(*state)++;
	;***      129 : 		break;
	;***      130 : 	case 1:
	;***      131 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      132 : 		if (ns_delay_ms(tick, 30000)) {
	;***      133 : 			(*state)++;
	;***      134 : 		}
	;***      135 : 		break;
	;***      136 : 	case 2:
	;***      137 : 		O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      138 : 		if (ns_delay_ms(tick, 500)) {
	;***      139 : 			(*state)++;
	;***      140 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      141 : 		}
	;***      142 : 		break;
	;***      143 : 	case 3:
	;***      144 : 		O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      145 : 		if (ns_delay_ms(tick, 15000)) {
	;***      146 : 			(*state)++;
	;***      147 : 			g_machine_state.flowSensor = 0;
	;***      148 : 		}
	;***      149 : 		measureFlowSensor_nostop();
	;***      150 : 		break;
	;***      151 : 	case 4:
	;***      152 : 		measureFlowSensor(&g_timerSetting.t3_flowSensorMonitorTime_s);
	;***      153 : 		(*state)++;
	;***      154 : 		break;
	;***      155 : 	case 5:
	;***      156 : 		if (FlowSensorCheck_nonstop())
	;***      157 : 			(*state) = 3;
	;***      158 : 		else
	;***      159 : 			(*state)++;
	;***      160 : 		g_Tick.tickWaterSupply = g_systemTime;
	;***      161 : 		break;
	;***      162 : 	case 6:
	;***      163 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 163
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
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_17
.BB@LABEL@6_8:	; if_then_bb68
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@6_17
.BB@LABEL@6_9:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 127
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 128
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@6_17
.BB@LABEL@6_10:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 131
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 132
	clrw ax
	movw de, ax
	movw bc, #0x7530
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_22
.BB@LABEL@6_11:	; if_then_bb
	inc !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@6_22
.BB@LABEL@6_12:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 137
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 138
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_22
.BB@LABEL@6_13:	; if_then_bb24
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 139
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 140
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00024), ax
	br $.BB@LABEL@6_22
.BB@LABEL@6_14:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 144
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 145
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_16
.BB@LABEL@6_15:	; if_then_bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 146
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 147
	clrb !LOWW(_g_machine_state+0x00005)
.BB@LABEL@6_16:	; if_break_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 149
	call !!_measureFlowSensor_nostop
.BB@LABEL@6_17:	; if_break_bb41
	br $.BB@LABEL@6_22
.BB@LABEL@6_18:	; switch_clause_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 152
	movw ax, #LOWW(_g_timerSetting+0x00008)
	call !!_measureFlowSensor
	br $.BB@LABEL@6_11
.BB@LABEL@6_19:	; switch_clause_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 156
	call !!_FlowSensorCheck_nonstop
	cmp0 a
	mov a, #0x03
	bnz $.BB@LABEL@6_21
.BB@LABEL@6_20:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 159
	mov a, !LOWW(_g_machine_state+0x00004)
	inc a
.BB@LABEL@6_21:	; if_break_bb59
	mov !LOWW(_g_machine_state+0x00004), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 160
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
.BB@LABEL@6_22:	; switch_break_bb
	;***      164 : 				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
	;***      165 : 			(*state) = 0;
	;***      166 : 		}
	;***      167 : 		break;
	;***      168 : 	default:
	;***      169 : 		(*state) = 0;
	;***      170 : 		break;
	;***      171 : 	}
	;***      172 : 	realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 172
	call $!_realTimeResponse
	;***      173 : 	return (*state) == 0 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 173
	cmp0 !LOWW(_g_machine_state+0x00004)
	oneb a
	sknz
.BB@LABEL@6_23:	; switch_break_bb
	clrb a
.BB@LABEL@6_24:	; switch_break_bb
	ret
_ElectrolyticOperation_nostop:
	.STACK _ElectrolyticOperation_nostop = 4
	;***      174 : }
	;***      175 : 
	;***      176 : uint8_t ElectrolyticOperation_nostop(void) {
	;***      177 : 	uint8_t *state = &g_machine_state.electrolyteOperation;
	;***      178 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 178
	mov a, !LOWW(_g_machine_state+0x00007)
	cmp0 a
	.bz $!.BB@LABEL@7_21
.BB@LABEL@7_1:	; entry
	dec a
	bz $.BB@LABEL@7_5
.BB@LABEL@7_2:	; entry
	dec a
	bz $.BB@LABEL@7_6
.BB@LABEL@7_3:	; entry
	dec a
	.bz $!.BB@LABEL@7_18
.BB@LABEL@7_4:	; switch_clause_bb130
	clrb !LOWW(_g_machine_state+0x00007)
	br $!.BB@LABEL@7_22
.BB@LABEL@7_5:	; switch_clause_bb7
	;***      179 : 	case 0:
	;***      180 : 		(*state)++;
	;***      181 : 		break;
	;***      182 : 	case 1:
	;***      183 : 		electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 183
	call !!_electrolyticOperationON
	;***      184 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 184
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	;***      185 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 185
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      186 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 186
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
	;***      187 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 187
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	;***      188 : 		g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 188
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
	br $.BB@LABEL@7_17
.BB@LABEL@7_6:	; switch_clause_bb16
	;***      189 : 		(*state)++;
	;***      190 : 		break;
	;***      191 : 	case 2:
	;***      192 : 		Voltage2Check_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 192
	call !!_Voltage2Check_nostop
	;***      193 : 		if (Voltage1Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 193
	call !!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@7_14
.BB@LABEL@7_7:	; if_else_bb
	;***      194 : 			(*state)--;
	;***      195 : 			break;
	;***      196 : 
	;***      197 : 		} else if (Voltage3Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 197
	call !!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@7_14
.BB@LABEL@7_8:	; if_else_bb35
	;***      198 : 			(*state)--;
	;***      199 : 			break;
	;***      200 : 		} else if (LowVoltageCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 200
	call !!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@7_14
.BB@LABEL@7_9:	; if_else_bb46
	;***      201 : 			(*state)--;
	;***      202 : 			break;
	;***      203 : 		} else if (OverCurrentCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 203
	call !!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@7_14
.BB@LABEL@7_10:	; if_else_bb57
	;***      204 : 			(*state)--;
	;***      205 : 			break;
	;***      206 : 		} else if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 206
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@7_15
.BB@LABEL@7_11:	; if_then_bb65
	;***      207 : 			g_alarm.refined.cvcc = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 207
	set1 !LOWW(_g_alarm+0x00001).6
	;***      208 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 208
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***      209 : 			g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 209
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@7_12:	; if_then_bb65.bb78_crit_edge
	oneb a
.BB@LABEL@7_13:	; bb78
	mov !LOWW(_g_machine_state+0x00008), a
	;***      210 : 					g_machine_state.electrolyteOFF == 0 ?
	;***      211 : 							1 : g_machine_state.electrolyteOFF;
	;***      212 : 			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 212
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call !!_sendToRasPi_f
	;***      213 : 			waitAlarmConfirm_stop(CVCC_ALARM, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 213
	movw ax, #0x1200
	call !!_waitAlarmConfirm_stop
	;***      214 : 			g_alarm.refined.cvcc = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 214
	clr1 !LOWW(_g_alarm+0x00001).6
.BB@LABEL@7_14:	; if_then_bb
	dec !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@7_22
.BB@LABEL@7_15:	; if_break_bb92
	;***      215 : 			(*state)--;
	;***      216 : 			break;
	;***      217 : 		}
	;***      218 : 		if (isAcidTankFull() && isAlkalineTankFull())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 218
	call !!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@7_22
.BB@LABEL@7_16:	; bb97
	call !!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@7_22
.BB@LABEL@7_17:	; if_then_bb110
	inc !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@7_22
.BB@LABEL@7_18:	; switch_clause_bb115
	;***      219 : 			(*state)++;
	;***      220 : 		break;
	;***      221 : 	case 3:
	;***      222 : 		g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 222
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@7_19:	; switch_clause_bb115.bb125_crit_edge
	oneb a
.BB@LABEL@7_20:	; bb125
	mov !LOWW(_g_machine_state+0x00008), a
	br $!.BB@LABEL@7_4
.BB@LABEL@7_21:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 180
	inc a
	mov !LOWW(_g_machine_state+0x00007), a
.BB@LABEL@7_22:	; bb132
	;***      223 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      224 : 						1 : g_machine_state.electrolyteOFF;
	;***      225 : 		(*state) = 0;
	;***      226 : 		break;
	;***      227 : 	default:
	;***      228 : 		(*state) = 0;
	;***      229 : 		break;
	;***      230 : 	}
	;***      231 : 	return (*state) == 0 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 231
	cmp0 !LOWW(_g_machine_state+0x00007)
	oneb a
	skz
.BB@LABEL@7_23:	; bb132
	clrb a
.BB@LABEL@7_24:	; bb132
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      232 : }
	;***      233 : 
	;***      234 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 234
	movw de, #0xFF07
	;***      235 : 	if (((I_ACID_L_PIN_FL1 == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 235
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
.BB@LABEL@8_1:	; return
	;***      236 : 			& ((I_ACID_M_PIN_FL2 == 1) | (I_ACID_H_PIN_FL3 == 1)))
	;***      237 : 			| ((I_ACID_M_PIN_FL2 == 0) & (I_ACID_H_PIN_FL3 == 1))) {
	;***      238 : 		sendToRasPi_f(H_ALARM, ACID_SKIP_ERROR, 1);
	;***      239 : 
	;***      240 : 	}
	;***      241 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 241
	ret
.BB@LABEL@8_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 238
	movw de, #0x3F80
	movw ax, #0x410E
	br !!_sendToRasPi_f
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      242 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 242
	push hl
	;***      243 : 	if (((I_ALKALI_L_PIN_FL4 == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 243
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
.BB@LABEL@9_1:	; return
	;***      244 : 			& ((I_ALKALI_M_PIN_FL5 == 1) | (I_ALKALI_H_PIN_FL6 == 1)))
	;***      245 : 			| ((I_ALKALI_M_PIN_FL5 == 0) & (I_ALKALI_H_PIN_FL6 == 1))) {
	;***      246 : 		sendToRasPi_f(H_ALARM, ALKALINE_SKIP_ERROR, 1);
	;***      247 : 	}
	;***      248 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 248
	ret
.BB@LABEL@9_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 246
	movw de, #0x3F80
	movw ax, #0x410F
	br !!_sendToRasPi_f
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      249 : 
	;***      250 : uint8_t FilterReplacementCheck(void) {
	;***      251 : 
	;***      252 : 	return 0;
	;***      253 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 253
	clrb a
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***      254 : 
	;***      255 : // Newest
	;***      256 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 256
	subw sp, #0x0A
	;***      257 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 257
	call $!_UpdateMachineStatus
	;***      258 : 	while (DrainageAcidAndAlkalineTankStart_nostop()) {
	;***      259 : 		RaspberryCommunication_nostop();
	;***      260 : 		UpdateMachineStatus();
	;***      261 : 		R_WDT_Restart();
	;***      262 : 	}
	;***      263 : 
	;***      264 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 264
	call $!_UpdateMachineStatus
.BB@LABEL@11_1:	; bb7
	;***      265 : 	while (WaterSupplyStart_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 265
	call $!_WaterSupplyStart_nostop
	cmp0 a
	bz $.BB@LABEL@11_3
.BB@LABEL@11_2:	; bb6
	;***      266 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 266
	call $!_realTimeResponse
	br $.BB@LABEL@11_1
.BB@LABEL@11_3:	; bb13
	;***      267 : 	}
	;***      268 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 268
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
.BB@LABEL@11_4:	; bb13
	clrb a
.BB@LABEL@11_5:	; bb13
	cmp0 x
	oneb x
	sknz
.BB@LABEL@11_6:	; bb13
	clrb x
.BB@LABEL@11_7:	; bb13
	or x, a
	bnz $.BB@LABEL@11_9
.BB@LABEL@11_8:	; if_then_bb
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	;***      269 : 		sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 269
	movw ax, #0x4104
	call !!_sendToRasPi_f
.BB@LABEL@11_9:	; bb21
	;***      270 : 				g_io_status.refined.FlowValue);
	;***      271 : 	}
	;***      272 : 	while (!ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 272
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@11_11
.BB@LABEL@11_10:	; bb20
	;***      273 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 273
	call $!_realTimeResponse
	br $.BB@LABEL@11_9
.BB@LABEL@11_11:	; return
	;***      274 : 	}
	;***      275 : 
	;***      276 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 276
	addw sp, #0x0A
	ret
_userAuthHandler_nostop:
	.STACK _userAuthHandler_nostop = 4
	;***      277 : 
	;***      278 : void userAuthHandler_nostop(void) {
	;***      279 : 	if((g_test_control.raw.biomectric == OFF)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 279
	movw hl, #LOWW(_g_test_control)
	bt [hl].3, $.BB@LABEL@12_4
.BB@LABEL@12_1:	; if_then_bb
	;***      280 : 		if(DETECT_U() == I_ON && g_machine_state.user == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 280
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@12_4
.BB@LABEL@12_2:	; bb18
	cmp0 !LOWW(_g_machine_state+0x0000D)
	bnz $.BB@LABEL@12_4
.BB@LABEL@12_3:	; if_then_bb31
	;***      281 : 			sendToRasPi_u32(H_SET, START_WASHING, 0U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 281
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x532B
	call !!_sendToRasPi_u32
	;***      282 : 			g_machine_state.user = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 282
	oneb !LOWW(_g_machine_state+0x0000D)
.BB@LABEL@12_4:	; if_break_bb32
	;***      283 : 		}
	;***      284 : 	}
	;***      285 : 	if (g_machine_state.user == 1 && g_commnunication_flag.send_response_flag == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 285
	cmp !LOWW(_g_machine_state+0x0000D), #0x01
	bnz $.BB@LABEL@12_14
.BB@LABEL@12_5:	; bb37
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@12_14
.BB@LABEL@12_6:	; if_then_bb50
	;***      286 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 286
	mov a, !LOWW(_g_machine_mode)
	dec a
	bz $.BB@LABEL@12_11
.BB@LABEL@12_7:	; if_then_bb50
	dec a
	bz $.BB@LABEL@12_12
.BB@LABEL@12_8:	; if_then_bb50
	dec a
	bz $.BB@LABEL@12_13
.BB@LABEL@12_9:	; if_then_bb50
	dec a
	bnz $.BB@LABEL@12_14
.BB@LABEL@12_10:	; switch_clause_bb55
	;***      287 : 		case HAND_WASHING:
	;***      288 : 			HandWashingMode_nostop();
	;***      289 : 			break;
	;***      290 : 		case WATER_WASHING:
	;***      291 : 			WaterWashingMode_nostop();
	;***      292 : 			break;
	;***      293 : 		case ACID_WASHING:
	;***      294 : 			AcidWaterMode_nostop();
	;***      295 : 			break;
	;***      296 : 		case ALKALINE_WASHING:
	;***      297 : 			AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 297
	br !!_AlkalineWaterMode_nostop
.BB@LABEL@12_11:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 288
	br !!_HandWashingMode_nostop
.BB@LABEL@12_12:	; switch_clause_bb53
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 291
	br !!_WaterWashingMode_nostop
.BB@LABEL@12_13:	; switch_clause_bb54
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 294
	br !!_AcidWaterMode_nostop
.BB@LABEL@12_14:	; return
	;***      298 : 			break;
	;***      299 : 		default:
	;***      300 : 			break;
	;***      301 : 		}
	;***      302 : 	}
	;***      303 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 303
	ret
_ElectrolyzeWaterGeneration_nostop:
	.STACK _ElectrolyzeWaterGeneration_nostop = 4
	;***      304 : /*!
	;***      305 :  * Tested!
	;***      306 :  */
	;***      307 : void ElectrolyzeWaterGeneration_nostop(void) {
	;***      308 : 	if ((g_machine_state.mode != ELECTROLYTIC_GENERATION)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 308
	mov a, !LOWW(_g_machine_state+0x0000E)
	cmp0 a
	bnz $.BB@LABEL@13_5
.BB@LABEL@13_1:	; if_then_bb
	;***      309 : 			&& (g_machine_state.mode == INDIE)) {
	;***      310 : 		if ((isAcidTankEmpty() || isAlkalineTankEmpty_nonstop()) && !levelSkipErrorCheck()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 310
	call !!_isAcidTankEmpty
	cmp0 a
	bnz $.BB@LABEL@13_3
.BB@LABEL@13_2:	; bb18
	call !!_isAlkalineTankEmpty_nonstop
	cmp0 a
	bz $.BB@LABEL@13_8
.BB@LABEL@13_3:	; bb30
	call !!_levelSkipErrorCheck
	cmp0 a
	bnz $.BB@LABEL@13_8
.BB@LABEL@13_4:	; if_then_bb49
	;***      311 : 			// Start Electrolyte
	;***      312 : 			g_machine_state.mode = ELECTROLYTIC_GENERATION;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 312
	mov !LOWW(_g_machine_state+0x0000E), #0x08
	;***      313 : 			//Stop what ever operation is happening
	;***      314 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 314
	clrb !LOWW(_g_machine_state+0x0000D)
	;***      315 : 			g_machine_state.handwash = g_machine_state.water =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 315
	clrb !LOWW(_g_machine_state)
	clrb !LOWW(_g_machine_state+0x00001)
	clrb !LOWW(_g_machine_state+0x00002)
	clrb !LOWW(_g_machine_state+0x00003)
	movw hl, #0xFF06
	movw ax, hl
	movw de, ax
	;***      316 : 					g_machine_state.acid = g_machine_state.akaline = 0;
	;***      317 : 			O_ACID_PUMP_PIN_P1 = O_ALK_PUMP_PIN_P2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 317
	clr1 [hl].1
	mov a, [de]
	mov1 CY, a.1
	mov a, [de]
	mov1 a.2, CY
	mov [de], a
	;***      318 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 318
	clr1 0xFFF05.5
	br $.BB@LABEL@13_8
.BB@LABEL@13_5:	; if_else_bb
	;***      319 : 
	;***      320 : 		}
	;***      321 : 	} else if (g_machine_state.mode == ELECTROLYTIC_GENERATION) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 321
	cmp a, #0x08
	bnz $.BB@LABEL@13_8
.BB@LABEL@13_6:	; if_then_bb66
	;***      322 : 		// Start Loop Electrolyte
	;***      323 : 		if (ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 323
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bz $.BB@LABEL@13_8
.BB@LABEL@13_7:	; if_then_bb72
	movw hl, #0xFF07
	movw ax, hl
	movw de, ax
	;***      324 : 			O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 324
	clr1 [hl].7
	mov a, [de]
	mov1 CY, a.7
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	;***      325 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 325
	clrb !LOWW(_g_machine_state+0x0000E)
	;***      326 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 326
	clrb !LOWW(_g_machine_state+0x0000D)
	;***      327 : 			handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 327
	clrb a
	call !!_handSensorLED
.BB@LABEL@13_8:	; if_break_bb82
	;***      328 : 			// Start Electrolyte Operation Off time keeper
	;***      329 : 		}
	;***      330 : 	}
	;***      331 : 	realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 331
	br $!_realTimeResponse
_isSV1andSV2Off8h:
	.STACK _isSV1andSV2Off8h = 8
	;***      332 : }
	;***      333 : /*!
	;***      334 :  * Tested!
	;***      335 :  */
	;***      336 : uint8_t isSV1andSV2Off8h(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 336
	push hl
	;***      337 : 	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 337
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@14_5
.BB@LABEL@14_1:	; bb
	mov a, 0xFFF05
	bt a.5, $.BB@LABEL@14_5
.BB@LABEL@14_2:	; if_then_bb
	;***      338 : 		if (ns_delay_ms(&g_Tick.tickSV1SV2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 338
	movw ax, !LOWW(_g_timerSetting+0x00084)
	movw hl, ax
	movw bc, #0x0036
	mulh
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00086)
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
	movw ax, #LOWW(_g_Tick+0x00048)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	oneb a
	sknz
.BB@LABEL@14_3:	; if_then_bb
	clrb a
.BB@LABEL@14_4:	; if_then_bb
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 347
	ret
.BB@LABEL@14_5:	; if_else_bb
	;***      339 : 				(uint32_t) g_timerSetting.t61_curranCleaningIntervalTime_h * 60
	;***      340 : 						* 60 * 1000)) {
	;***      341 : 			return 1;
	;***      342 : 		}
	;***      343 : 	} else {
	;***      344 : 		g_Tick.tickSV1SV2 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 344
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00048), ax
	clrb a
	br $.BB@LABEL@14_4
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***      345 : 	}
	;***      346 : 	return 0;
	;***      347 : }
	;***      348 : /*!
	;***      349 :  * Tested!
	;***      350 :  */
	;***      351 : void CallanCleaningMode_nostop(void) {
	;***      352 : 	uint8_t *state = &g_machine_state.callan;
	;***      353 : 	uint32_t *tick = &g_Tick.tickCallan;
	;***      354 : 	if (isSV1andSV2Off8h() || (*state) != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 354
	call $!_isSV1andSV2Off8h
	cmp0 a
	bnz $.BB@LABEL@15_2
.BB@LABEL@15_1:	; bb
	cmp0 !LOWW(_g_machine_state+0x00006)
	bz $.BB@LABEL@15_8
.BB@LABEL@15_2:	; if_then_bb
	;***      355 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 355
	mov a, !LOWW(_g_machine_state+0x00006)
	cmp0 a
	bz $.BB@LABEL@15_5
.BB@LABEL@15_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@15_6
.BB@LABEL@15_4:	; switch_clause_bb37
	;***      356 : 		case 0:
	;***      357 : 			(*state)++;
	;***      358 : 			*tick = g_systemTime;
	;***      359 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      360 : 			g_machine_state.mode = CALLAN_MODE;
	;***      361 : 			break;
	;***      362 : 		case 1:
	;***      363 : 			handSensorLEDBlink(WHITE, 500);
	;***      364 : 			if (ns_delay_ms(tick,
	;***      365 : 					g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***      366 : 				(*state)++;
	;***      367 : 				O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      368 : 				handSensorLED(BLACK);
	;***      369 : 				g_machine_state.mode = INDIE;
	;***      370 : 			}
	;***      371 : 			break;
	;***      372 : 		default:
	;***      373 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 373
	clrb !LOWW(_g_machine_state+0x00006)
	ret
.BB@LABEL@15_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 357
	inc a
	mov !LOWW(_g_machine_state+0x00006), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 358
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00062), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00060), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 359
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 360
	mov !LOWW(_g_machine_state+0x0000E), #0x09
	ret
.BB@LABEL@15_6:	; switch_clause_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 363
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	mov a, #0x02
	call !!_handSensorLEDBlink
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 364
	movw ax, !LOWW(_g_timerSetting+0x00088)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0008A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00060)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@15_8
.BB@LABEL@15_7:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 366
	inc !LOWW(_g_machine_state+0x00006)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 367
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 368
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 369
	clrb !LOWW(_g_machine_state+0x0000E)
.BB@LABEL@15_8:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 377
	ret
_DrainageMode_nostop:
	.STACK _DrainageMode_nostop = 14
	;***      374 : 			break;
	;***      375 : 		}
	;***      376 : 	}
	;***      377 : }
	;***      378 : /*!
	;***      379 :  * Tested!
	;***      380 :  */
	;***      381 : void DrainageMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 381
	subw sp, #0x06
	;***      382 : 	uint8_t *state = &g_machine_state.drainage;
	;***      383 : 	uint32_t *tick = &g_Tick.tickDrainage;
	;***      384 : 	if (g_machine_state.mode == DRAINAGE_MODE) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 384
	mov a, !LOWW(_g_machine_state+0x0000E)
	mov b, a
	cmp a, #0x0A
	.bnz $!.BB@LABEL@16_25
.BB@LABEL@16_1:	; if_then_bb
	;***      385 : 		// Start Drainage Loop
	;***      386 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 386
	mov a, !LOWW(_g_machine_state+0x00009)
	mov [sp+0x00], a
	cmp0 a
	bz $.BB@LABEL@16_7
.BB@LABEL@16_2:	; if_then_bb
	dec a
	bz $.BB@LABEL@16_8
.BB@LABEL@16_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@16_10
.BB@LABEL@16_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@16_17
.BB@LABEL@16_5:	; if_then_bb
	dec a
	.bz $!.BB@LABEL@16_20
.BB@LABEL@16_6:	; switch_clause_bb102
	;***      387 : 		case 0:
	;***      388 : 			if (DrainageAcidAndAlkalineTankStart_nostop() == 0) {
	;***      389 : 				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      390 : 				(*state)++;
	;***      391 : 			}
	;***      392 : 			break;
	;***      393 : 		case 1:
	;***      394 : 			if (ns_delay_ms(tick, 15 * 1000)) {
	;***      395 : 				(*state)++;
	;***      396 : 			}
	;***      397 : 			break;
	;***      398 : 		case 2:
	;***      399 : 			if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      400 : 					|| (g_io_status.refined.FlowValue
	;***      401 : 							> g_numberSetting.upperFlow)) {
	;***      402 : 				(*state)--;
	;***      403 : 			} else {
	;***      404 : 				(*state)++;
	;***      405 : 			}
	;***      406 : 			(*tick) = g_systemTime;
	;***      407 : 			break;
	;***      408 : 		case 3:
	;***      409 : 			if (ns_delay_ms(tick, 10 * 1000)) {
	;***      410 : 				electrolyticOperationON();
	;***      411 : 				(*state)++;
	;***      412 : 			}
	;***      413 : 			break;
	;***      414 : 		case 4:
	;***      415 : 			if (isAcidTankFull() && isAlkalineTankFull()) {
	;***      416 : 				electrolyticOperationOFF();
	;***      417 : 				(*state)++;
	;***      418 : 			}
	;***      419 : 			break;
	;***      420 : 		default:
	;***      421 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 421
	clrb !LOWW(_g_machine_state+0x00009)
	;***      422 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 422
	clrb !LOWW(_g_machine_state+0x0000E)
	br $.BB@LABEL@16_16
.BB@LABEL@16_7:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 389
	set1 0xFFF01.7
	br $.BB@LABEL@16_9
.BB@LABEL@16_8:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 394
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00064)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@16_16
.BB@LABEL@16_9:	; if_then_bb24
	inc !LOWW(_g_machine_state+0x00009)
	br $.BB@LABEL@16_16
.BB@LABEL@16_10:	; switch_clause_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 399
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
	push ax
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x00006)
	movw [sp+0x06], ax
	call !!__COM_flt
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@16_13
.BB@LABEL@16_11:	; bb
	movw ax, !LOWW(_g_numberSetting+0x0001A)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00018)
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fgt
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@16_13
.BB@LABEL@16_12:	; bb40.thread
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 404
	inc a
	br $.BB@LABEL@16_14
.BB@LABEL@16_13:	; bb40
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 402
	dec a
.BB@LABEL@16_14:	; if_break_bb52
	mov !LOWW(_g_machine_state+0x00009), a
.BB@LABEL@16_15:	; if_break_bb52
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00066), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00064), ax
.BB@LABEL@16_16:	; return
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 432
	ret
.BB@LABEL@16_17:	; switch_clause_bb55
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 409
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x00064)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@16_16
.BB@LABEL@16_18:	; if_then_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 410
	call !!_electrolyticOperationON
.BB@LABEL@16_19:	; if_then_bb61
	br $.BB@LABEL@16_9
.BB@LABEL@16_20:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 415
	call !!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@16_16
.BB@LABEL@16_21:	; bb71
	call !!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@16_16
.BB@LABEL@16_22:	; if_then_bb84
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 416
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@16_23:	; if_then_bb84.bb94_crit_edge
	oneb a
.BB@LABEL@16_24:	; bb94
	mov !LOWW(_g_machine_state+0x00008), a
	br $.BB@LABEL@16_19
.BB@LABEL@16_25:	; if_else_bb104
	;***      423 : 			break;
	;***      424 : 		}
	;***      425 : 	} else if ((g_TimeKeeper.electrolyteOff_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 425
	mov a, !LOWW(_g_TimeKeeper@1)
	shrw ax, 8+0x00000
	movw de, ax
	clrw ax
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, de
	sknz
.BB@LABEL@16_26:	; if_else_bb104
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@16_27:	; if_else_bb104
	bc $.BB@LABEL@16_16
.BB@LABEL@16_28:	; bb110
	cmp0 !LOWW(_g_machine_state+0x0000A)
	bz $.BB@LABEL@16_16
.BB@LABEL@16_29:	; bb110
	cmp0 b
	bnz $.BB@LABEL@16_16
.BB@LABEL@16_30:	; if_then_bb135
	;***      426 : 			>= g_timerSetting.t6_drainageOffTime_h)
	;***      427 : 			&& (g_machine_state.isMidNight != 0)
	;***      428 : 			&& (g_machine_state.mode == INDIE)) {
	;***      429 : 		g_machine_state.mode = DRAINAGE_MODE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 429
	mov !LOWW(_g_machine_state+0x0000E), #0x0A
	br $.BB@LABEL@16_15
_NormalMode_nostop:
	.STACK _NormalMode_nostop = 6
	;***      430 : 		(*tick) = g_systemTime;
	;***      431 : 	}
	;***      432 : }
	;***      433 : /*!
	;***      434 :  * Tested!
	;***      435 :  */
	;***      436 : void NormalMode_nostop(void) {
	;***      437 : 	if ((g_machine_state.mode != BUSY)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 437
	mov a, !LOWW(_g_machine_state+0x0000E)
	mov x, a
	add a, #0xF9
	cmp a, #0x02
	bc $.BB@LABEL@17_3
.BB@LABEL@17_1:	; entry
	mov a, x
	cmp a, #0x09
	bz $.BB@LABEL@17_3
.BB@LABEL@17_2:	; entry
	cmp a, #0x0A
	bnz $.BB@LABEL@17_7
.BB@LABEL@17_3:	; if_else_bb
	mov a, x
	;***      438 : 			&& (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***      439 : 			&& (g_machine_state.mode != CALLAN_MODE)
	;***      440 : 			&& (g_machine_state.mode != DRAINAGE_MODE)) {
	;***      441 : 		userAuthHandler_nostop();
	;***      442 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      443 : 	} else if (g_machine_state.mode == BUSY) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 443
	cmp a, #0x07
	bnz $.BB@LABEL@17_6
.BB@LABEL@17_4:	; if_then_bb44
	;***      444 : 		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 444
	movw ax, !LOWW(_g_timerSetting+0x00078)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0007A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00028)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@17_6
.BB@LABEL@17_5:	; if_then_bb52
	;***      445 : 				g_timerSetting.t60_waterDischargeDelay_s * 1000)) {
	;***      446 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 446
	clrb !LOWW(_g_machine_state+0x0000E)
	;***      447 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 447
	clrb !LOWW(_g_machine_state+0x0000D)
.BB@LABEL@17_6:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 450
	ret
.BB@LABEL@17_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 441
	call $!_userAuthHandler_nostop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 442
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00028), ax
	ret
_TestPowerOn_nostop_keepstate:
	.STACK _TestPowerOn_nostop_keepstate = 8
	;***      448 : 		}
	;***      449 : 	}
	;***      450 : }
	;***      451 : /*!
	;***      452 :  * Power ON test mode, state 0 - 1, end at 2
	;***      453 :  * @param state: Machine state
	;***      454 :  * @param tick: Tick for no stop delay
	;***      455 :  * @return 0 when done
	;***      456 :  */
	;***      457 : uint8_t TestPowerOn_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 457
	push ax
	movw hl, ax
	push bc
	pop de
	;***      458 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 458
	mov a, [hl]
	cmp0 a
	bz $.BB@LABEL@18_5
.BB@LABEL@18_1:	; entry
	dec a
	bnz $.BB@LABEL@18_4
.BB@LABEL@18_2:	; switch_clause_bb70
	;***      459 : 	case 0:
	;***      460 : 		O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 = O_SPOUT_ACID_PIN_SV3 =
	;***      461 : 		O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 = O_DRAIN_ALK_PIN_SV6 =
	;***      462 : 		O_DRAIN_ALK_PIN_SV6 = O_OPTION_2_PIN_SV8 = O_OPTION_3_PIN_SV9 = ON;
	;***      463 : 		O_PUMP_SALT_PIN_SP1 = ON;
	;***      464 : 		(*tick) = g_systemTime;
	;***      465 : 		break;
	;***      466 : 	case 1:
	;***      467 : 		if (ns_delay_ms(tick, 30 * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 467
	movw ax, de
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@18_4
.BB@LABEL@18_3:	; if_then_bb
	movw de, #0xFF06
	;***      468 : 			O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 468
	clr1 0xFFF0E.6
	mov a, 0xFFF0E
	mov1 CY, a.6
	mov a, 0xFFF0B
	mov1 a.1, CY
	mov 0xFFF0B, a
	mov a, 0xFFF0B
	mov1 CY, a.1
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	mov a, [de]
	mov1 CY, a.6
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	mov a, [de]
	mov1 CY, a.6
	mov a, [de]
	mov1 a.7, CY
	mov [de], a
	mov a, [de]
	mov1 CY, a.7
	movw hl, #0xFF06
	mov a, 0xFFF07
	mov1 a.7, CY
	mov 0xFFF07, a
	mov a, 0xFFF07
	mov1 CY, a.7
	mov a, 0xFFF07
	mov1 a.6, CY
	mov 0xFFF07, a
	mov a, 0xFFF07
	mov1 CY, a.6
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	mov a, 0xFFF05
	mov1 CY, a.5
	mov a, 0xFFF01
	mov1 a.7, CY
	mov 0xFFF01, a
	;***      469 : 			O_SPOUT_ACID_PIN_SV3 =
	;***      470 : 			O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 =
	;***      471 : 			O_DRAIN_ALK_PIN_SV6 =
	;***      472 : 			O_DRAIN_ALK_PIN_SV6 = O_OPTION_2_PIN_SV8 =
	;***      473 : 			O_OPTION_3_PIN_SV9 = OFF;
	;***      474 : 			O_PUMP_SALT_PIN_SP1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 474
	clr1 [hl].0
	pop hl
	push hl
	;***      475 : 			(*state)++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 475
	inc [hl+0x00]
.BB@LABEL@18_4:	; if_then_bb
	br $.BB@LABEL@18_6
.BB@LABEL@18_5:	; switch_clause_bb
	movw hl, #0xFF06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 460
	set1 0xFFF0E.6
	mov a, 0xFFF0E
	mov1 CY, a.6
	mov a, 0xFFF0B
	mov1 a.1, CY
	mov 0xFFF0B, a
	mov a, 0xFFF0B
	mov1 CY, a.1
	mov a, [hl]
	mov1 a.6, CY
	mov [hl], a
	mov a, [hl]
	mov1 CY, a.6
	mov a, [hl]
	mov1 a.6, CY
	mov [hl], a
	mov a, [hl]
	mov1 CY, a.6
	mov a, [hl]
	mov1 a.7, CY
	mov [hl], a
	mov a, [hl]
	mov1 CY, a.7
	mov a, 0xFFF07
	mov1 a.7, CY
	mov 0xFFF07, a
	mov a, 0xFFF07
	mov1 CY, a.7
	mov a, 0xFFF07
	mov1 a.6, CY
	mov 0xFFF07, a
	mov a, 0xFFF07
	mov1 CY, a.6
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	mov a, 0xFFF05
	mov1 CY, a.5
	mov a, 0xFFF01
	mov1 a.7, CY
	mov 0xFFF01, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 463
	set1 [hl].0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 464
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@18_6:	; switch_break_bb
	pop de
	push de
	;***      476 : 		}
	;***      477 : 		break;
	;***      478 : 	default:
	;***      479 : 		break;
	;***      480 : 	}
	;***      481 : 	return (*state) == 2 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 481
	mov a, [de]
	cmp a, #0x02
	oneb a
	skz
.BB@LABEL@18_7:	; switch_break_bb
	clrb a
.BB@LABEL@18_8:	; switch_break_bb
	pop hl
	ret
_FlowRateAdjustmentMode_nostop_keepstate:
	.STACK _FlowRateAdjustmentMode_nostop_keepstate = 8
	;***      482 : }
	;***      483 : uint8_t FlowRateAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 483
	push bc
	push ax
	;***      484 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 484
	call !!_measureFlowSensor_nostop
	pop de
	push de
	;***      485 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 485
	mov a, [de]
	add a, #0xFE
	bz $.BB@LABEL@19_6
.BB@LABEL@19_1:	; entry
	dec a
	bz $.BB@LABEL@19_7
.BB@LABEL@19_2:	; entry
	dec a
	bz $.BB@LABEL@19_9
.BB@LABEL@19_3:	; entry
	dec a
	bnz $.BB@LABEL@19_11
.BB@LABEL@19_4:	; switch_clause_bb30
	movw ax, [sp+0x02]
	;***      486 : 	case 2:
	;***      487 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      488 : 		(*state)++;
	;***      489 : 		(*tick) = g_systemTime;
	;***      490 : 		break;
	;***      491 : 	case 3:
	;***      492 : 		if (ns_delay_ms(tick, 30 * 1000)) {
	;***      493 : 			O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      494 : 			(*state)++;
	;***      495 : 		}
	;***      496 : 		break;
	;***      497 : 	case 4:
	;***      498 : 		if (ns_delay_ms(tick, 500)) {
	;***      499 : 			(*state)++;
	;***      500 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      501 : 		}
	;***      502 : 		break;
	;***      503 : 	case 5:
	;***      504 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 504
	movw de, #0x0009
	movw bc, #0x6258
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_11
.BB@LABEL@19_5:	; if_then_bb36
	pop hl
	push hl
	inc [hl+0x00]
	br $.BB@LABEL@19_11
.BB@LABEL@19_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 487
	set1 0xFFF05.5
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 488
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 489
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
	br $.BB@LABEL@19_11
.BB@LABEL@19_7:	; switch_clause_bb11
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 492
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_11
.BB@LABEL@19_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 493
	set1 0xFFF01.7
	br $.BB@LABEL@19_5
.BB@LABEL@19_9:	; switch_clause_bb19
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 498
	movw de, #0x0000
	movw bc, #0x01F4
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_11
.BB@LABEL@19_10:	; if_then_bb25
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 499
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 500
	clr1 0xFFF05.5
.BB@LABEL@19_11:	; switch_break_bb
	pop de
	push de
	;***      505 : 				(uint32_t) 15 * 1000 + (uint32_t) 10 * 60 * 1000)) {
	;***      506 : 			(*state)++;
	;***      507 : 		}
	;***      508 : 		break;
	;***      509 : 	default:
	;***      510 : 		break;
	;***      511 : 	}
	;***      512 : 	return (*state) == 6 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 512
	mov a, [de]
	cmp a, #0x06
	oneb a
	skz
.BB@LABEL@19_12:	; switch_break_bb
	clrb a
.BB@LABEL@19_13:	; switch_break_bb
	addw sp, #0x04
	ret
_CurrentAdjustmentMode_nostop_keepstate:
	.STACK _CurrentAdjustmentMode_nostop_keepstate = 8
	;***      513 : }
	;***      514 : uint8_t CurrentAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 514
	movw de, ax
	push bc
	push ax
	;***      515 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 515
	mov a, [de]
	add a, #0xFA
	bz $.BB@LABEL@20_5
.BB@LABEL@20_1:	; entry
	dec a
	bz $.BB@LABEL@20_6
.BB@LABEL@20_2:	; entry
	dec a
	bnz $.BB@LABEL@20_8
.BB@LABEL@20_3:	; switch_clause_bb18
	movw ax, [sp+0x02]
	;***      516 : 	case 6:
	;***      517 : 		electrolyticOperationON();
	;***      518 : 		(*state)++;
	;***      519 : 		break;
	;***      520 : 	case 7:
	;***      521 : 		if (ElectrolyticOperation_nostop()) {
	;***      522 : 			(*state)++;
	;***      523 : 			(*tick) = g_systemTime;
	;***      524 : 		}
	;***      525 : 		break;
	;***      526 : 	case 8:
	;***      527 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 527
	movw de, #0x0009
	movw bc, #0x6258
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@20_8
.BB@LABEL@20_4:	; if_then_bb24
	pop hl
	push hl
	inc [hl+0x00]
	br $.BB@LABEL@20_8
.BB@LABEL@20_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 517
	call !!_electrolyticOperationON
	br $.BB@LABEL@20_4
.BB@LABEL@20_6:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 521
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bz $.BB@LABEL@20_8
.BB@LABEL@20_7:	; if_then_bb
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 522
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 523
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@20_8:	; switch_break_bb
	pop de
	push de
	;***      528 : 				(uint32_t) 15 * 1000 + (uint32_t) 10 * 60 * 1000)) {
	;***      529 : 			(*state)++;
	;***      530 : 		}
	;***      531 : 		break;
	;***      532 : 	default:
	;***      533 : 		break;
	;***      534 : 	}
	;***      535 : 	return (*state) == 9 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 535
	mov a, [de]
	cmp a, #0x09
	oneb a
	skz
.BB@LABEL@20_9:	; switch_break_bb
	clrb a
.BB@LABEL@20_10:	; switch_break_bb
	addw sp, #0x04
	ret
_ElectrolyteAdjustmentOperation:
	.STACK _ElectrolyteAdjustmentOperation = 8
	;***      536 : }
	;***      537 : uint8_t ElectrolyteAdjustmentOperation(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 537
	movw de, ax
	push ax
	push bc
	;***      538 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 538
	mov a, [de]
	add a, #0xF7
	bz $.BB@LABEL@21_4
.BB@LABEL@21_1:	; entry
	dec a
	bz $.BB@LABEL@21_5
.BB@LABEL@21_2:	; entry
	dec a
	bnz $.BB@LABEL@21_11
.BB@LABEL@21_3:	; switch_clause_bb42
	movw ax, [sp+0x00]
	;***      539 : 	case 9:
	;***      540 : 		electrolyticOperationON();
	;***      541 : 		(*state)++;
	;***      542 : 		break;
	;***      543 : 	case 10:
	;***      544 : 		if (isAcidTankFull() && isAlkalineTankFull()) {
	;***      545 : 			electrolyticOperationOFF();
	;***      546 : 			(*tick) = g_systemTime;
	;***      547 : 			(*state)++;
	;***      548 : 		}
	;***      549 : 		break;
	;***      550 : 	case 11:
	;***      551 : 		if (ns_delay_ms(tick, (uint32_t) 10 * 60 * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 551
	movw de, #0x0009
	movw bc, #0x27C0
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@21_10
	br $.BB@LABEL@21_11
.BB@LABEL@21_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 540
	call !!_electrolyticOperationON
	br $.BB@LABEL@21_10
.BB@LABEL@21_5:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 544
	call !!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@21_11
.BB@LABEL@21_6:	; bb
	call !!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@21_11
.BB@LABEL@21_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 545
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@21_8:	; if_then_bb.bb32_crit_edge
	oneb a
.BB@LABEL@21_9:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 546
	movw bc, !LOWW(_g_systemTime+0x00002)
	pop de
	push de
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@21_10:	; switch_break_bb.PartialDrain
	movw ax, [sp+0x02]
	movw hl, ax
	inc [hl+0x00]
.BB@LABEL@21_11:	; switch_break_bb
	movw ax, [sp+0x02]
	movw de, ax
	;***      552 : 			(*state)++;
	;***      553 : 		}
	;***      554 : 		break;
	;***      555 : 	default:
	;***      556 : 		break;
	;***      557 : 	}
	;***      558 : 	return (*state);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 558
	mov a, [de]
	;***      559 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 559
	addw sp, #0x04
	ret
_TestOperation_nostop:
	.STACK _TestOperation_nostop = 4
	;***      560 : void TestOperation_nostop(void) {
	;***      561 : 	uint8_t *state = &g_machine_state.test;
	;***      562 : 	uint32_t *tick = &g_Tick.tickTestOperation;
	;***      563 : 	switch (g_commnunication_flag.test_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 563
	mov a, !LOWW(_g_commnunication_flag+0x0000A)
	add a, #0xE2
	bz $.BB@LABEL@22_5
.BB@LABEL@22_1:	; entry
	dec a
	bz $.BB@LABEL@22_6
.BB@LABEL@22_2:	; entry
	dec a
	bz $.BB@LABEL@22_7
.BB@LABEL@22_3:	; entry
	cmp a, #0x02
	bnz $.BB@LABEL@22_10
.BB@LABEL@22_4:	; switch_clause_bb33
	;***      564 : 	case TEST_POWER_ON:
	;***      565 : 		if (TestPowerOn_nostop_keepstate(state, &g_Tick.tickTestOperation)) {
	;***      566 : 			g_commnunication_flag.test_flag = 0;
	;***      567 : 			*state = 0;
	;***      568 : 		}
	;***      569 : 		break;
	;***      570 : 	case TEST_FLOW_RATE:
	;***      571 : 		if (FlowRateAdjustmentMode_nostop_keepstate(state, tick)) {
	;***      572 : 			g_commnunication_flag.test_flag = 0;
	;***      573 : 			*state = 0;
	;***      574 : 		}
	;***      575 : 		break;
	;***      576 : 	case TEST_CURRENT:
	;***      577 : 		if (CurrentAdjustmentMode_nostop_keepstate(state, tick)) {
	;***      578 : 			g_commnunication_flag.test_flag = 0;
	;***      579 : 			*state = 0;
	;***      580 : 		}
	;***      581 : 		break;
	;***      582 : 	case TEST_INDIVIDUAL:
	;***      583 : 
	;***      584 : 		break;
	;***      585 : 	case TEST_ELECTROLYTIC:
	;***      586 : 		if (ElectrolyteAdjustmentOperation(state, tick)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 586
	movw bc, #LOWW(_g_Tick+0x00068)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_ElectrolyteAdjustmentOperation
	br $.BB@LABEL@22_8
.BB@LABEL@22_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 565
	movw bc, #LOWW(_g_Tick+0x00068)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_TestPowerOn_nostop_keepstate
	br $.BB@LABEL@22_8
.BB@LABEL@22_6:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 571
	movw bc, #LOWW(_g_Tick+0x00068)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_FlowRateAdjustmentMode_nostop_keepstate
	br $.BB@LABEL@22_8
.BB@LABEL@22_7:	; switch_clause_bb21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 577
	movw bc, #LOWW(_g_Tick+0x00068)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_CurrentAdjustmentMode_nostop_keepstate
.BB@LABEL@22_8:	; switch_clause_bb21
	cmp0 a
	bz $.BB@LABEL@22_10
.BB@LABEL@22_9:	; if_then_bb41
	clrb !LOWW(_g_commnunication_flag+0x0000A)
	clrb !LOWW(_g_machine_state+0x0000B)
.BB@LABEL@22_10:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 594
	ret
_NeutralizationTreatment:
	.STACK _NeutralizationTreatment = 10
	;***      587 : 			g_commnunication_flag.test_flag = 0;
	;***      588 : 			*state = 0;
	;***      589 : 		}
	;***      590 : 		break;
	;***      591 : 	default:
	;***      592 : 		break;
	;***      593 : 	}
	;***      594 : }
	;***      595 : void NeutralizationTreatment(uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 595
	subw sp, #0x04
	movw hl, ax
	;***      596 : 	if (g_neutralization_time_s
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 596
	movw ax, !LOWW(_g_timerSetting+0x0008C)
	movw bc, #0x0E10
	mulhu
	movw [sp+0x00], ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0008E)
	movw bc, #0x0E10
	mulh
	addw ax, de
	cmpw ax, !LOWW(_g_neutralization_time_s+0x00002)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@23_1:	; entry
	cmpw ax, !LOWW(_g_neutralization_time_s)
.BB@LABEL@23_2:	; entry
	bh $.BB@LABEL@23_4
.BB@LABEL@23_3:	; if_then_bb
	;***      597 : 			>= g_timerSetting.t33_t63_neutralizationStartTime_h * 60 * 60) {
	;***      598 : 		g_machine_state.neutrlization = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 598
	oneb !LOWW(_g_machine_state+0x0000C)
	;***      599 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 599
	set1 0xFFF06.5
	clrw ax
	;***      600 : 		g_neutralization_time_s = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 600
	movw !LOWW(_g_neutralization_time_s+0x00002), ax
	movw !LOWW(_g_neutralization_time_s), ax
.BB@LABEL@23_4:	; if_break_bb
	;***      601 : 	}
	;***      602 : 	if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 602
	movw ax, !LOWW(_g_timerSetting+0x00090)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, bc
	movw [sp+0x02], ax
	movw ax, !LOWW(_g_timerSetting+0x00092)
	movw bc, #0x03E8
	mulh
	movw [sp+0x00], ax
	push de
	pop bc
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, [sp+0x00]
	addw ax, de
	movw de, ax
	movw ax, hl
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@23_7
.BB@LABEL@23_5:	; bb
	cmp0 !LOWW(_g_machine_state+0x0000C)
	bz $.BB@LABEL@23_7
.BB@LABEL@23_6:	; if_then_bb24
	;***      603 : 			g_timerSetting.t34_t64_neutralizationOpenTime_s * 1000)
	;***      604 : 			&& (g_machine_state.neutrlization != 0)) {
	;***      605 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 605
	set1 0xFFF06.5
	;***      606 : 		g_machine_state.neutrlization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 606
	clrb !LOWW(_g_machine_state+0x0000C)
.BB@LABEL@23_7:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 609
	ret
_main_loop_20211111:
	.STACK _main_loop_20211111 = 4
	;***      607 : 	}
	;***      608 : 
	;***      609 : }
	;***      610 : void main_loop_20211111(void) {
	;***      611 : 	realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 611
	call $!_realTimeResponse
	;***      612 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 612
	call !!_measureFlowSensor_nostop
	;***      613 : 
	;***      614 : 	if(g_commnunication_flag.test_flag != TESTING_MODE_START){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 614
	cmp !LOWW(_g_commnunication_flag+0x0000A), #0x1A
	bz $.BB@LABEL@24_2
.BB@LABEL@24_1:	; if_then_bb
	;***      615 : 		DrainageMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 615
	call $!_DrainageMode_nostop
	;***      616 : 		// Check Acid and Alkaline tank to make Electrolytic Water
	;***      617 : 		ElectrolyzeWaterGeneration_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 617
	call $!_ElectrolyzeWaterGeneration_nostop
	;***      618 : 		// Cleaning handler
	;***      619 : 		CallanCleaningMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 619
	call $!_CallanCleaningMode_nostop
	;***      620 : 		// Washing handler
	;***      621 : 		NormalMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 621
	call $!_NormalMode_nostop
	;***      622 : 
	;***      623 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 623
	call $!_realTimeResponse
.BB@LABEL@24_2:	; if_break_bb
	;***      624 : 	}else{
	;***      625 : 
	;***      626 : 
	;***      627 : 	}
	;***      628 : 	levelSkipErrorCheck();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 628
	call !!_levelSkipErrorCheck
	;***      629 : 	if (isAcidTankEmpty() && isAlkalineTankEmpty_nonstop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 629
	call !!_isAcidTankEmpty
	cmp0 a
	bz $.BB@LABEL@24_4
.BB@LABEL@24_3:	; bb
	call !!_isAlkalineTankEmpty_nonstop
	cmp0 a
	;***      630 : 		handSensorLEDBlink(WHITE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 630
	mov a, #0x02
	bnz $.BB@LABEL@24_8
.BB@LABEL@24_4:	; if_else_bb23
	;***      631 : 	} else if (isAcidTankEmpty()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 631
	call !!_isAcidTankEmpty
	cmp0 a
	bnz $.BB@LABEL@24_9
.BB@LABEL@24_5:	; if_else_bb30
	;***      632 : 		handSensorLEDBlink(RED, 100);
	;***      633 : 	} else if (isAlkalineTankEmpty_nonstop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 633
	call !!_isAlkalineTankEmpty_nonstop
	cmp0 a
	sknz
.BB@LABEL@24_6:	; if_else_bb37
	;***      634 : 		handSensorLEDBlink(BLUE, 100);
	;***      635 : 	} else{
	;***      636 : 		HandSensorLEDEndBlink();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 636
	br !!_HandSensorLEDEndBlink
.BB@LABEL@24_7:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 634
	mov a, #0x03
.BB@LABEL@24_8:	; if_then_bb36
	movw de, #0x0000
	movw bc, #0x0064
	br !!_handSensorLEDBlink
.BB@LABEL@24_9:	; if_then_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 632
	oneb a
	br $.BB@LABEL@24_8
_realTimeResponse:
	.STACK _realTimeResponse = 4
	;***      637 : 	}
	;***      638 : }
	;***      639 : 
	;***      640 : 
	;***      641 : void realTimeResponse(void) {
	;***      642 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 642
	call $!_UpdateMachineStatus
	;***      643 : 	RaspberryCommunication_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 643
	call !!_RaspberryCommunication_nostop
	;***      644 : 	isElectrolyticOperationOFF_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 644
	call !!_isElectrolyticOperationOFF_nostop
	;***      645 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 645
	call !!_R_WDT_Restart
	;***      646 : //	if (ns_delay_ms(&g_Tick.tickCustom[0], 200)) {
	;***      647 : //		P6_bit.no3 = ~P6_bit.no3;
	;***      648 : //	}
	;***      649 : 
	;***      650 : 	//Error Checking
	;***      651 : 	if (O_SUPPLY_WATER_PIN_SV1 == ON || O_SPOUT_WATER_PIN_SV2 == ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 651
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@25_3
.BB@LABEL@25_1:	; bb
	mov a, 0xFFF05
	bt a.5, $.BB@LABEL@25_3
.BB@LABEL@25_2:	; if_else_bb
	;***      652 : 		if (ns_delay_ms(&g_Tick.tickSV1SV2, 1000)) {
	;***      653 : 			g_TimeKeeper.SV1SV2OnTime_s++;
	;***      654 : 			if (g_TimeKeeper.SV1SV2OnTime_s >= 60 * 60) {
	;***      655 : 				g_TimeKeeper.SV1SV2OnTime_s -= 3600;
	;***      656 : 				g_TimeKeeper.SV1SV2OnTime_h++;
	;***      657 : 				//TODO: Save to EEPROM both s and h
	;***      658 : 				filterReplacementErrorCheck();
	;***      659 : 			}
	;***      660 : 		}
	;***      661 : 	} else
	;***      662 : 		g_Tick.tickSV1SV2 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 662
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00048), ax
	ret
.BB@LABEL@25_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 652
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00048)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@25_6
.BB@LABEL@25_4:	; if_then_bb21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 653
	movw ax, !LOWW(_g_TimeKeeper@1+0x00002)
	movw bc, ax
	incw ax
	movw !LOWW(_g_TimeKeeper@1+0x00002), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 654
	cmpw ax, #0x0E10
	bc $.BB@LABEL@25_6
.BB@LABEL@25_5:	; if_then_bb28
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 655
	addw ax, #0xF1F1
	movw !LOWW(_g_TimeKeeper@1+0x00002), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 656
	incw !LOWW(_g_TimeKeeper@1+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 658
	br !!_filterReplacementErrorCheck
.BB@LABEL@25_6:	; return
	;***      663 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 663
	ret
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***      664 : 
	;***      665 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 665
	push hl
	;***      666 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***      667 : 		pre_machine_washing_mode = g_machine_state.mode;
	;***      668 : 	g_io_status.refined.io.AcidEmptyLevel = I_ACID_L_PIN_FL1 == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 668
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@26_2
.BB@LABEL@26_1:	; bb11
	clrb x
.BB@LABEL@26_2:	; bb12
	;***      669 : 	g_io_status.refined.io.AcidLowLevel = I_ACID_M_PIN_FL2 == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 669
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@26_4
.BB@LABEL@26_3:	; bb28
	clrb c
.BB@LABEL@26_4:	; bb30
	;***      670 : 	g_io_status.refined.io.AcidHighLevel = I_ACID_H_PIN_FL3 == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 670
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@26_6
.BB@LABEL@26_5:	; bb46
	clrb b
.BB@LABEL@26_6:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***      671 : 	g_mean_io_status.refined.io.AcidLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 671
	mov a, 0xFFF07
	mov1 CY, a.2
	clrb a
	bc $.BB@LABEL@26_8
.BB@LABEL@26_7:	; bb63
	mov a, #0x10
	and a, !LOWW(_g_mean_io_status)
.BB@LABEL@26_8:	; bb70
	mov x, a
	mov a, #0xEF
	and a, !LOWW(_g_mean_io_status)
	or a, x
	mov c, a
	;***      672 : 	I_ACID_M_PIN_FL2 == I_ON ? g_mean_io_status.refined.io.AcidLowLevel : 0;
	;***      673 : 	g_mean_io_status.refined.io.AcidHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 673
	mov a, 0xFFF07
	clrb x
	bt a.3, $.BB@LABEL@26_10
.BB@LABEL@26_9:	; bb86
	mov a, c
	and a, #0x20
	mov x, a
.BB@LABEL@26_10:	; bb93
	mov a, c
	clr1 a.5
	or a, x
	mov !LOWW(_g_mean_io_status), a
	;***      674 : 	I_ACID_H_PIN_FL3 == I_ON ? g_mean_io_status.refined.io.AcidHighLevel : 0;
	;***      675 : 
	;***      676 : 	g_io_status.refined.io.AlkalineEmptyLevel = I_ALKALI_L_PIN_FL4 == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 676
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@26_12
.BB@LABEL@26_11:	; bb109
	clrb x
.BB@LABEL@26_12:	; bb111
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***      677 : 	g_io_status.refined.io.AlkalineLowLevel = I_ALKALI_M_PIN_FL5 == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 677
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@26_14
.BB@LABEL@26_13:	; bb126
	clrb b
.BB@LABEL@26_14:	; bb128
	mov a, c
	or a, x
	mov c, a
	;***      678 : 	g_io_status.refined.io.AlkalineHighLevel = I_ALKALI_H_PIN_FL6 == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 678
	mov a, 0xFFF07
	mov x, #0x04
	bf a.0, $.BB@LABEL@26_16
.BB@LABEL@26_15:	; bb144
	clrb x
.BB@LABEL@26_16:	; bb146
	mov a, c
	or a, b
	mov c, a
	;***      679 : //	g_mean_io_status.refined.io.AlkalineLowLevel =
	;***      680 : //	I_ALKALI_M_PIN_FL5 == I_ON ? g_mean_io_status.refined.io.AlkalineLowLevel : 0;
	;***      681 : //	g_mean_io_status.refined.io.AlkalineHighLevel =
	;***      682 : //	I_ALKALI_H_PIN_FL6 == I_ON ? g_mean_io_status.refined.io.AlkalineHighLevel : 0;
	;***      683 : 
	;***      684 : 	g_io_status.refined.io.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 684
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@26_18
.BB@LABEL@26_17:	; bb162
	clrb b
.BB@LABEL@26_18:	; bb164
	mov a, c
	or a, x
	mov c, a
	;***      685 : 	g_io_status.refined.io.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 685
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@26_20
.BB@LABEL@26_19:	; bb180
	clrb x
.BB@LABEL@26_20:	; bb182
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***      686 : 
	;***      687 : 	g_io_status.refined.io.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 687
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***      688 : 	g_io_status.refined.io.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 688
	mov x, 0xFFF05
	;***      689 : 	g_io_status.refined.io.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 689
	mov c, 0xFFF07
	;***      690 : 	g_io_status.refined.io.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 690
	mov a, 0xFFF07
	mov h, a
	;***      691 : 	g_io_status.refined.io.Valve.SV5 = g_io_status.refined.io.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 691
	mov a, [de]
	mov l, a
	;***      692 : 	O_DRAIN_ACID_PIN_SV5;
	;***      693 : 	g_io_status.refined.io.Valve.SV6 = g_io_status.refined.io.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 693
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 687
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 688
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 689
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 690
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 691
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***      694 : 	O_DRAIN_ALK_PIN_SV6;
	;***      695 : 	g_io_status.refined.io.Valve.SV7 = O_NEUTRALIZE_PIN_SV7;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 695
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 691
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 695
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 693
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 695
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***      696 : 
	;***      697 : 	g_io_status.refined.io.Pump1 = O_ACID_PUMP_PIN_P1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 697
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***      698 : 	g_io_status.refined.io.Pump2 = O_ALK_PUMP_PIN_P2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 698
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***      699 : 	g_io_status.refined.io.SaltPump = O_PUMP_SALT_PIN_SP1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 699
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
_manufactureReset:
	.STACK _manufactureReset = 8
	;***      700 : }
	;***      701 : 
	;***      702 : void manufactureReset(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 702
	clrw ax
	;***      703 : 	g_timerSetting.t1_initialWaterDrainageOperation_s = 60;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 703
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***      704 : 	g_timerSetting.t2_flowSensorStartTime_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 704
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***      705 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 705
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***      706 : 	g_timerSetting.t4_electrolysisOperationStart_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 706
	movw !LOWW(_g_timerSetting+0x0000E), ax
	;***      707 : 	g_timerSetting.t5_electrolysisStopDelay_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 707
	movw !LOWW(_g_timerSetting+0x00012), ax
	;***      708 : 	g_timerSetting.t6_drainageOffTime_h = 168;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 708
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***      709 : 	g_timerSetting.t7_powerOnPreparation_s = 600;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 709
	movw !LOWW(_g_timerSetting+0x0001A), ax
	;***      710 : 	g_timerSetting.t8_flowRateAdjustmentRelease_s = 600;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 710
	movw !LOWW(_g_timerSetting+0x0001E), ax
	;***      711 : 	g_timerSetting.t9_currentAdjustmentRelease_s = 600;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 711
	movw !LOWW(_g_timerSetting+0x00022), ax
	;***      712 : 
	;***      713 : 	g_timerSetting.t10_electrolysisCurrentAlarmSpecified_s = 60;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 713
	movw !LOWW(_g_timerSetting+0x00026), ax
	;***      714 : 	g_timerSetting.t11_overVoltage1Time_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 714
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***      715 : 	g_timerSetting.t12_overVoltage2Time_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 715
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***      716 : 	g_timerSetting.t13_overVoltage3Time_s = 20;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 716
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***      717 : 	g_timerSetting.t14_lowVoltageStartTime_s = 60;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 717
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***      718 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 718
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***      719 : 	g_timerSetting.t16_currentMonitoringStart_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 719
	movw !LOWW(_g_timerSetting+0x0003E), ax
	;***      720 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 720
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***      721 : 	g_timerSetting.t18_fullSaltWaterMonitoringStart_h = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 721
	movw !LOWW(_g_timerSetting+0x00046), ax
	;***      722 : 	g_timerSetting.t19_waterFilterAlarm_h = 4000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 722
	movw !LOWW(_g_timerSetting+0x0004A), ax
	;***      723 : 
	;***      724 : 	g_timerSetting.t20_waterFilterAlarmIgnore_h = 4800;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 724
	movw !LOWW(_g_timerSetting+0x0004E), ax
	;***      725 : 	g_timerSetting.t26_onDelayEmptyLevel_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 725
	movw !LOWW(_g_timerSetting+0x00052), ax
	;***      726 : 	g_timerSetting.t27_onDelayLowLevel_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 726
	movw !LOWW(_g_timerSetting+0x00056), ax
	;***      727 : 	g_timerSetting.t28_onDelayHighLevel_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 727
	movw !LOWW(_g_timerSetting+0x0005A), ax
	;***      728 : 
	;***      729 : 	g_timerSetting.t30_offDelayEmptyLevel_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 729
	movw !LOWW(_g_timerSetting+0x0005E), ax
	;***      730 : 	g_timerSetting.t31_saltLowLevelDelay_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 730
	movw !LOWW(_g_timerSetting+0x00062), ax
	;***      731 : 	g_timerSetting.t32_saltHighLevelDelay_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 731
	movw !LOWW(_g_timerSetting+0x00066), ax
	;***      732 : 	g_timerSetting.t33_t63_neutralizationStartTime_h = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 732
	movw !LOWW(_g_timerSetting+0x0008E), ax
	;***      733 : 	g_timerSetting.t34_t64_neutralizationOpenTime_s = 300;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 733
	movw !LOWW(_g_timerSetting+0x00092), ax
	;***      734 : 
	;***      735 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 15;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 735
	movw !LOWW(_g_timerSetting+0x0006A), ax
	;***      736 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 15;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 736
	movw !LOWW(_g_timerSetting+0x0006E), ax
	;***      737 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 15;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 737
	movw !LOWW(_g_timerSetting+0x00072), ax
	;***      738 : 	g_timerSetting.t54_overLapTime_ms = 0.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 738
	movw !LOWW(_g_timerSetting+0x00076), ax
	movw !LOWW(_g_timerSetting+0x00074), ax
	;***      739 : 	g_timerSetting.t60_waterDischargeDelay_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 739
	movw !LOWW(_g_timerSetting+0x0007A), ax
	;***      740 : 	g_timerSetting.t56_acidWaterDownTime_s = 300;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 740
	movw !LOWW(_g_timerSetting+0x0007E), ax
	;***      741 : 	g_timerSetting.t57_alkalineWaterDownTime_s = 300;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 741
	movw !LOWW(_g_timerSetting+0x00082), ax
	;***      742 : 
	;***      743 : 	g_timerSetting.t61_curranCleaningIntervalTime_h = 8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 743
	movw !LOWW(_g_timerSetting+0x00086), ax
	;***      744 : 	g_timerSetting.t62_callanWashSpoutingTime_s = 30;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 744
	movw !LOWW(_g_timerSetting+0x0008A), ax
	;***      745 : 
	;***      746 : 	g_numberSetting.upperVoltage1 = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 746
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw !LOWW(_g_numberSetting), ax
	;***      747 : 	g_numberSetting.upperVoltage2 = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 747
	movw !LOWW(_g_numberSetting+0x00006), ax
	movw !LOWW(_g_numberSetting+0x00004), ax
	;***      748 : 	g_numberSetting.upperVoltage3 = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 748
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw !LOWW(_g_numberSetting+0x00008), ax
	;***      749 : 	g_numberSetting.upperFlow = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 749
	movw !LOWW(_g_numberSetting+0x0001A), ax
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***      750 : 	g_numberSetting.upperCurrent = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 750
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw !LOWW(_g_numberSetting+0x00010), ax
	;***      751 : 	g_numberSetting.saltPumpVoltage = 1.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 751
	movw !LOWW(_g_numberSetting+0x00024), ax
	;***      752 : 	g_numberSetting.lowerVoltage = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 752
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw !LOWW(_g_numberSetting+0x0000C), ax
	;***      753 : 	g_numberSetting.lowerFlow = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 753
	movw !LOWW(_g_numberSetting+0x0001E), ax
	movw !LOWW(_g_numberSetting+0x0001C), ax
	;***      754 : 	g_numberSetting.lowerCurrent = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 754
	movw !LOWW(_g_numberSetting+0x00016), ax
	movw !LOWW(_g_numberSetting+0x00014), ax
	;***      755 : 	g_numberSetting.cvccCurrent = 1.0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 755
	movw !LOWW(_g_numberSetting+0x00020), ax
	mov x, #0x3C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 703
	movw !LOWW(_g_timerSetting), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 713
	movw !LOWW(_g_timerSetting+0x00024), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 717
	movw !LOWW(_g_timerSetting+0x00034), ax
	mov x, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 704
	movw !LOWW(_g_timerSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 706
	movw !LOWW(_g_timerSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 715
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 718
	movw !LOWW(_g_timerSetting+0x00038), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 720
	movw !LOWW(_g_timerSetting+0x00040), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 729
	movw !LOWW(_g_timerSetting+0x0005C), ax
	mov x, #0x05
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 705
	movw !LOWW(_g_timerSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 707
	movw !LOWW(_g_timerSetting+0x00010), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 714
	movw !LOWW(_g_timerSetting+0x00028), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 719
	movw !LOWW(_g_timerSetting+0x0003C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 725
	movw !LOWW(_g_timerSetting+0x00050), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 726
	movw !LOWW(_g_timerSetting+0x00054), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 727
	movw !LOWW(_g_timerSetting+0x00058), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 730
	movw !LOWW(_g_timerSetting+0x00060), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 731
	movw !LOWW(_g_timerSetting+0x00064), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 739
	movw !LOWW(_g_timerSetting+0x00078), ax
	mov x, #0xA8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 708
	movw !LOWW(_g_timerSetting+0x00014), ax
	movw ax, #0x0258
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 709
	movw !LOWW(_g_timerSetting+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 710
	movw !LOWW(_g_timerSetting+0x0001C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 711
	movw !LOWW(_g_timerSetting+0x00020), ax
	movw ax, #0x0014
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 716
	movw !LOWW(_g_timerSetting+0x00030), ax
	mov x, #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 721
	movw !LOWW(_g_timerSetting+0x00044), ax
	movw ax, #0x0FA0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 722
	movw !LOWW(_g_timerSetting+0x00048), ax
	movw ax, #0x12C0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 724
	movw !LOWW(_g_timerSetting+0x0004C), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 732
	movw !LOWW(_g_timerSetting+0x0008C), ax
	movw ax, #0x012C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 733
	movw !LOWW(_g_timerSetting+0x00090), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 740
	movw !LOWW(_g_timerSetting+0x0007C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 741
	movw !LOWW(_g_timerSetting+0x00080), ax
	movw ax, #0x000F
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 735
	movw !LOWW(_g_timerSetting+0x00068), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 736
	movw !LOWW(_g_timerSetting+0x0006C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 737
	movw !LOWW(_g_timerSetting+0x00070), ax
	mov x, #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 743
	movw !LOWW(_g_timerSetting+0x00084), ax
	mov x, #0x1E
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 744
	movw !LOWW(_g_timerSetting+0x00088), ax
	movw ax, #0x3F80
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 751
	movw !LOWW(_g_numberSetting+0x00026), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 755
	movw !LOWW(_g_numberSetting+0x00022), ax
	clrw ax
	;***      756 : 	EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 756
	push ax
	mov x, #0x95
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	clrw ax
	;***      757 : 			timeSettingSize);
	;***      758 : 	EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 758
	push ax
	mov x, #0x29
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	ret
	;***      759 : 			numberSettingSize);
	;***      760 : 
	;***      761 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TimeKeeper@1:
	.DS (10)
	.ALIGN 2
_g_numberSetting:
	.DS (42)
	.ALIGN 2
_g_neutralization_time_s:
	.DS (4)
_g_color:
	.DS (1)
_g_pre_color:
	.DS (1)
	.ALIGN 2
_g_flow_value:
	.DS (4)
_g_machine_state:
	.DS (15)
	.ALIGN 2
_g_io_status:
	.DS (18)
	.ALIGN 2
_g_mean_io_status:
	.DS (18)
	.ALIGN 2
_g_res_io_status:
	.DS (18)
	.ALIGN 2
__settingTime:
	.DS (150)
	.ALIGN 2
__settingNumber:
	.DS (42)
_g_machine_mode:
	.DS (1)
_g_machine_test_mode:
	.DS (1)
	.ALIGN 2
_btod:
	.DS (4)
	.ALIGN 2
_g_Tick:
	.DS (188)
_water_solfner_buf:
	.DS (7)
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
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (1)
	.DS (1)
