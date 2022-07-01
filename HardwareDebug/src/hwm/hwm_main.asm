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
#@  compiled at Thu Jun 30 14:37:32 2022

	.EXTERN _rx_count
	.EXTERN _g_commnunication_flag
	.EXTERN _g_systemTime
	.EXTERN _g_uart3_sendend
	.EXTERN _g_alarm
	.EXTERN _g_control_setting
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
	.EXTERN _measureFlowSensor_nostop
	.EXTERN _ns_delay_ms
	.EXTERN _measureFlowSensor
	.EXTERN _FlowSensorCheck_nonstop
	.PUBLIC _ElectrolyticOperation_nostop
	.EXTERN _electrolyticOperationON
	.EXTERN _Voltage2Check_nostop
	.EXTERN _Voltage1Check_waitReset
	.EXTERN _Voltage3Check_waitReset
	.EXTERN _LowVoltageCheck_waitReset
	.EXTERN _OverCurrentCheck_waitReset
	.EXTERN _waitAlarmConfirm_stop
	.EXTERN _levelSkipErrorCheck
	.EXTERN _isAcidTankFull
	.EXTERN _isAlkalineTankFull
	.EXTERN _isElectrolyticOperationOFF_nostop
	.PUBLIC _acidWaterTankSkipCheck
	.EXTERN _sendToRasPi_f
	.PUBLIC _alkalineWaterTankSkipCheck
	.PUBLIC _FilterReplacementCheck
	.PUBLIC _main_init_20211111
	.EXTERN _RaspberryCommunication_nostop
	.EXTERN _R_WDT_Restart
	.PUBLIC _userAuthHandler_nostop
	.EXTERN _isHandSensorON
	.EXTERN _HandWashingMode_nostop
	.EXTERN _WaterWashingMode_nostop
	.EXTERN _AcidWaterMode_nostop
	.EXTERN _AlkalineWaterMode_nostop
	.PUBLIC _ElectrolyzeWaterGeneration_nostop
	.EXTERN _isAcidTankAlmostEmpty
	.EXTERN _isAlkalineTankAlmostEmpty
	.PUBLIC _isSV1andSV2Off8h
	.PUBLIC _CallanCleaningMode_nostop
	.EXTERN _handSensorLEDBlink
	.EXTERN _handSensorLED
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
	.EXTERN _isAcidTankEmpty
	.EXTERN _isAlkalineTankEmpty_nonstop
	.EXTERN _HandSensorLEDEndBlink
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
	;***       53 : 	g_timerSetting.t29_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 53
	movw !LOWW(_g_timerSetting+0x00072), ax
	;***       54 : 	g_timerSetting.t30_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 54
	movw !LOWW(_g_timerSetting+0x00076), ax
	;***       55 : 	g_timerSetting.t31_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 55
	movw !LOWW(_g_timerSetting+0x0007A), ax
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
	movw !LOWW(_g_timerSetting+0x00070), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 54
	movw !LOWW(_g_timerSetting+0x00074), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 55
	movw !LOWW(_g_timerSetting+0x00078), ax
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
	;***      125 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 125
	call !!_measureFlowSensor_nostop
	;***      126 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 126
	mov b, !LOWW(_g_machine_state+0x00004)
	cmp0 b
	bz $.BB@LABEL@6_8
.BB@LABEL@6_1:	; entry
	dec b
	bz $.BB@LABEL@6_9
.BB@LABEL@6_2:	; entry
	dec b
	bz $.BB@LABEL@6_11
.BB@LABEL@6_3:	; entry
	dec b
	bz $.BB@LABEL@6_13
.BB@LABEL@6_4:	; entry
	dec b
	.bz $!.BB@LABEL@6_17
.BB@LABEL@6_5:	; entry
	dec b
	.bz $!.BB@LABEL@6_18
.BB@LABEL@6_6:	; entry
	dec b
	.bz $!.BB@LABEL@6_23
.BB@LABEL@6_7:	; switch_clause_bb73
	;***      127 : 	case 0:
	;***      128 : 		*tick = g_systemTime;
	;***      129 : 		g_machine_state.mode = WATER_WASHING;
	;***      130 : 		(*state)++;
	;***      131 : 		break;
	;***      132 : 	case 1:
	;***      133 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      134 : 		if (ns_delay_ms(tick, 30000)) { //30000
	;***      135 : 			(*state)++;
	;***      136 : 		}
	;***      137 : 		break;
	;***      138 : 	case 2:
	;***      139 : 		O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      140 : 		if (ns_delay_ms(tick, 500)) { //5000
	;***      141 : 			(*state)++;
	;***      142 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      143 : 		}
	;***      144 : 		break;
	;***      145 : 	case 3:
	;***      146 : 		O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      147 : 		O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      148 : 		if (ns_delay_ms(tick, 15000)) { //1500
	;***      149 : 			(*state)++;
	;***      150 : 			g_machine_state.flowSensor = 0;
	;***      151 : 		}
	;***      152 : 		measureFlowSensor_nostop();
	;***      153 : 		break;
	;***      154 : 	case 4:
	;***      155 : 		measureFlowSensor(g_timerSetting.t3_flowSensorMonitorTime_s);
	;***      156 : 		(*state)++;
	;***      157 : 		break;
	;***      158 : 	case 5:
	;***      159 : 		if (FlowSensorCheck_nonstop()) {
	;***      160 : 			(*state) = 3;
	;***      161 : 			O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***      162 : 		} else
	;***      163 : 			(*state)++;
	;***      164 : 		g_Tick.tickWaterSupply = g_systemTime;
	;***      165 : 		break;
	;***      166 : 	case 6:
	;***      167 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply,
	;***      168 : 				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
	;***      169 : 			(*state) = 0;
	;***      170 : 			g_machine_state.mode = INDIE;
	;***      171 : 		}
	;***      172 : 		break;
	;***      173 : 	default:
	;***      174 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 174
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@6_16
.BB@LABEL@6_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 128
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 129
	mov !LOWW(_g_machine_state+0x0000F), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 130
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@6_16
.BB@LABEL@6_9:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 133
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 134
	clrw ax
	movw de, ax
	movw bc, #0x7530
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_16
.BB@LABEL@6_10:	; if_then_bb
	inc !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@6_22
.BB@LABEL@6_11:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 139
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 140
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_22
.BB@LABEL@6_12:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 141
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 142
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00024), ax
	br $.BB@LABEL@6_22
.BB@LABEL@6_13:	; switch_clause_bb31
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 146
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 147
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 148
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_15
.BB@LABEL@6_14:	; if_then_bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 149
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 150
	clrb !LOWW(_g_machine_state+0x00005)
.BB@LABEL@6_15:	; if_break_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 152
	call !!_measureFlowSensor_nostop
.BB@LABEL@6_16:	; if_break_bb41
	br $.BB@LABEL@6_25
.BB@LABEL@6_17:	; switch_clause_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 155
	movw bc, !LOWW(_g_timerSetting+0x0000A)
	movw ax, !LOWW(_g_timerSetting+0x00008)
	call !!_measureFlowSensor
	br $.BB@LABEL@6_10
.BB@LABEL@6_18:	; switch_clause_bb50
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 159
	call !!_FlowSensorCheck_nonstop
	cmp0 a
	bnz $.BB@LABEL@6_20
.BB@LABEL@6_19:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 163
	inc !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@6_21
.BB@LABEL@6_20:	; if_then_bb56
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 160
	mov !LOWW(_g_machine_state+0x00004), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 161
	clr1 0xFFF01.7
.BB@LABEL@6_21:	; if_break_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 164
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
.BB@LABEL@6_22:	; if_break_bb61
	br $.BB@LABEL@6_25
.BB@LABEL@6_23:	; switch_clause_bb63
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 167
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
	bz $.BB@LABEL@6_25
.BB@LABEL@6_24:	; if_then_bb70
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 169
	clrb !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 170
	clrb !LOWW(_g_machine_state+0x0000F)
.BB@LABEL@6_25:	; switch_break_bb
	;***      175 : 		break;
	;***      176 : 	}
	;***      177 : 	realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 177
	call $!_realTimeResponse
	;***      178 : 	return (*state) == 0 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 178
	cmp0 !LOWW(_g_machine_state+0x00004)
	oneb a
	sknz
.BB@LABEL@6_26:	; switch_break_bb
	clrb a
.BB@LABEL@6_27:	; switch_break_bb
	ret
