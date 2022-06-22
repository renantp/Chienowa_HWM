/*
 * raspberry_pi_interface.c
 *
 *  Created on: 6 Jan 2022
 *      Author: Renan
 */

#include "rasberry_pi_interface.h"

/**
 * Handle all response to Raspberry command.
 */
uint8_t *const time_setting_p = (uint8_t*) &_settingTime;
uint8_t *const number_setting_p = (uint8_t*) &_settingNumber;
struct UART_Buffer_float_s test_control_buf = { H_READ, READ_TIME, 0x000000ff };
struct IO_Struct g_io_response, io_off;
union Control_u g_control_setting;
int8_t save_spec_ok = 0;

// ------------------ LOCAL FUNCTION -------------------------------
uint8_t ResponseHandler(void);
uint8_t userAuthResponse(void);
void ResponseWashingMode(void);
uint8_t ResponseNextAnimation(void);
void MonitoringStatus(void);
uint8_t TestIndividual(void);
void ControlSetttingReponse(void);
uint8_t SendTimeSetting(void);
uint8_t SendNumberSetting(void);
uint8_t GetAndSaveTimeSetting(void);
uint8_t GetAndSaveNumberSetting(void);
uint8_t TestMode(void);
struct Flag_response {
	uint8_t time;
	uint8_t number;
	uint8_t mode;
	uint8_t alarm;
} flag_response;
/**
 * After send
 */
void AlarmResponse(void) {
	if (g_commnunication_flag.alarm_response_flag == 1
			&& g_commnunication_flag.send_response_flag == 0) {
		//TODO: Send alarm data
		R_UART2_Send((uint8_t*) &g_alarm, 3);
		flag_response.alarm++;
		g_commnunication_flag.alarm_response_flag = 0U;
	}
}
void SaveComfirmResponse(void) {
	if (g_commnunication_flag.save_confirm_flag && save_spec_ok != 0) {
		sendToRasPi_Revert_i32(H_SET, OK_ALL, (int32_t) (save_spec_ok));
		save_spec_ok = 0;
		g_commnunication_flag.save_confirm_flag = 0;
	}
}
void HandsensorResponse(void) {
	if (g_commnunication_flag.send_handsensor_flag == 1) {
		sendToRasPi_u32(H_READ, START_WASHING, 1);
		g_commnunication_flag.send_handsensor_flag = 0;
	}
}

//------------------- EXTERNAL FUNCTION ----------------------------------
void RaspberryCommunication_nostop(void) {
	if (ResponseHandler()) {

	} else {

	}
	userAuthResponse();
	SendTimeSetting();
	SendNumberSetting();
	ResponseWashingMode();
	ResponseNextAnimation();
	ControlSetttingReponse();
	GetAndSaveTimeSetting();
	GetAndSaveNumberSetting();
	SaveComfirmResponse();
	TestIndividual();
	MonitoringStatus();
	TestMode();
	AlarmResponse();
	//Auto reset UART after 5s not get data
	if (ns_delay_ms(&g_Tick.tickUartTimeout, 2000)) {
		R_UART2_Stop();
		g_animation_queue = 0;
	} else if (STMK2 == 1U && ns_delay_ms(&g_Tick.tickUartTimeout, 50)) {
		R_UART2_Start();
		R_UART2_Receive(g_rx_data, 6);
	}
}

