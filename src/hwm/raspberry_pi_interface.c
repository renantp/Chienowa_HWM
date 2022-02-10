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
struct IO_Struct g_io_response;
union Control_u g_test_control;

inline void ResponseHandler(void);
inline void ResponseWashingMode(void);
inline void MonitoringStatus(void);
inline void TestIndividual(void);
inline void TestControl(void);

void IO_Output(struct IO_Struct *io) {
	O_SUPPLY_WATER_PIN_SV1 = io->Valve.SV1;
	O_SPOUT_WATER_PIN_SV2 = io->Valve.SV2;
	O_SPOUT_ACID_PIN_SV3 = io->Valve.SV3;
	O_SPOUT_ALK_PIN_SV4 = io->Valve.SV4;
	O_DRAIN_ACID_PIN_SV5 = io->Valve.SV5;
	O_DRAIN_ALK_PIN_SV6 = io->Valve.SV6;
	O_NEUTRALIZE_PIN_SV7 = io->Valve.SV7;
	O_OPTION_2_PIN_SV8 = io->Valve.SV8;
	O_OPTION_3_PIN_SV9 = io->Valve.SV9;

	O_ACID_PUMP_PIN_P1 = io->Pump1;
	O_ALK_PUMP_PIN_P2 = io->Pump2;
	O_PUMP_SALT_PIN_SP1 = io->SaltPump;
	O_CVCC_ON_PIN = io->CVCC_ON;
}
void RaspberryCommunication_nostop(void) {

	ResponseHandler();
	ResponseWashingMode();
	MonitoringStatus();
	TestIndividual();
	TestControl();
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
	if (g_commnunication_flag.test_flag == TESTING_MODE_START) {
		g_machine_state.test = g_commnunication_flag.test_flag;
	} else if (g_commnunication_flag.test_flag == TESTING_MODE_STOP) {
		struct IO_Struct _newIO;
		g_machine_state.test = g_commnunication_flag.test_flag = INDIE;
		IO_Output(&_newIO);
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
void ResponseHandler(void) {
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
}
void ResponseWashingMode(void) {
	if (g_commnunication_flag.send_response_mode_flag == 1) {
		sendToRasPi_u32(H_READ, WASHING_MODE,
				(uint32_t) g_machine_mode << (8 * 3));
//		sendToRasPi_u32(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
		g_commnunication_flag.send_response_mode_flag = 0;
	}
}
void MonitoringStatus(void) {
	if (g_commnunication_flag.send_response_status_flag == 1) {
		uint8_t state = g_uart2_sendend;
		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
		while (state == g_uart2_sendend) {
			R_WDT_Restart();
		}
		g_commnunication_flag.send_response_status_flag = 0;
	}
}
void TestIndividual(void) {
	if (g_commnunication_flag.recieve_status_flag == 2) {
		uint8_t *const _io_p = (uint8_t*) &g_io_response.Valve;
		for (uint8_t i = 0; i < 4; i++) {
			_io_p[i] = g_rx_data[i];
		}
		IO_Output(&g_io_response);
		g_commnunication_flag.recieve_status_flag = 0;
	}
}
void TestControl(void) {
	if (g_commnunication_flag.control_test_flag != 0) {
		switch (g_commnunication_flag.control_test_flag) {
		case DRAINAGE_MODE_SET:
			sendToRasPi_u32(H_READ, DRAINAGE_MODE_SET,
					(uint32_t) g_test_control.raw.drain << (8 * 3));
			break;
		case POWER_ON_TEST_SET:
			sendToRasPi_u32(H_READ, POWER_ON_TEST_SET,
					(uint32_t) g_test_control.raw.power_on << (8 * 3));
			break;
		case WATER_FILTER_SET:
			sendToRasPi_u32(H_READ, WATER_FILTER_SET,
					(uint32_t) g_test_control.raw.filter << (8 * 3));
			break;
		default:
			break;
		}
		g_commnunication_flag.control_test_flag = 0;
	}
}
