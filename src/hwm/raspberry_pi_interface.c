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
void RaspberryResponse_nostop(void) {
	if (g_commnunication_flag.send_response_flag) {
		uint8_t state = g_uart2_sendend;
		if (g_machine_state.user == 2) {
			g_machine_state.user = 1;
		}
		R_UART2_Send(g_rx_data, 6);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		g_commnunication_flag.send_response_flag = 0;
	}
	if (g_commnunication_flag.send_response_mode_flag == 1) {
		sendToRasPi_u32(H_READ, WASHING_MODE,
				(uint32_t) g_machine_mode << (8 * 3));
//		sendToRasPi_u32(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
		g_commnunication_flag.send_response_mode_flag = 0;
	}

	if (g_commnunication_flag.send_response_status_flag == 1) {
		uint8_t state = g_uart2_sendend;
		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		g_commnunication_flag.send_response_status_flag = 0;
	} else if (g_commnunication_flag.recieve_status_flag == 2) {
		uint8_t *const _io_p = (uint8_t*) &g_res_io_status;
		for (uint8_t i = 0; i < 5; i++) {
			_io_p[i] = g_rx_data[i];
		}
//		for (uint8_t i = 5; i < io_statusSize - 1; i++){
//
//			switch (i % 4) {
//			case 3:
//				_io_p[i - 3] = g_rx_data[i];
//				break;
//			case 2:
//				_io_p[i - 1] = g_rx_data[i];
//				break;
//			case 1:
//				_io_p[1 + i] = g_rx_data[i];
//				break;
//			case 0:
//				_io_p[3 + i] = g_rx_data[i];
//				break;
//			default:
//				break;
//			}
//		}
		g_commnunication_flag.recieve_status_flag = 0;
	}

	if (g_commnunication_flag.send_response_time_flag) {
		uint8_t state = g_uart2_sendend;
		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
				timeSettingSize - 1);
		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		g_commnunication_flag.send_response_time_flag = 0;
	}
	if (g_commnunication_flag.send_response_number_flag) {
		uint8_t state = g_uart2_sendend;
		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
				numberSettingSize - 1);
		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		g_commnunication_flag.send_response_number_flag = 0;
	}
	if (g_commnunication_flag.recived_time_setting_flag == 2) {
//		//Do not Edit this, must keep!!!!
		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
			switch (i % 4) {
//			case 3:
//				pointer0[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
//				break;
//			case 2:
//				pointer0[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
//				break;
//			case 1:
//				pointer0[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
//				break;
//			case 0:
//				pointer0[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
//				break;
//			default:
//				break;
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
			g_timerSetting = _settingTime;
			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
					timeSettingSize);
			sendToRasPi_f(H_SET, OK_ALL, 0x0);
		} else {
			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
		}
//		sendToRasPi(H_SET, OK_ALL, 0x0);
		g_commnunication_flag.recived_time_setting_flag = 0;
	}

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
			sendToRasPi_f(H_SET, OK_ALL, 0x0);
			g_numberSetting = _settingNumber;
			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
					numberSettingSize);
			sendToRasPi_f(H_SET, OK_ALL, 0x0);
		} else {
			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
		}
//		sendToRasPi(H_SET, OK_ALL, 0x0);
		g_commnunication_flag.recived_number_setting_flag = 0;
	}
	if (g_commnunication_flag.test_flag != 0) {
		g_machine_state.test = g_commnunication_flag.test_flag;
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
/**
 * Wait for Raspberry Pi send {H_CLEAR, alarm, x}
 * @param alarm
 * @param timeout_s Timeout if timeout_s != 0
 */
void waitAlarmConfirm_stop(enum Control_status alarm, uint8_t timeout_s) {
	uint32_t _tick = g_systemTime;
	while (g_commnunication_flag.alarm_clear_flag != alarm) {
		realTimeResponse();
		if ((ns_delay_ms(&_tick, (uint32_t) timeout_s * 1000))
				&& (timeout_s != 0)) {
			break;
		}
	}
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