_ElectrolyticOperation_nostop:
	.STACK _ElectrolyticOperation_nostop = 4
	;***      179 : }
	;***      180 : 
	;***      181 : uint8_t ElectrolyticOperation_nostop(void) {
	;***      182 : 	uint8_t *state = &g_machine_state.electrolyteOperation;
	;***      183 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 183
	mov a, !LOWW(_g_machine_state+0x00007)
	cmp0 a
	.bz $!.BB@LABEL@7_22
.BB@LABEL@7_1:	; entry
	dec a
	bz $.BB@LABEL@7_5
.BB@LABEL@7_2:	; entry
	dec a
	bz $.BB@LABEL@7_6
.BB@LABEL@7_3:	; entry
	dec a
	.bz $!.BB@LABEL@7_19
.BB@LABEL@7_4:	; switch_clause_bb142
	clrb !LOWW(_g_machine_state+0x00007)
	br $!.BB@LABEL@7_23
.BB@LABEL@7_5:	; switch_clause_bb7
	;***      184 : 	case 0:
	;***      185 : 		(*state)++;
	;***      186 : 		break;
	;***      187 : 	case 1:
	;***      188 : 		electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 188
	call !!_electrolyticOperationON
	;***      189 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 189
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	;***      190 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 190
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      191 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 191
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
	;***      192 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 192
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	;***      193 : 		g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 193
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
	br $.BB@LABEL@7_18
.BB@LABEL@7_6:	; switch_clause_bb16
	;***      194 : 		(*state)++;
	;***      195 : 		break;
	;***      196 : 	case 2:
	;***      197 : 		Voltage2Check_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 197
	call !!_Voltage2Check_nostop
	;***      198 : 		if (Voltage1Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 198
	call !!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@7_14
.BB@LABEL@7_7:	; if_else_bb
	;***      199 : 			(*state) = 1;
	;***      200 : 			break;
	;***      201 : 		} else if (Voltage3Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 201
	call !!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@7_14
.BB@LABEL@7_8:	; if_else_bb30
	;***      202 : 			(*state) = 1;
	;***      203 : 			break;
	;***      204 : 		} else if (LowVoltageCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 204
	call !!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@7_14
.BB@LABEL@7_9:	; if_else_bb39
	;***      205 : 			(*state) = 1;
	;***      206 : 			break;
	;***      207 : 		} else if (OverCurrentCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 207
	call !!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@7_14
.BB@LABEL@7_10:	; if_else_bb48
	;***      208 : 			(*state) = 1;
	;***      209 : 			break;
	;***      210 : 		} else if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 210
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@7_15
.BB@LABEL@7_11:	; if_then_bb56
	;***      211 : 			g_alarm.refined.cvcc = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 211
	set1 !LOWW(_g_alarm+0x00001).6
	;***      212 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 212
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	;***      213 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 213
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@7_12:	; if_then_bb56.bb69_crit_edge
	oneb a
.BB@LABEL@7_13:	; bb69
	mov !LOWW(_g_machine_state+0x00008), a
	;***      214 : //			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	;***      215 : 			waitAlarmConfirm_stop(CVCC_ALARM, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 215
	movw ax, #0x1200
	call !!_waitAlarmConfirm_stop
	;***      216 : 			g_alarm.refined.cvcc = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 216
	clr1 !LOWW(_g_alarm+0x00001).6
.BB@LABEL@7_14:	; if_then_bb
	oneb !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@7_23
.BB@LABEL@7_15:	; if_break_bb81
	;***      217 : 			(*state) = 1;
	;***      218 : 			break;
	;***      219 : 		}
	;***      220 : 		if (!levelSkipErrorCheck() && isAcidTankFull() && isAlkalineTankFull())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 220
	call !!_levelSkipErrorCheck
	cmp0 a
	bnz $.BB@LABEL@7_23
.BB@LABEL@7_16:	; bb92
	call !!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@7_23
.BB@LABEL@7_17:	; bb104
	call !!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@7_23
.BB@LABEL@7_18:	; if_then_bb117
	inc !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@7_23
.BB@LABEL@7_19:	; switch_clause_bb122
	;***      221 : 			(*state)++;
	;***      222 : 		break;
	;***      223 : 	case 3:
	;***      224 : 		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 224
	inc !LOWW(_rx_count)
	;***      225 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 225
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@7_20:	; switch_clause_bb122.bb134_crit_edge
	oneb a
.BB@LABEL@7_21:	; bb134
	mov !LOWW(_g_machine_state+0x00008), a
	;***      226 : 		g_alarm.refined.abnormal_current = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 226
	clr1 !LOWW(_g_alarm).5
	br $!.BB@LABEL@7_4
.BB@LABEL@7_22:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 185
	inc a
	mov !LOWW(_g_machine_state+0x00007), a
.BB@LABEL@7_23:	; bb144
	;***      227 : 		(*state) = 0;
	;***      228 : 		break;
	;***      229 : 	default:
	;***      230 : 		(*state) = 0;
	;***      231 : 		break;
	;***      232 : 	}
	;***      233 : 	isElectrolyticOperationOFF_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 233
	call !!_isElectrolyticOperationOFF_nostop
	;***      234 : 	return (*state) == 0 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 234
	cmp0 !LOWW(_g_machine_state+0x00007)
	oneb a
	skz
.BB@LABEL@7_24:	; bb144
	clrb a