void sendToRasPi_f(enum UART_header_e head, enum Control_status type,
		float value) {
	uint8_t state = g_uart2_sendend;
	g_control_buffer_f.head = head;
	g_control_buffer_f.set_number = type;
	g_control_buffer_f.set_value = value;
	R_UART2_Send((uint8_t*) &g_control_buffer_f, 6);
	while (state == g_uart2_sendend)
		;
}
void sendToRasPi_u32(enum UART_header_e head, enum Control_status type,
		uint32_t value) {
	uint8_t state = g_uart2_sendend;
	g_control_buffer_u32.head = head;
	g_control_buffer_u32.set_number = type;
	g_control_buffer_u32.set_value = value;
	R_UART2_Send((uint8_t*) &g_control_buffer_u32, 6);
	while (state == g_uart2_sendend)
		;
}
union Revert_Byte {
	struct {
		int8_t byte[4];
	} refined;
	int32_t raw;
};
void sendToRasPi_Revert_i32(enum UART_header_e head, enum Control_status type,
		int32_t value) {
	union Revert_Byte data;
	uint8_t state = g_uart2_sendend;
	data.refined.byte[3] = value;
	data.refined.byte[2] = value >> 8;
	data.refined.byte[1] = value >> 16;
	data.refined.byte[0] = value >> 24;
	g_control_buffer_i32.head = head;
	g_control_buffer_i32.set_number = type;
	g_control_buffer_i32.set_value = data.raw;
	R_UART2_Send((uint8_t*) &g_control_buffer_i32, 6);
	while (state == g_uart2_sendend)
		;
}
/**
 * Wait for Raspberry Pi send {H_CLEAR, alarm, x}
 * @param alarm
 * @param timeout_s Timeout if timeout_s != 0
 */
void waitAlarmConfirm_stop(enum Control_status alarm, uint8_t timeout_s) {
	uint32_t _tick = g_systemTime;
	while (g_commnunication_flag.alarm_clear_flag != alarm) {
		realTimeResponse();
		if ((timeout_s != 0)
				&& (ns_delay_ms(&_tick, (uint32_t) timeout_s * 1000))) {
			break;
		}
	}
	sendToRasPi_u32(H_CLEAR, alarm, (uint32_t) 0);
	g_commnunication_flag.alarm_clear_flag = 0;
}
/**
 *
 * @param alarm
 * @return 0 - Done; 1 - Still wait
 */
uint8_t waitAlarmConfirm_nonstop(enum Control_status alarm) {
	if (g_commnunication_flag.alarm_clear_flag != alarm) {
		return 1;
	}
	g_commnunication_flag.alarm_clear_flag = OK_ALL;
	return 0;
}
void resetAlarm(void) {
	g_commnunication_flag.alarm_clear_flag = 1;
}
//------------------End of EXTERNAL FUNCTION -----------------------------
//------------------ Internal Function------------------------------------
/**
 * Send response Command to Raspberry Pi
 * @return 1 - Have a response, 0 - Not response
 */
uint8_t ResponseHandler(void) {
	if (g_commnunication_flag.send_response_flag) {
		uint8_t state = g_uart2_sendend;
		R_UART2_Send(g_rx_data, 6);
		g_commnunication_flag.send_response_flag = 0;

		while (state == g_uart2_sendend) {
		}
		return 1U;
	}
	return 0U;
}

