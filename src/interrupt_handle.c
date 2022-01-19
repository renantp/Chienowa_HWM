/*
 * interupt_handle.c
 *
 *  Created on: 11 Oct 2021
 *      Author: Hung
 */

#include "r_cg_macrodriver.h"
#include "r_cg_userdefine.h"
#include "r_cg_adc.h"
#include "r_cg_timer.h"
uint16_t g_adc_value[2];

uint8_t isCommandNeedResponse(uint8_t *data);

void adc_int_handle(void){
	//TODO: Change ratio to calculate ADC when change to new resistor.
	const float _max_voltage = 10.0;
	switch (ADS) {
		case _00_AD_INPUT_CHANNEL_0:
			R_ADC_Get_Result(&g_adc_value[0]);
			g_io_status.refined.CVCCCurrent = ((float)g_adc_value[0]/1024)*_max_voltage;
//			g_io_status.refined.CVCCCurrent = 1.24f;
			ADS = _01_AD_INPUT_CHANNEL_1;
			break;
		case _01_AD_INPUT_CHANNEL_1:
			R_ADC_Get_Result(&g_adc_value[1]);
			g_io_status.refined.CVCCVoltage = ((float)g_adc_value[1]/1024)*_max_voltage;
//			g_io_status.refined.CVCCVoltage = 1.5f;
			ADS = _00_AD_INPUT_CHANNEL_0;
			break;
		default:
			break;
	}
	R_ADC_Start();
}

void uart2_handle(void){
	R_UART2_Receive(g_rx_data, 6);
	g_commnunication_flag.recived_time_setting_flag =
			g_commnunication_flag.recived_time_setting_flag == 1 ?
					2 : g_commnunication_flag.recived_time_setting_flag;
	g_commnunication_flag.recived_number_setting_flag =
			g_commnunication_flag.recived_number_setting_flag == 1 ?
					2 : g_commnunication_flag.recived_number_setting_flag;
	g_commnunication_flag.recieve_status_flag =
			g_commnunication_flag.recieve_status_flag == 1 ?
					2 : g_commnunication_flag.recieve_status_flag;
	if (isCommandNeedResponse(g_rx_data)
			&& g_commnunication_flag.recived_time_setting_flag == 0
			&& g_commnunication_flag.recived_number_setting_flag == 0
			&& g_commnunication_flag.recieve_status_flag == 0) {
		if ((g_rx_data[0] == H_READ) && (g_rx_data[1] == READ_TIME)) {
			g_commnunication_flag.send_response_time_flag = 1;
		} else if ((g_rx_data[0] == H_SET) && (g_rx_data[1] == SAVE_TIME)) {
			R_UART2_Receive(g_rx_data, timeSettingSize);
			g_commnunication_flag.recived_time_setting_flag = 1;
		} else if ((g_rx_data[0] == H_READ)
				&& (g_rx_data[1] == MACHINE_IO_DATA)) {
			g_commnunication_flag.send_response_status_flag = 1;
		} else if ((g_rx_data[0] == H_READ) && (g_rx_data[1] == READ_NUMBER)) {
			g_commnunication_flag.send_response_number_flag = 1;
		} else if ((g_rx_data[0] == H_SET) && (g_rx_data[1] == SAVE_NUMBER)) {
			R_UART2_Receive(g_rx_data, numberSettingSize);
			g_commnunication_flag.recived_number_setting_flag = 1;
		} else if ((g_rx_data[0] == H_READ) && (g_rx_data[1] == WASHING_MODE)) {
			g_commnunication_flag.send_response_mode_flag = 1;
//			commnunication_flag.send_response_flag = 0;
		} else if ((g_rx_data[0] == H_CLEAR)) {
			g_commnunication_flag.alarm_clear_flag = g_rx_data[1];
		} else if ((g_rx_data[0] == H_SET)
				&& (g_rx_data[1] == NEXT_ANIMATION)) {
//			g_machine_state.waitAnimationRes = 0;
		} else if ((g_rx_data[0] == H_READ) && (g_rx_data[1] == MID_NIGHT)) {
			g_commnunication_flag.send_response_flag = 0;
			g_machine_state.isMidNight = g_rx_data[5];
		} else if ((g_rx_data[0] == H_SET)
				&& (g_rx_data[1] == TESTING_MODE_START)) {
			g_commnunication_flag.test_flag = TESTING_MODE_START;
		} else if((g_rx_data[0] == H_SET)
				&& (g_rx_data[1] == TESTING_MODE_STOP)){
			g_commnunication_flag.test_flag = TESTING_MODE_STOP;
		} else if ((g_rx_data[0] == H_SET) && (g_rx_data[1] == TEST_POWER_ON)) {
			g_commnunication_flag.test_flag = TEST_POWER_ON;
		} else if ((g_rx_data[0] == H_SET)
				&& (g_rx_data[1] == TEST_FLOW_RATE)) {
			g_commnunication_flag.test_flag = TEST_FLOW_RATE;
		} else if ((g_rx_data[0] == H_SET) && (g_rx_data[1] == TEST_CURRENT)) {
			g_commnunication_flag.test_flag = TEST_CURRENT;
		} else if ((g_rx_data[0] == H_SET)
				&& (g_rx_data[1] == TEST_INDIVIDUAL)) {
			g_commnunication_flag.test_flag = TEST_INDIVIDUAL;
			g_commnunication_flag.recieve_status_flag = 1;
			R_UART2_Receive(g_rx_data, 4);
		} else if ((g_rx_data[0] == H_SET)
				&& (g_rx_data[1] == TEST_ELECTROLYTIC)) {
			g_commnunication_flag.test_flag = TEST_ELECTROLYTIC;
		}
		if (isThisCommand(g_rx_data, H_SET, WASHING_MODE, 0xff) != 0) {
			g_machine_mode = g_rx_data[5];
		}
		if (isThisCommand(g_rx_data, H_SET, OK_USER, 0xff) != 0) {
			g_machine_state.user = 2;
		}

	} else if (g_commnunication_flag.recived_time_setting_flag != 0
			|| g_commnunication_flag.recived_number_setting_flag != 0) {
//		R_UART2_Receive(g_rx_data, 6);
	} else {
		g_uart2_fault = 1;
	}
	g_uart2_receive++;
}
uint8_t isCommandNeedResponse(uint8_t *data) {
	if ((data[0] == H_SET) && (data[1] == NEXT_ANIMATION)) {
		return 0;
	}
	switch ((enum UART_header_e) *data) {
//		case H_ALARM:
//			commnunication_flag.send_response_flag = 1;
//			break;
	case H_CLEAR:
		g_commnunication_flag.send_response_flag = 1;
		break;
	case H_ERROR:
		g_commnunication_flag.send_response_flag = 1;
		break;
	case H_READ:
		g_commnunication_flag.send_response_flag = 1;
		break;
	case H_SET:
		g_commnunication_flag.send_response_flag = 1;
		break;
	default:
		return 0;
	}
	return 1;
}