.BB@LABEL@7_25:	; bb144
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      235 : }
	;***      236 : 
	;***      237 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 237
	movw de, #0xFF07
	;***      238 : 	if (((I_ACID_L_PIN_FL1 == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 238
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
	;***      239 : 			& ((I_ACID_M_PIN_FL2 == 1) | (I_ACID_H_PIN_FL3 == 1)))
	;***      240 : 			| ((I_ACID_M_PIN_FL2 == 0) & (I_ACID_H_PIN_FL3 == 1))) {
	;***      241 : 		sendToRasPi_f(H_ALARM, ACID_SKIP_ERROR, 1);
	;***      242 : 
	;***      243 : 	}
	;***      244 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 244
	ret
.BB@LABEL@8_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 241
	movw de, #0x3F80
	movw ax, #0x410E
	br !!_sendToRasPi_f
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      245 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 245
	push hl
	;***      246 : 	if (((I_ALKALI_L_PIN_FL4 == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 246
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
	;***      247 : 			& ((I_ALKALI_M_PIN_FL5 == 1) | (I_ALKALI_H_PIN_FL6 == 1)))
	;***      248 : 			| ((I_ALKALI_M_PIN_FL5 == 0) & (I_ALKALI_H_PIN_FL6 == 1))) {
	;***      249 : 		sendToRasPi_f(H_ALARM, ALKALINE_SKIP_ERROR, 1);
	;***      250 : 	}
	;***      251 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 251
	ret
.BB@LABEL@9_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 249
	movw de, #0x3F80
	movw ax, #0x410F
	br !!_sendToRasPi_f
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      252 : 
	;***      253 : uint8_t FilterReplacementCheck(void) {
	;***      254 : 
	;***      255 : 	return 0;
	;***      256 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 256
	clrb a
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 4
	;***      257 : 
	;***      258 : // Newest
	;***      259 : void main_init_20211111(void) {
	;***      260 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 260
	call $!_UpdateMachineStatus
	;***      261 : 	//Skip
	;***      262 : 	while (DrainageAcidAndAlkalineTankStart_nostop()) {
	;***      263 : 		RaspberryCommunication_nostop();
	;***      264 : 		UpdateMachineStatus();
	;***      265 : 		R_WDT_Restart();
	;***      266 : 	}
	;***      267 : 
	;***      268 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 268
	call $!_UpdateMachineStatus
	;***      269 : 	if (g_control_setting.raw.power_on) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 269
	movw hl, #LOWW(_g_control_setting)
	bf [hl].1, $.BB@LABEL@11_3
.BB@LABEL@11_1:	; bb14
	;***      270 : 		while (WaterSupplyStart_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 270
	call $!_WaterSupplyStart_nostop
	cmp0 a
	bz $.BB@LABEL@11_3
.BB@LABEL@11_2:	; bb13
	;***      271 : 			realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 271
	call $!_realTimeResponse
	br $.BB@LABEL@11_1
.BB@LABEL@11_3:	; bb29
	;***      272 : 		}
	;***      273 : 	}
	;***      274 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	;***      275 : //		sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      276 : //				g_io_status.refined.FlowValue);
	;***      277 : 	}
	;***      278 : 	while (!ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 278
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@11_5
.BB@LABEL@11_4:	; bb28
	;***      279 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 279
	call $!_realTimeResponse
	br $.BB@LABEL@11_3
.BB@LABEL@11_5:	; return
	;***      280 : 	}
	;***      281 : 
	;***      282 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 282
	ret
_userAuthHandler_nostop:
	.STACK _userAuthHandler_nostop = 4
	;***      283 : 
	;***      284 : void userAuthHandler_nostop(void) {
	;***      285 : 	if ((g_control_setting.raw.biomectric == OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 285
	movw hl, #LOWW(_g_control_setting)
	bt [hl].3, $.BB@LABEL@12_4
.BB@LABEL@12_1:	; if_then_bb
	;***      286 : 		if (isHandSensorON() && g_machine_state.user == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 286
	call !!_isHandSensorON
	cmp0 a
	bz $.BB@LABEL@12_4
.BB@LABEL@12_2:	; bb
	cmp0 !LOWW(_g_machine_state+0x0000E)
	bnz $.BB@LABEL@12_4
.BB@LABEL@12_3:	; if_then_bb21
	;***      287 : 			if (g_commnunication_flag.send_response_flag != 1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 287
	mov a, !LOWW(_g_commnunication_flag)
	;***      288 : 					&& g_rasp_state.isMonitorScreen == 0) {
	;***      289 : //				sendToRasPi_u32(H_SET, START_WASHING, 0U);
	;***      290 : //				g_io_status.refined.io.HandSensorON = 1U;
	;***      291 : 			}
	;***      292 : 			g_machine_state.user = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 292
	oneb !LOWW(_g_machine_state+0x0000E)
.BB@LABEL@12_4:	; if_break_bb41
	;***      293 : 		}
	;***      294 : 	}
	;***      295 : 	if (g_machine_state.user == 1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 295
	cmp !LOWW(_g_machine_state+0x0000E), #0x01
	bnz $.BB@LABEL@12_14
.BB@LABEL@12_5:	; bb46
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@12_14
.BB@LABEL@12_6:	; if_then_bb59
	;***      296 : 			&& g_commnunication_flag.send_response_flag == 0) {
	;***      297 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 297
	mov a, !LOWW(_g_machine_mode)
	dec a
	bz $.BB@LABEL@12_11
.BB@LABEL@12_7:	; if_then_bb59
	dec a
	bz $.BB@LABEL@12_12
.BB@LABEL@12_8:	; if_then_bb59
	dec a
	bz $.BB@LABEL@12_13
.BB@LABEL@12_9:	; if_then_bb59
	dec a
	bnz $.BB@LABEL@12_14
.BB@LABEL@12_10:	; switch_clause_bb64
	;***      298 : 		case HAND_WASHING:
	;***      299 : 			HandWashingMode_nostop();
	;***      300 : 			break;
	;***      301 : 		case WATER_WASHING:
	;***      302 : 			WaterWashingMode_nostop();
	;***      303 : 			break;
	;***      304 : 		case ACID_WASHING:
	;***      305 : 			AcidWaterMode_nostop();
	;***      306 : 			break;
	;***      307 : 		case ALKALINE_WASHING:
	;***      308 : 			AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 308
	br !!_AlkalineWaterMode_nostop
.BB@LABEL@12_11:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 299
	br !!_HandWashingMode_nostop
.BB@LABEL@12_12:	; switch_clause_bb62
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 302
	br !!_WaterWashingMode_nostop
.BB@LABEL@12_13:	; switch_clause_bb63
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 305
	br !!_AcidWaterMode_nostop
.BB@LABEL@12_14:	; return
	;***      309 : 			break;
	;***      310 : 		default:
	;***      311 : 			break;
	;***      312 : 		}
	;***      313 : 	}
	;***      314 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 314
	ret
_ElectrolyzeWaterGeneration_nostop:
	.STACK _ElectrolyzeWaterGeneration_nostop = 4
	;***      315 : /*!
	;***      316 :  * Tested!
	;***      317 :  */
	;***      318 : void ElectrolyzeWaterGeneration_nostop(void) {
	;***      319 : //	if ((g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***      320 : //			&& (g_machine_state.mode == INDIE)) {
	;***      321 : //		if ((isAcidTankEmpty() || isAlkalineTankEmpty_nonstop()) && !levelSkipErrorCheck()) {
	;***      322 : //			// Start Electrolyte
	;***      323 : //			g_machine_state.mode = ELECTROLYTIC_GENERATION;
	;***      324 : //			//Stop what ever operation is happening
	;***      325 : //			g_machine_state.user = 0;
	;***      326 : //			g_machine_state.handwash = g_machine_state.water =
	;***      327 : //					g_machine_state.acid = g_machine_state.akaline = 0;
	;***      328 : //			O_ACID_PUMP_PIN_P1 = O_ALK_PUMP_PIN_P2 = OFF;
	;***      329 : //			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      330 : //
	;***      331 : //		}
	;***      332 : //	} else if (g_machine_state.mode == ELECTROLYTIC_GENERATION) {
	;***      333 : //		// Start Loop Electrolyte
	;***      334 : //		if (ElectrolyticOperation_nostop()) {
	;***      335 : //			O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      336 : //			g_machine_state.mode = INDIE;
	;***      337 : //			g_machine_state.user = 0;
	;***      338 : //			handSensorLED(BLACK);
	;***      339 : //			// Start Electrolyte Operation Off time keeper
	;***      340 : //		}
	;***      341 : //	}
	;***      342 : 
	;***      343 : 	//TODO: g_machine_state.mode == INDIE start electrolyte when hand washing done
	;***      344 : //	if ((g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***      345 : //			&& (g_machine_state.mode == INDIE)) {
	;***      346 : 	if (g_machine_state.electrolyte != ELECTROLYTIC_GENERATION) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 346
	cmp !LOWW(_g_machine_state+0x00010), #0x08
	bnz $.BB@LABEL@13_3
.BB@LABEL@13_1:	; if_then_bb43
	;***      347 : 		if (!levelSkipErrorCheck()
	;***      348 : 				&& (isAcidTankAlmostEmpty() || isAlkalineTankAlmostEmpty())) {
	;***      349 : 			// Start Electrolyte
	;***      350 : 			g_machine_state.electrolyte = ELECTROLYTIC_GENERATION;
	;***      351 : 			//TODO: Stop what ever operation is happening
	;***      352 : //			g_machine_state.user = 0;
	;***      353 : //			g_machine_state.handwash = g_machine_state.water =
	;***      354 : //					g_machine_state.acid = g_machine_state.akaline = 0;
	;***      355 : //			O_ACID_PUMP_PIN_P1 = O_ALK_PUMP_PIN_P2 = OFF;
	;***      356 : //			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      357 : 
	;***      358 : 		}
	;***      359 : 	} else if (g_machine_state.electrolyte == ELECTROLYTIC_GENERATION) {
	;***      360 : 		// Start Loop Electrolyte
	;***      361 : 		if (ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 361
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bz $.BB@LABEL@13_7
.BB@LABEL@13_2:	; if_then_bb49
	movw hl, #0xFF07
	movw ax, hl
	movw de, ax
	;***      362 : 			O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 362
	clr1 [hl].7
	mov a, [de]
	mov1 CY, a.7
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	;***      363 : 			g_machine_state.electrolyte = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 363
	clrb !LOWW(_g_machine_state+0x00010)
	br $.BB@LABEL@13_7
.BB@LABEL@13_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 347
	call !!_levelSkipErrorCheck
	cmp0 a
	bnz $.BB@LABEL@13_7
.BB@LABEL@13_4:	; bb12
	call !!_isAcidTankAlmostEmpty
	cmp0 a
	bnz $.BB@LABEL@13_6
.BB@LABEL@13_5:	; bb17
	call !!_isAlkalineTankAlmostEmpty
	cmp0 a
	skz
.BB@LABEL@13_6:	; if_then_bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 350
	mov !LOWW(_g_machine_state+0x00010), #0x08
.BB@LABEL@13_7:	; if_break_bb59
	;***      364 : //			g_machine_state.user = 0;
	;***      365 : //			handSensorLED(BLACK);
	;***      366 : 			// Start Electrolyte Operation Off time keeper
	;***      367 : 		}
	;***      368 : 	}
	;***      369 : 	realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 369
	br $!_realTimeResponse
_isSV1andSV2Off8h:
	.STACK _isSV1andSV2Off8h = 8
	;***      370 : }
	;***      371 : /*!
	;***      372 :  * Tested!
	;***      373 :  */
	;***      374 : uint8_t isSV1andSV2Off8h(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 374
	push hl
	;***      375 : 	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 375
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@14_5
.BB@LABEL@14_1:	; bb
	mov a, 0xFFF05
	bt a.5, $.BB@LABEL@14_5
.BB@LABEL@14_2:	; if_then_bb
	;***      376 : 		if (ns_delay_ms(&g_Tick.tickSV1SV2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 376
	movw ax, !LOWW(_g_timerSetting+0x00098)
	movw hl, ax
	movw bc, #0x0036
	mulh
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0009A)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 385
	ret
.BB@LABEL@14_5:	; if_else_bb
	;***      377 : 				(uint32_t) g_timerSetting.t39_cleaningIntervalTime_h * 60 * 60
	;***      378 : 						* 1000)) {
	;***      379 : 			return 1;
	;***      380 : 		}
	;***      381 : 	} else {
	;***      382 : 		g_Tick.tickSV1SV2 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 382
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00048), ax
	clrb a
	br $.BB@LABEL@14_4
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***      383 : 	}
	;***      384 : 	return 0;
	;***      385 : }
	;***      386 : /*!
	;***      387 :  * Tested!
	;***      388 :  */
	;***      389 : void CallanCleaningMode_nostop(void) {
	;***      390 : 	uint8_t *state = &g_machine_state.callan;
	;***      391 : 	uint32_t *tick = &g_Tick.tickCallan;
	;***      392 : 	if (isSV1andSV2Off8h() || (*state) != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 392
	call $!_isSV1andSV2Off8h
	cmp0 a
	bnz $.BB@LABEL@15_2
.BB@LABEL@15_1:	; bb
	cmp0 !LOWW(_g_machine_state+0x00006)
	bz $.BB@LABEL@15_8
.BB@LABEL@15_2:	; if_then_bb
	;***      393 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 393
	mov a, !LOWW(_g_machine_state+0x00006)
	cmp0 a
	bz $.BB@LABEL@15_5
.BB@LABEL@15_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@15_6
.BB@LABEL@15_4:	; switch_clause_bb37
	;***      394 : 		case 0:
	;***      395 : 			(*state)++;
	;***      396 : 			*tick = g_systemTime;
	;***      397 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      398 : 			g_machine_state.mode = CALLAN_MODE;
	;***      399 : 			break;
	;***      400 : 		case 1:
	;***      401 : 			handSensorLEDBlink(WHITE, 500);
	;***      402 : 			if (ns_delay_ms(tick,
	;***      403 : 					g_timerSetting.t40_washSpoutingTime_s * 1000)) {
	;***      404 : 				(*state)++;
	;***      405 : 				O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      406 : 				handSensorLED(BLACK);
	;***      407 : 				g_machine_state.mode = INDIE;
	;***      408 : 			}
	;***      409 : 			break;
	;***      410 : 		default:
	;***      411 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 411
	clrb !LOWW(_g_machine_state+0x00006)
	ret
.BB@LABEL@15_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 395
	inc a
	mov !LOWW(_g_machine_state+0x00006), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 396
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00062), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00060), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 397
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 398
	mov !LOWW(_g_machine_state+0x0000F), #0x09
	ret