uint8_t userAuthResponse(void) {
	if (g_machine_state.user == 2 && g_commnunication_flag.send_response_flag == 0U) {
//		if(g_commnunication_flag.send_response_flag == 0U &&
//				g_machine_state.mode != ELECTROLYTIC_GENERATION
//				&& g_machine_state.mode != WASHING_MODE){

//		if (g_commnunication_flag.send_response_flag == 0U
//				&& g_machine_state.mode == INDIE) {
//			g_machine_state.user = 1;
//			sendToRasPi_u32(H_SET, OK_USER, (uint32_t) 0x01 << (8 * 3));
//		} else {
//			g_machine_state.user = 0;
//			sendToRasPi_u32(H_SET, OK_USER, (uint32_t) 0x00 << (8 * 3));
//		}

		if (g_machine_state.mode != WASHING_MODE){
			g_machine_state.user = 1;
			sendToRasPi_u32(H_SET, OK_USER, (uint32_t) 0x01 << (8 * 3));
		}else{
			g_machine_state.user = 0;
			sendToRasPi_u32(H_SET, OK_USER, (uint32_t) 0x00 << (8 * 3));
		}
		return 1;
	}
	return 0;
}
void ResponseWashingMode(void) {
	if (g_commnunication_flag.send_response_mode_flag == 1) {
		sendToRasPi_u32(H_READ, WASHING_MODE,
				(uint32_t) g_machine_mode << (8 * 3));
		g_commnunication_flag.send_response_mode_flag = 0;
	}
}
uint8_t ResponseNextAnimation(void) {
	if (g_commnunication_flag.send_response_flag == 0
			&& g_commnunication_flag.next_animation_flag == 1) {
		sendToRasPi_u32(H_READ, NEXT_ANIMATION,
				(uint32_t) g_animation_queue << (8 * 3));
		g_animation_queue =
				g_animation_queue > 0 ?
						g_animation_queue - 1 : g_animation_queue;
		g_commnunication_flag.next_animation_flag = 0;
		return 1U;
	}
	return 0U;
}
void MonitoringStatus(void) {
	if (g_commnunication_flag.send_response_status_flag == 1
			&& g_commnunication_flag.send_response_flag == 0) {
		uint8_t state = g_uart2_sendend;
		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		g_commnunication_flag.send_response_status_flag = 0;
	}
}
uint8_t TestIndividual(void) {
	if (g_commnunication_flag.recieve_status_flag == 2
			&& g_commnunication_flag.send_response_flag == 0) {
		if (g_commnunication_flag.test_enable_flag == 1) {
			uint8_t *const _io_p = (uint8_t*) &g_io_response.Valve;
			for (uint8_t i = 0; i < 3; i++) {
				_io_p[i] = g_rx_data[i];
			}
			OutputIO(&g_io_response);
		}
		g_commnunication_flag.recieve_status_flag = 0;
		return 1U;
	}
	return 0U;
}

void ControlSetttingReponse(void) {
	const enum UART_header_e header =
			g_commnunication_flag.control_setting_save_flag == 1 ?
					H_SET : H_READ;
	if (g_commnunication_flag.control_setting_flag != 0) {
		switch (g_commnunication_flag.control_setting_flag) {
		case DRAINAGE_MODE_SET:
			sendToRasPi_u32(header, DRAINAGE_MODE_SET,
					(uint32_t) g_control_setting.raw.drain << (8 * 3));
			break;
		case POWER_ON_TEST_SET:
			sendToRasPi_u32(header, POWER_ON_TEST_SET,
					(uint32_t) g_control_setting.raw.power_on << (8 * 3));
			break;
		case WATER_FILTER_SET:
			sendToRasPi_u32(header, WATER_FILTER_SET,
					(uint32_t) g_control_setting.raw.filter << (8 * 3));
			break;
		case BIOMETRIC_SET:
			sendToRasPi_u32(header, BIOMETRIC_SET,
					(uint32_t) g_control_setting.raw.biomectric << (8 * 3));
			break;
		case CONTROL_SETTING:
			sendToRasPi_Revert_i32(H_READ, CONTROL_SETTING,
					(int32_t) g_control_setting.data);
			break;
		default:
			break;
		}
		g_commnunication_flag.control_setting_flag = 0;
	}

	if (g_commnunication_flag.control_setting_save_flag == 1) {
		EE_SPI_Write((uint8_t*) &g_control_setting.data,
		NUMBER_SETTING_ADDRESS + numberSettingSize,
				sizeof(g_control_setting.data));
		g_commnunication_flag.control_setting_save_flag = 0;
	}

}
uint8_t TestMode(void) {
	if (g_commnunication_flag.test_flag == TESTING_MODE_START) {
		g_commnunication_flag.test_flag = 0U;
		sendToRasPi_u32(H_SET, TESTING_MODE_START, 0x0000);
		return 1U;
	} else if (g_commnunication_flag.test_flag == TESTING_MODE_STOP) {
		g_commnunication_flag.test_flag = 0U;
		sendToRasPi_u32(H_SET, TESTING_MODE_STOP, 0x0000);
		OutputIO(&io_off);
	}
	return 0;
}