.BB@LABEL@15_6:	; switch_clause_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 401
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	mov a, #0x02
	call !!_handSensorLEDBlink
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 402
	movw ax, !LOWW(_g_timerSetting+0x0009C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0009E)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 404
	inc !LOWW(_g_machine_state+0x00006)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 405
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 406
	clrb a
	call !!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 407
	clrb !LOWW(_g_machine_state+0x0000F)
.BB@LABEL@15_8:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 415
	ret
_DrainageMode_nostop:
	.STACK _DrainageMode_nostop = 14
	;***      412 : 			break;
	;***      413 : 		}
	;***      414 : 	}
	;***      415 : }
	;***      416 : /*!
	;***      417 :  * Tested!
	;***      418 :  */
	;***      419 : void DrainageMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 419
	subw sp, #0x06
	;***      420 : 	uint8_t *state = &g_machine_state.drainage;
	;***      421 : 	uint32_t *tick = &g_Tick.tickDrainage;
	;***      422 : 	if (g_machine_state.mode == DRAINAGE_MODE) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 422
	mov a, !LOWW(_g_machine_state+0x0000F)
	mov b, a
	cmp a, #0x0A
	.bnz $!.BB@LABEL@16_27
.BB@LABEL@16_1:	; if_then_bb
	;***      423 : 		// Start Drainage Loop
	;***      424 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 424
	mov a, !LOWW(_g_machine_state+0x00009)
	mov [sp+0x00], a
	cmp0 a
	.bz $!.BB@LABEL@16_25
.BB@LABEL@16_2:	; if_then_bb
	dec a
	bz $.BB@LABEL@16_9
.BB@LABEL@16_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@16_12
.BB@LABEL@16_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@16_19
.BB@LABEL@16_5:	; if_then_bb
	dec a
	.bz $!.BB@LABEL@16_22
.BB@LABEL@16_6:	; switch_clause_bb108
	;***      425 : 		case 0:
	;***      426 : 			if (DrainageAcidAndAlkalineTankStart_nostop() == 0) {
	;***      427 : 				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      428 : 				(*state)++;
	;***      429 : 			}
	;***      430 : 			break;
	;***      431 : 		case 1:
	;***      432 : 			if (ns_delay_ms(tick, 15 * 1000)) {
	;***      433 : 				(*state)++;
	;***      434 : 			}
	;***      435 : 			break;
	;***      436 : 		case 2:
	;***      437 : 			if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      438 : 					|| (g_io_status.refined.FlowValue
	;***      439 : 							> g_numberSetting.upperFlow)) {
	;***      440 : 				(*state)--;
	;***      441 : 			} else {
	;***      442 : 				(*state)++;
	;***      443 : 			}
	;***      444 : 			(*tick) = g_systemTime;
	;***      445 : 			break;
	;***      446 : 		case 3:
	;***      447 : 			if (ns_delay_ms(tick, 10 * 1000)) {
	;***      448 : 				electrolyticOperationON();
	;***      449 : 				(*state)++;
	;***      450 : 			}
	;***      451 : 			break;
	;***      452 : 		case 4:
	;***      453 : 			if (!levelSkipErrorCheck() && isAcidTankFull()
	;***      454 : 					&& isAlkalineTankFull()) {
	;***      455 : 				(*state)++;
	;***      456 : 			}
	;***      457 : 			break;
	;***      458 : 		default:
	;***      459 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 459
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@16_7:	; switch_clause_bb108.bb118_crit_edge
	oneb a
.BB@LABEL@16_8:	; bb118
	mov !LOWW(_g_machine_state+0x00008), a
	;***      460 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 460
	clrb !LOWW(_g_machine_state+0x00009)
	;***      461 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 461
	clrb !LOWW(_g_machine_state+0x0000F)
	br $.BB@LABEL@16_11
.BB@LABEL@16_9:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 432
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00064)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@16_10:	; switch_clause_bb18
	bnz $.BB@LABEL@16_21
.BB@LABEL@16_11:	; return
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 471
	ret
.BB@LABEL@16_12:	; switch_clause_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 437
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
	push ax
	movw bc, !LOWW(_g_io_status+0x00006)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x00004)
	movw [sp+0x06], ax
	call !!__COM_flt
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@16_15
.BB@LABEL@16_13:	; bb
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
	bnz $.BB@LABEL@16_15
.BB@LABEL@16_14:	; bb40.thread
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 442
	inc a
	br $.BB@LABEL@16_16
.BB@LABEL@16_15:	; bb40
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 440
	dec a
.BB@LABEL@16_16:	; if_break_bb52
	mov !LOWW(_g_machine_state+0x00009), a
.BB@LABEL@16_17:	; if_break_bb52
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00066), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00064), ax
.BB@LABEL@16_18:	; if_break_bb52
	br $.BB@LABEL@16_11
.BB@LABEL@16_19:	; switch_clause_bb55
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 447
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x00064)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@16_11
.BB@LABEL@16_20:	; if_then_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 448
	call !!_electrolyticOperationON
.BB@LABEL@16_21:	; if_then_bb61
	br $.BB@LABEL@16_26
.BB@LABEL@16_22:	; switch_clause_bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 453
	call !!_levelSkipErrorCheck
	cmp0 a
	bnz $.BB@LABEL@16_11
.BB@LABEL@16_23:	; bb77
	call !!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@16_18
.BB@LABEL@16_24:	; bb90
	call !!_isAlkalineTankFull
	cmp0 a
	br $.BB@LABEL@16_10
.BB@LABEL@16_25:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 427
	set1 0xFFF01.7
.BB@LABEL@16_26:	; if_then_bb103
	inc !LOWW(_g_machine_state+0x00009)
	br $.BB@LABEL@16_18
.BB@LABEL@16_27:	; if_else_bb123
	;***      462 : 			break;
	;***      463 : 		}
	;***      464 : 	} else if ((g_TimeKeeper.electrolyteOff_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 464
	mov a, !LOWW(_g_TimeKeeper@3)
	shrw ax, 8+0x00000
	movw de, ax
	clrw ax
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, de
	sknz
.BB@LABEL@16_28:	; if_else_bb123
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@16_29:	; if_else_bb123
	bc $.BB@LABEL@16_18
.BB@LABEL@16_30:	; bb129
	cmp0 !LOWW(_g_machine_state+0x0000A)
	bz $.BB@LABEL@16_18
.BB@LABEL@16_31:	; bb129
	cmp0 b
	bnz $.BB@LABEL@16_18
.BB@LABEL@16_32:	; if_then_bb154
	;***      465 : 			>= g_timerSetting.t6_drainageOffTime_h)
	;***      466 : 			&& (g_machine_state.isMidNight != 0)
	;***      467 : 			&& (g_machine_state.mode == INDIE)) {
	;***      468 : 		g_machine_state.mode = DRAINAGE_MODE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 468
	mov !LOWW(_g_machine_state+0x0000F), #0x0A
	br $.BB@LABEL@16_17
_NormalMode_nostop:
	.STACK _NormalMode_nostop = 6
	;***      469 : 		(*tick) = g_systemTime;
	;***      470 : 	}
	;***      471 : }
	;***      472 : /*!
	;***      473 :  * Tested!
	;***      474 :  */
	;***      475 : void NormalMode_nostop(void) {
	;***      476 : 	if ((g_machine_state.mode != BUSY)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 476
	mov a, !LOWW(_g_machine_state+0x0000F)
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
	;***      477 : 			&& (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***      478 : 			&& (g_machine_state.mode != CALLAN_MODE)
	;***      479 : 			&& (g_machine_state.mode != DRAINAGE_MODE)) {
	;***      480 : 		userAuthHandler_nostop();
	;***      481 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      482 : 	} else if (g_machine_state.mode == BUSY) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 482
	cmp a, #0x07
	bnz $.BB@LABEL@17_6
.BB@LABEL@17_4:	; if_then_bb44
	;***      483 : 		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 483
	movw ax, !LOWW(_g_timerSetting+0x00094)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00096)
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
	;***      484 : 				g_timerSetting.t38_washDischargeDelay_s * 1000)) {
	;***      485 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 485
	clrb !LOWW(_g_machine_state+0x0000F)
	;***      486 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 486
	clrb !LOWW(_g_machine_state+0x0000E)
.BB@LABEL@17_6:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 489
	ret
.BB@LABEL@17_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 480
	call $!_userAuthHandler_nostop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 481
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00028), ax
	ret
_TestPowerOn_nostop_keepstate:
	.STACK _TestPowerOn_nostop_keepstate = 8
	;***      487 : 		}
	;***      488 : 	}
	;***      489 : }
	;***      490 : /*!
	;***      491 :  * Power ON test mode, state 0 - 1, end at 2
	;***      492 :  * @param state: Machine state
	;***      493 :  * @param tick: Tick for no stop delay
	;***      494 :  * @return 0 when done
	;***      495 :  */
	;***      496 : uint8_t TestPowerOn_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 496
	push ax
	movw hl, ax
	push bc
	pop de
	;***      497 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 497
	mov a, [hl]
	cmp0 a
	bz $.BB@LABEL@18_5
.BB@LABEL@18_1:	; entry
	dec a
	bnz $.BB@LABEL@18_4
.BB@LABEL@18_2:	; switch_clause_bb70
	;***      498 : 	case 0:
	;***      499 : 		O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 = O_SPOUT_ACID_PIN_SV3 =
	;***      500 : 		O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 = O_DRAIN_ALK_PIN_SV6 =
	;***      501 : 		O_DRAIN_ALK_PIN_SV6 = O_OPTION_2_PIN_SV8 = O_OPTION_3_PIN_SV9 = ON;
	;***      502 : 		O_PUMP_SALT_PIN_SP1 = ON;
	;***      503 : 		(*tick) = g_systemTime;
	;***      504 : 		break;
	;***      505 : 	case 1:
	;***      506 : 		if (ns_delay_ms(tick, 30 * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 506
	movw ax, de
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@18_4
.BB@LABEL@18_3:	; if_then_bb
	movw de, #0xFF06
	;***      507 : 			O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 507
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
	;***      508 : 			O_SPOUT_ACID_PIN_SV3 =
	;***      509 : 			O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 =
	;***      510 : 			O_DRAIN_ALK_PIN_SV6 =
	;***      511 : 			O_DRAIN_ALK_PIN_SV6 = O_OPTION_2_PIN_SV8 =
	;***      512 : 			O_OPTION_3_PIN_SV9 = OFF;
	;***      513 : 			O_PUMP_SALT_PIN_SP1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 513
	clr1 [hl].0
	pop hl
	push hl
	;***      514 : 			(*state)++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 514
	inc [hl+0x00]
.BB@LABEL@18_4:	; if_then_bb
	br $.BB@LABEL@18_6
.BB@LABEL@18_5:	; switch_clause_bb
	movw hl, #0xFF06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 499
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 502
	set1 [hl].0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 503
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@18_6:	; switch_break_bb
	pop de
	push de
	;***      515 : 		}
	;***      516 : 		break;
	;***      517 : 	default:
	;***      518 : 		break;
	;***      519 : 	}
	;***      520 : 	return (*state) == 2 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 520
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
	;***      521 : }
	;***      522 : uint8_t FlowRateAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 522
	push bc
	push ax
	;***      523 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 523
	call !!_measureFlowSensor_nostop
	pop de
	push de
	;***      524 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 524
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
	;***      525 : 	case 2:
	;***      526 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      527 : 		(*state)++;
	;***      528 : 		(*tick) = g_systemTime;
	;***      529 : 		break;
	;***      530 : 	case 3:
	;***      531 : 		if (ns_delay_ms(tick, 30 * 1000)) {
	;***      532 : 			O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      533 : 			(*state)++;
	;***      534 : 		}
	;***      535 : 		break;
	;***      536 : 	case 4:
	;***      537 : 		if (ns_delay_ms(tick, 500)) {
	;***      538 : 			(*state)++;
	;***      539 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      540 : 		}
	;***      541 : 		break;
	;***      542 : 	case 5:
	;***      543 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 543
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 526
	set1 0xFFF05.5
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 527
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 528
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 531
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_11
.BB@LABEL@19_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 532
	set1 0xFFF01.7
	br $.BB@LABEL@19_5
.BB@LABEL@19_9:	; switch_clause_bb19
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 537
	movw de, #0x0000
	movw bc, #0x01F4
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_11
.BB@LABEL@19_10:	; if_then_bb25
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 538
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 539
	clr1 0xFFF05.5
.BB@LABEL@19_11:	; switch_break_bb
	pop de
	push de
	;***      544 : 				(uint32_t) 15 * 1000 + (uint32_t) 10 * 60 * 1000)) {
	;***      545 : 			(*state)++;
	;***      546 : 		}
	;***      547 : 		break;
	;***      548 : 	default:
	;***      549 : 		break;
	;***      550 : 	}
	;***      551 : 	return (*state) == 6 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 551
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
	;***      552 : }
	;***      553 : uint8_t CurrentAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 553
	movw de, ax
	push bc
	push ax
	;***      554 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 554
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
	;***      555 : 	case 6:
	;***      556 : 		electrolyticOperationON();
	;***      557 : 		(*state)++;
	;***      558 : 		break;
	;***      559 : 	case 7:
	;***      560 : 		if (ElectrolyticOperation_nostop()) {
	;***      561 : 			(*state)++;
	;***      562 : 			(*tick) = g_systemTime;
	;***      563 : 		}
	;***      564 : 		break;
	;***      565 : 	case 8:
	;***      566 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 566
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 556
	call !!_electrolyticOperationON
	br $.BB@LABEL@20_4