uint8_t SendTimeSetting(void) {
	if (g_commnunication_flag.send_response_time_flag
			&& (g_commnunication_flag.send_response_flag == 0)) {
		uint8_t state = g_uart2_sendend;
		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
				timeSettingSize - 1);
		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
		flag_response.time++;
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		g_commnunication_flag.send_response_time_flag = 0;
		return 1U;
	}
	return 0U;
}
uint8_t SendNumberSetting(void) {
	if (g_commnunication_flag.send_response_number_flag
			&& (g_commnunication_flag.send_response_flag == 0)) {
		uint8_t state = g_uart2_sendend;
		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
				numberSettingSize - 1);
		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
		flag_response.number++;
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		g_commnunication_flag.send_response_number_flag = 0;
		return 1U;
	}
	return 0U;
}
uint8_t GetAndSaveTimeSetting(void) {
	if (g_commnunication_flag.recived_time_setting_flag == 2) {
		//		//Do not Edit this, must keep!!!!
		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
			switch (i % 4) {
			case 3:
				time_setting_p[i - 3] = g_rx_data[i];
				break;
			case 2:
				time_setting_p[i - 1] = g_rx_data[i];
				break;
			case 1:
				time_setting_p[1 + i] = g_rx_data[i];
				break;
			case 0:
				time_setting_p[3 + i] = g_rx_data[i];
				break;
			default:
				break;
			}
		}
		_settingTime.crc = g_rx_data[timeSettingSize - 1];
		if (g_rx_data[timeSettingSize - 1]
				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
			save_spec_ok = 1;
			g_timerSetting = _settingTime;
			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
					timeSettingSize);
		} else {
			save_spec_ok = -1;
		}
		//		sendToRasPi(H_SET, OK_ALL, 0x0);
		g_commnunication_flag.recived_time_setting_flag = 0;
		return 1U;
	}
	return 0U;
}
uint8_t GetAndSaveNumberSetting(void) {
	if (g_commnunication_flag.recived_number_setting_flag == 2) {
		//		//Do not Edit this, must keep!!!!
		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
			switch (i % 4) {
			case 3:
				number_setting_p[i - 3] = g_rx_data[i];
				break;
			case 2:
				number_setting_p[i - 1] = g_rx_data[i];
				break;
			case 1:
				number_setting_p[1 + i] = g_rx_data[i];
				break;
			case 0:
				number_setting_p[3 + i] = g_rx_data[i];
				break;
			default:
				break;
			}
		}
		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
				numberSettingSize - 1);
		if (g_rx_data[numberSettingSize - 1]
				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
			save_spec_ok = 1;
			g_numberSetting = _settingNumber;
			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
					numberSettingSize);
			if (g_numberSetting.saltPumpVoltage > SALT_PUMP_MAX_VOLTAGE)
				g_numberSetting.saltPumpVoltage = SALT_PUMP_MAX_VOLTAGE;
			if (g_numberSetting.cvccCurrent > CVCC_MAX_VOLTAGE)
				g_numberSetting.cvccCurrent = CVCC_MAX_VOLTAGE;
			R_DAC0_Set_ConversionValue(
					(uint8_t) (g_numberSetting.cvccCurrent / CVCC_MAX_VOLTAGE
							* 255));
			R_DAC1_Set_ConversionValue(
					(uint8_t) (g_numberSetting.saltPumpVoltage
							/ SALT_PUMP_MAX_VOLTAGE * 255));
		} else {
			save_spec_ok = -1;
		}
		//		sendToRasPi(H_SET, OK_ALL, 0x0);
		g_commnunication_flag.recived_number_setting_flag = 0;
		return 1U;
	}
	return 0U;
}