.BB@LABEL@20_6:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 560
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bz $.BB@LABEL@20_8
.BB@LABEL@20_7:	; if_then_bb
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 561
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 562
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
	;***      567 : 				(uint32_t) 15 * 1000 + (uint32_t) 10 * 60 * 1000)) {
	;***      568 : 			(*state)++;
	;***      569 : 		}
	;***      570 : 		break;
	;***      571 : 	default:
	;***      572 : 		break;
	;***      573 : 	}
	;***      574 : 	return (*state) == 9 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 574
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
	;***      575 : }
	;***      576 : uint8_t ElectrolyteAdjustmentOperation(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 576
	movw de, ax
	push ax
	push bc
	;***      577 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 577
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
	;***      578 : 	case 9:
	;***      579 : 		electrolyticOperationON();
	;***      580 : 		(*state)++;
	;***      581 : 		break;
	;***      582 : 	case 10:
	;***      583 : 		if (isAcidTankFull() && isAlkalineTankFull()) {
	;***      584 : 			electrolyticOperationOFF();
	;***      585 : 			(*tick) = g_systemTime;
	;***      586 : 			(*state)++;
	;***      587 : 		}
	;***      588 : 		break;
	;***      589 : 	case 11:
	;***      590 : 		if (ns_delay_ms(tick, (uint32_t) 10 * 60 * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 590
	movw de, #0x0009
	movw bc, #0x27C0
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@21_10
	br $.BB@LABEL@21_11
.BB@LABEL@21_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 579
	call !!_electrolyticOperationON
	br $.BB@LABEL@21_10
.BB@LABEL@21_5:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 583
	call !!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@21_11
.BB@LABEL@21_6:	; bb
	call !!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@21_11
.BB@LABEL@21_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 584
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@21_8:	; if_then_bb.bb32_crit_edge
	oneb a
.BB@LABEL@21_9:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 585
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
	;***      591 : 			(*state)++;
	;***      592 : 		}
	;***      593 : 		break;
	;***      594 : 	default:
	;***      595 : 		break;
	;***      596 : 	}
	;***      597 : 	return (*state);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 597
	mov a, [de]
	;***      598 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 598
	addw sp, #0x04
	ret
_TestOperation_nostop:
	.STACK _TestOperation_nostop = 4
	;***      599 : void TestOperation_nostop(void) {
	;***      600 : 	uint8_t *state = &g_machine_state.test_operation;
	;***      601 : 	uint32_t *tick = &g_Tick.tickTestOperation;
	;***      602 : 	switch (g_commnunication_flag.test_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 602
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
	;***      603 : 	case TEST_POWER_ON:
	;***      604 : 		if (TestPowerOn_nostop_keepstate(state, &g_Tick.tickTestOperation)) {
	;***      605 : 			g_commnunication_flag.test_flag = 0;
	;***      606 : 			*state = 0;
	;***      607 : 		}
	;***      608 : 		break;
	;***      609 : 	case TEST_FLOW_RATE:
	;***      610 : 		if (FlowRateAdjustmentMode_nostop_keepstate(state, tick)) {
	;***      611 : 			g_commnunication_flag.test_flag = 0;
	;***      612 : 			*state = 0;
	;***      613 : 		}
	;***      614 : 		break;
	;***      615 : 	case TEST_CURRENT:
	;***      616 : 		if (CurrentAdjustmentMode_nostop_keepstate(state, tick)) {
	;***      617 : 			g_commnunication_flag.test_flag = 0;
	;***      618 : 			*state = 0;
	;***      619 : 		}
	;***      620 : 		break;
	;***      621 : 	case TEST_INDIVIDUAL:
	;***      622 : 
	;***      623 : 		break;
	;***      624 : 	case TEST_ELECTROLYTIC:
	;***      625 : 		if (ElectrolyteAdjustmentOperation(state, tick)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 625
	movw bc, #LOWW(_g_Tick+0x00068)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_ElectrolyteAdjustmentOperation
	br $.BB@LABEL@22_8
.BB@LABEL@22_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 604
	movw bc, #LOWW(_g_Tick+0x00068)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_TestPowerOn_nostop_keepstate
	br $.BB@LABEL@22_8
.BB@LABEL@22_6:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 610
	movw bc, #LOWW(_g_Tick+0x00068)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_FlowRateAdjustmentMode_nostop_keepstate
	br $.BB@LABEL@22_8
.BB@LABEL@22_7:	; switch_clause_bb21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 616
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 633
	ret
_NeutralizationTreatment:
	.STACK _NeutralizationTreatment = 10
	;***      626 : 			g_commnunication_flag.test_flag = 0;
	;***      627 : 			*state = 0;
	;***      628 : 		}
	;***      629 : 		break;
	;***      630 : 	default:
	;***      631 : 		break;
	;***      632 : 	}
	;***      633 : }
	;***      634 : void NeutralizationTreatment(uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 634
	subw sp, #0x04
	movw hl, ax
	;***      635 : 	if (g_neutralization_time_s
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 635
	movw ax, !LOWW(_g_timerSetting+0x00068)
	movw bc, #0x0E10
	mulhu
	movw [sp+0x00], ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0006A)
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
	;***      636 : 			>= g_timerSetting.t27_neutralizationStartTime_h * 60 * 60) {
	;***      637 : 		g_machine_state.neutrlization = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 637
	oneb !LOWW(_g_machine_state+0x0000C)
	;***      638 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 638
	set1 0xFFF06.5
	clrw ax
	;***      639 : 		g_neutralization_time_s = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 639
	movw !LOWW(_g_neutralization_time_s+0x00002), ax
	movw !LOWW(_g_neutralization_time_s), ax
.BB@LABEL@23_4:	; if_break_bb
	;***      640 : 	}
	;***      641 : 	if (ns_delay_ms(tick, g_timerSetting.t28_neutralizationOpenTime_s * 1000)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 641
	movw ax, !LOWW(_g_timerSetting+0x0006C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, bc
	movw [sp+0x02], ax
	movw ax, !LOWW(_g_timerSetting+0x0006E)
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
	;***      642 : 			&& (g_machine_state.neutrlization != 0)) {
	;***      643 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 643
	set1 0xFFF06.5
	;***      644 : 		g_machine_state.neutrlization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 644
	clrb !LOWW(_g_machine_state+0x0000C)
.BB@LABEL@23_7:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 647
	ret
_main_loop_20211111:
	.STACK _main_loop_20211111 = 4
	;***      645 : 	}
	;***      646 : 
	;***      647 : }
	;***      648 : void main_loop_20211111(void) {
	;***      649 : 	realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 649
	call $!_realTimeResponse
	;***      650 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 650
	call !!_measureFlowSensor_nostop
	;***      651 : 
	;***      652 : 	if (g_machine_state.test_operation != TESTING_MODE_START) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 652
	cmp !LOWW(_g_machine_state+0x0000B), #0x1A
	bz $.BB@LABEL@24_2
.BB@LABEL@24_1:	; if_then_bb
	;***      653 : //		DrainageMode_nostop();
	;***      654 : 		// Check Acid and Alkaline tank to make Electrolytic Water
	;***      655 : 		ElectrolyzeWaterGeneration_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 655
	call $!_ElectrolyzeWaterGeneration_nostop
	;***      656 : 		// Cleaning handler
	;***      657 : 		CallanCleaningMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 657
	call $!_CallanCleaningMode_nostop
	;***      658 : 		// Washing handler
	;***      659 : 		NormalMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 659
	call $!_NormalMode_nostop
	;***      660 : 
	;***      661 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 661
	call $!_realTimeResponse
.BB@LABEL@24_2:	; if_break_bb
	;***      662 : 	} else {
	;***      663 : 
	;***      664 : 	}
	;***      665 : 
	;***      666 : 	levelSkipErrorCheck();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 666
	call !!_levelSkipErrorCheck
	;***      667 : 	if (isAcidTankEmpty() && isAlkalineTankEmpty_nonstop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 667
	call !!_isAcidTankEmpty
	cmp0 a
	bz $.BB@LABEL@24_4
.BB@LABEL@24_3:	; bb
	call !!_isAlkalineTankEmpty_nonstop
	cmp0 a
	;***      668 : 		handSensorLEDBlink(WHITE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 668
	mov a, #0x02
	bnz $.BB@LABEL@24_8
.BB@LABEL@24_4:	; if_else_bb23
	;***      669 : 	} else if (isAcidTankEmpty()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 669
	call !!_isAcidTankEmpty
	cmp0 a
	bnz $.BB@LABEL@24_9
.BB@LABEL@24_5:	; if_else_bb30
	;***      670 : 		handSensorLEDBlink(RED, 100);
	;***      671 : 	} else if (isAlkalineTankEmpty_nonstop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 671
	call !!_isAlkalineTankEmpty_nonstop
	cmp0 a
	sknz
.BB@LABEL@24_6:	; if_else_bb37
	;***      672 : 		handSensorLEDBlink(BLUE, 100);
	;***      673 : 	} else {
	;***      674 : 		HandSensorLEDEndBlink();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 674
	br !!_HandSensorLEDEndBlink
.BB@LABEL@24_7:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 672
	mov a, #0x03
.BB@LABEL@24_8:	; if_then_bb36
	movw de, #0x0000
	movw bc, #0x0064
	br !!_handSensorLEDBlink
.BB@LABEL@24_9:	; if_then_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 670
	oneb a
	br $.BB@LABEL@24_8
_realTimeResponse:
	.STACK _realTimeResponse = 4
	;***      675 : 	}
	;***      676 : }
	;***      677 : 
	;***      678 : void realTimeResponse(void) {
	;***      679 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 679
	call $!_UpdateMachineStatus
	;***      680 : 	RaspberryCommunication_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 680
	call !!_RaspberryCommunication_nostop
	;***      681 : 	isElectrolyticOperationOFF_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 681
	call !!_isElectrolyticOperationOFF_nostop
	;***      682 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 682
	call !!_measureFlowSensor_nostop
	;***      683 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 683
	br !!_R_WDT_Restart
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***      684 : //	if (ns_delay_ms(&g_Tick.tickCustom[0], 200)) {
	;***      685 : //		P6_bit.no3 = ~P6_bit.no3;
	;***      686 : //	}
	;***      687 : 
	;***      688 : 	//TODO: Error Checking
	;***      689 : //	if (O_SUPPLY_WATER_PIN_SV1 == ON || O_SPOUT_WATER_PIN_SV2 == ON) {
	;***      690 : //		if (ns_delay_ms(&g_Tick.tickSV1SV2, 1000)) {
	;***      691 : //			g_TimeKeeper.SV1SV2OnTime_s++;
	;***      692 : //			if (g_TimeKeeper.SV1SV2OnTime_s >= 60 * 60) {
	;***      693 : //				g_TimeKeeper.SV1SV2OnTime_s -= 3600;
	;***      694 : //				g_TimeKeeper.SV1SV2OnTime_h++;
	;***      695 : //				//TODO: Save to EEPROM both s and h
	;***      696 : //				filterReplacementErrorCheck();
	;***      697 : //			}
	;***      698 : //		}
	;***      699 : //	} else
	;***      700 : //		g_Tick.tickSV1SV2 = g_systemTime;
	;***      701 : }
	;***      702 : 
	;***      703 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 703
	push hl
	;***      704 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***      705 : 		pre_machine_washing_mode = g_machine_state.mode;
	;***      706 : 	g_io_status.refined.io.AcidEmptyLevel = I_ACID_L_PIN_FL1 == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 706
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@26_2
.BB@LABEL@26_1:	; bb11
	clrb x
.BB@LABEL@26_2:	; bb12
	;***      707 : 	g_io_status.refined.io.AcidLowLevel = I_ACID_M_PIN_FL2 == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 707
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@26_4
.BB@LABEL@26_3:	; bb28
	clrb c
.BB@LABEL@26_4:	; bb30
	;***      708 : 	g_io_status.refined.io.AcidHighLevel = I_ACID_H_PIN_FL3 == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 708
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
	;***      709 : 	g_mean_io_status.refined.io.AcidLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 709
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
	;***      710 : 	I_ACID_M_PIN_FL2 == I_ON ? g_mean_io_status.refined.io.AcidLowLevel : 0;
	;***      711 : 	g_mean_io_status.refined.io.AcidHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 711
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
	;***      712 : 	I_ACID_H_PIN_FL3 == I_ON ? g_mean_io_status.refined.io.AcidHighLevel : 0;
	;***      713 : 
	;***      714 : 	g_io_status.refined.io.AlkalineEmptyLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 714
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@26_12
.BB@LABEL@26_11:	; bb109
	clrb x
.BB@LABEL@26_12:	; bb111
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***      715 : 			I_ALKALI_L_PIN_FL4 == I_ON ? 1 : 0;
	;***      716 : 	g_io_status.refined.io.AlkalineLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 716
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@26_14
.BB@LABEL@26_13:	; bb126
	clrb b
.BB@LABEL@26_14:	; bb128
	mov a, c
	or a, x
	mov c, a
	;***      717 : 			I_ALKALI_M_PIN_FL5 == I_ON ? 1 : 0;
	;***      718 : 	g_io_status.refined.io.AlkalineHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 718
	mov a, 0xFFF07
	mov x, #0x04
	bf a.0, $.BB@LABEL@26_16
.BB@LABEL@26_15:	; bb144
	clrb x
.BB@LABEL@26_16:	; bb146
	mov a, c
	or a, b
	mov c, a
	;***      719 : 			I_ALKALI_H_PIN_FL6 == I_ON ? 1 : 0;
	;***      720 : //	g_mean_io_status.refined.io.AlkalineLowLevel =
	;***      721 : //	I_ALKALI_M_PIN_FL5 == I_ON ? g_mean_io_status.refined.io.AlkalineLowLevel : 0;
	;***      722 : //	g_mean_io_status.refined.io.AlkalineHighLevel =
	;***      723 : //	I_ALKALI_H_PIN_FL6 == I_ON ? g_mean_io_status.refined.io.AlkalineHighLevel : 0;
	;***      724 : 
	;***      725 : 	g_io_status.refined.io.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 725
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@26_18
.BB@LABEL@26_17:	; bb162
	clrb b
.BB@LABEL@26_18:	; bb164
	mov a, c
	or a, x
	mov c, a
	;***      726 : 	g_io_status.refined.io.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 726
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
	;***      727 : 
	;***      728 : 	g_io_status.refined.io.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 728
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***      729 : 	g_io_status.refined.io.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 729
	mov x, 0xFFF05
	;***      730 : 	g_io_status.refined.io.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 730
	mov c, 0xFFF07
	;***      731 : 	g_io_status.refined.io.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 731
	mov a, 0xFFF07
	mov h, a
	;***      732 : 	g_io_status.refined.io.Valve.SV5 = g_io_status.refined.io.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 732
	mov a, [de]
	mov l, a
	;***      733 : 	O_DRAIN_ACID_PIN_SV5;
	;***      734 : 	g_io_status.refined.io.Valve.SV6 = g_io_status.refined.io.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 734
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 728
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 729
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 730
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 731
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 732
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***      735 : 	O_DRAIN_ALK_PIN_SV6;
	;***      736 : 	g_io_status.refined.io.Valve.SV7 = O_NEUTRALIZE_PIN_SV7;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 736
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 732
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 736
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 734
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 736
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***      737 : 
	;***      738 : 	g_io_status.refined.io.Pump1 = O_ACID_PUMP_PIN_P1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 738
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***      739 : 	g_io_status.refined.io.Pump2 = O_ALK_PUMP_PIN_P2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 739
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***      740 : 	g_io_status.refined.io.SaltPump = O_PUMP_SALT_PIN_SP1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 740
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
	;***      741 : }
	;***      742 : 
	;***      743 : void manufactureReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 743
	clrw ax
	;***      744 : 	g_timerSetting.t1_initialWaterDrainageOperation_s = 60;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 744
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***      745 : 	g_timerSetting.t2_flowSensorStartTime_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 745
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***      746 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 746
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***      747 : 	g_timerSetting.t4_electrolysisOperationStart_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 747
	movw !LOWW(_g_timerSetting+0x0000E), ax
	;***      748 : 	g_timerSetting.t5_electrolysisStopDelay_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 748
	movw !LOWW(_g_timerSetting+0x00012), ax
	;***      749 : 	g_timerSetting.t6_drainageOffTime_h = 168;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 749
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***      750 : 	g_timerSetting.t7_powerOnPreparation_s = 600;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 750
	movw !LOWW(_g_timerSetting+0x0001A), ax
	;***      751 : 	g_timerSetting.t8_flowRateAdjustmentRelease_s = 600;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 751
	movw !LOWW(_g_timerSetting+0x0001E), ax
	;***      752 : 	g_timerSetting.t9_currentAdjustmentRelease_s = 600;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 752
	movw !LOWW(_g_timerSetting+0x00022), ax
	;***      753 : 
	;***      754 : 	g_timerSetting.t10_electrolysisCurrentAlarmSpecified_s = 60;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 754
	movw !LOWW(_g_timerSetting+0x00026), ax
	;***      755 : 	g_timerSetting.t11_overVoltage1Time_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 755
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***      756 : 	g_timerSetting.t12_overVoltage2Time_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 756
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***      757 : 	g_timerSetting.t13_overVoltage3Time_s = 20;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 757
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***      758 : 	g_timerSetting.t14_lowVoltageStartTime_s = 60;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 758
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***      759 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 759
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***      760 : 	g_timerSetting.t16_currentMonitoringStart_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 760
	movw !LOWW(_g_timerSetting+0x0003E), ax
	;***      761 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 761
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***      762 : 	g_timerSetting.t18_fullSaltWaterMonitoringStart_h = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 762
	movw !LOWW(_g_timerSetting+0x00046), ax
	;***      763 : 	g_timerSetting.t19_waterFilterAlarm_h = 4000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 763
	movw !LOWW(_g_timerSetting+0x0004A), ax
	;***      764 : 
	;***      765 : 	g_timerSetting.t20_waterFilterAlarmIgnore_h = 4800;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 765
	movw !LOWW(_g_timerSetting+0x0004E), ax
	;***      766 : 	g_timerSetting.t21_onDelayEmptyLevel_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 766
	movw !LOWW(_g_timerSetting+0x00052), ax
	;***      767 : 	g_timerSetting.t22_onDelayLowLevel_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 767
	movw !LOWW(_g_timerSetting+0x00056), ax
	;***      768 : 	g_timerSetting.t23_onDelayHighLevel_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 768
	movw !LOWW(_g_timerSetting+0x0005A), ax
	;***      769 : 
	;***      770 : 	g_timerSetting.t24_offDelayEmptyLevel_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 770
	movw !LOWW(_g_timerSetting+0x0005E), ax
	;***      771 : 	g_timerSetting.t25_saltLowLevelDelay_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 771
	movw !LOWW(_g_timerSetting+0x00062), ax
	;***      772 : 	g_timerSetting.t26_saltHighLevelDelay_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 772
	movw !LOWW(_g_timerSetting+0x00066), ax
	;***      773 : 	g_timerSetting.t27_neutralizationStartTime_h = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 773
	movw !LOWW(_g_timerSetting+0x0006A), ax
	;***      774 : 	g_timerSetting.t28_neutralizationOpenTime_s = 300;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 774
	movw !LOWW(_g_timerSetting+0x0006E), ax
	;***      775 : 
	;***      776 : 	g_timerSetting.t29_alkalineWaterSpoutingTime_s = 15;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 776
	movw !LOWW(_g_timerSetting+0x00072), ax
	;***      777 : 	g_timerSetting.t30_acidWaterSpoutingTime_s = 15;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 777
	movw !LOWW(_g_timerSetting+0x00076), ax
	;***      778 : 	g_timerSetting.t31_washingWaterSpoutingTime_s = 15;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 778
	movw !LOWW(_g_timerSetting+0x0007A), ax
	;***      779 : 	g_timerSetting.t32_overLapTime_ms = 0.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 779
	movw !LOWW(_g_timerSetting+0x0007E), ax
	movw !LOWW(_g_timerSetting+0x0007C), ax
	;***      780 : 	g_timerSetting.t38_washDischargeDelay_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 780
	movw !LOWW(_g_timerSetting+0x00096), ax
	;***      781 : 	g_timerSetting.t34_acidWaterDownTime_s = 300;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 781
	movw !LOWW(_g_timerSetting+0x00086), ax
	;***      782 : 	g_timerSetting.t35_alkalineWaterDownTime_s = 300;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 782
	movw !LOWW(_g_timerSetting+0x0008A), ax
	;***      783 : 
	;***      784 : 	g_timerSetting.t39_cleaningIntervalTime_h = 8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 784
	movw !LOWW(_g_timerSetting+0x0009A), ax
	;***      785 : 	g_timerSetting.t40_washSpoutingTime_s = 30;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 785
	movw !LOWW(_g_timerSetting+0x0009E), ax
	;***      786 : 
	;***      787 : 	g_numberSetting.upperVoltage1 = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 787
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw !LOWW(_g_numberSetting), ax
	;***      788 : 	g_numberSetting.upperVoltage2 = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 788
	movw !LOWW(_g_numberSetting+0x00006), ax
	movw !LOWW(_g_numberSetting+0x00004), ax
	;***      789 : 	g_numberSetting.upperVoltage3 = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 789
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw !LOWW(_g_numberSetting+0x00008), ax
	;***      790 : 	g_numberSetting.upperFlow = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 790
	movw !LOWW(_g_numberSetting+0x0001A), ax
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***      791 : 	g_numberSetting.upperCurrent = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 791
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw !LOWW(_g_numberSetting+0x00010), ax
	;***      792 : 	g_numberSetting.saltPumpVoltage = 1.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 792
	movw !LOWW(_g_numberSetting+0x00024), ax
	;***      793 : 	g_numberSetting.lowerVoltage = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 793
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw !LOWW(_g_numberSetting+0x0000C), ax
	;***      794 : 	g_numberSetting.lowerFlow = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 794
	movw !LOWW(_g_numberSetting+0x0001E), ax
	movw !LOWW(_g_numberSetting+0x0001C), ax
	;***      795 : 	g_numberSetting.lowerCurrent = 0.0f;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 795
	movw !LOWW(_g_numberSetting+0x00016), ax
	movw !LOWW(_g_numberSetting+0x00014), ax
	;***      796 : 	g_numberSetting.cvccCurrent = 1.0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 796
	movw !LOWW(_g_numberSetting+0x00020), ax
	mov x, #0x3C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 744
	movw !LOWW(_g_timerSetting), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 754
	movw !LOWW(_g_timerSetting+0x00024), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 758
	movw !LOWW(_g_timerSetting+0x00034), ax
	mov x, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 745
	movw !LOWW(_g_timerSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 747
	movw !LOWW(_g_timerSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 756
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 759
	movw !LOWW(_g_timerSetting+0x00038), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 761
	movw !LOWW(_g_timerSetting+0x00040), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 770
	movw !LOWW(_g_timerSetting+0x0005C), ax
	mov x, #0x05
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 746
	movw !LOWW(_g_timerSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 748
	movw !LOWW(_g_timerSetting+0x00010), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 755
	movw !LOWW(_g_timerSetting+0x00028), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 760
	movw !LOWW(_g_timerSetting+0x0003C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 766
	movw !LOWW(_g_timerSetting+0x00050), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 767
	movw !LOWW(_g_timerSetting+0x00054), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 768
	movw !LOWW(_g_timerSetting+0x00058), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 771
	movw !LOWW(_g_timerSetting+0x00060), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 772
	movw !LOWW(_g_timerSetting+0x00064), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 780
	movw !LOWW(_g_timerSetting+0x00094), ax
	mov x, #0xA8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 749
	movw !LOWW(_g_timerSetting+0x00014), ax
	movw ax, #0x0258
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 750
	movw !LOWW(_g_timerSetting+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 751
	movw !LOWW(_g_timerSetting+0x0001C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 752
	movw !LOWW(_g_timerSetting+0x00020), ax
	movw ax, #0x0014
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 757
	movw !LOWW(_g_timerSetting+0x00030), ax
	mov x, #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 762
	movw !LOWW(_g_timerSetting+0x00044), ax
	movw ax, #0x0FA0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 763
	movw !LOWW(_g_timerSetting+0x00048), ax
	movw ax, #0x12C0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 765
	movw !LOWW(_g_timerSetting+0x0004C), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 773
	movw !LOWW(_g_timerSetting+0x00068), ax
	movw ax, #0x012C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 774
	movw !LOWW(_g_timerSetting+0x0006C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 781
	movw !LOWW(_g_timerSetting+0x00084), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 782
	movw !LOWW(_g_timerSetting+0x00088), ax
	movw ax, #0x000F
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 776
	movw !LOWW(_g_timerSetting+0x00070), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 777
	movw !LOWW(_g_timerSetting+0x00074), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 778
	movw !LOWW(_g_timerSetting+0x00078), ax
	mov x, #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 784
	movw !LOWW(_g_timerSetting+0x00098), ax
	mov x, #0x1E
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 785
	movw !LOWW(_g_timerSetting+0x0009C), ax
	movw ax, #0x3F80
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 792
	movw !LOWW(_g_numberSetting+0x00026), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 796
	movw !LOWW(_g_numberSetting+0x00022), ax
	clrw ax
	;***      797 : 	EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 797
	push ax
	mov x, #0xA1
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	clrw ax
	;***      798 : 			timeSettingSize);
	;***      799 : 	EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/hwm_main.c", 799
	push ax
	mov x, #0x29
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	ret
	;***      800 : 			numberSettingSize);
	;***      801 : 
	;***      802 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TimeKeeper@3:
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
	.DS (17)
	.ALIGN 2
_g_io_status:
	.DS (16)
	.ALIGN 2
_g_mean_io_status:
	.DS (16)
	.ALIGN 2
_g_res_io_status:
	.DS (16)
	.ALIGN 2
__settingTime:
	.DS (162)
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
	.DS (196)
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
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (1)
	.DS (1)
