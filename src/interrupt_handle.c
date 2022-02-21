/*
 * interupt_handle.c
 *
 *  Created on: 11 Oct 2021
 *      Author: Hung
 *      This file with handle all interrupt. Include:
 *      - UART 2: Set flag response Raspberry Pi.
 *      - Timer 0: Timer counter
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

		if(g_rx_data[0] == H_READ){
			switch (g_rx_data[1]) {
				case READ_TIME:
					g_commnunication_flag.send_response_time_flag = 1;
					break;
				case MACHINE_IO_DATA:
					g_commnunication_flag.send_response_status_flag = 1;
					break;
				case READ_NUMBER:
					g_commnunication_flag.send_response_number_flag = 1;
					break;
				case WASHING_MODE:
					g_commnunication_flag.send_response_mode_flag = 1;
					break;
				case MID_NIGHT:
					g_machine_state.isMidNight = g_rx_data[5];
					break;
				case DRAINAGE_MODE_SET:
					g_commnunication_flag.control_test_flag = DRAINAGE_MODE_SET;
					break;
				case POWER_ON_TEST_SET:
					g_commnunication_flag.control_test_flag = POWER_ON_TEST_SET;
					break;
				case WATER_FILTER_SET:
					g_commnunication_flag.control_test_flag = WATER_FILTER_SET;
					break;
				case BIOMECTRIC_SET:
					g_commnunication_flag.control_test_flag = BIOMECTRIC_SET;
					break;
				case CONTROL_SETTING:
					g_commnunication_flag.control_test_flag = CONTROL_SETTING;
					break;
				default:
					break;
			}
		}else if(g_rx_data[0] == H_SET){
			switch (g_rx_data[1]) {
				case SAVE_TIME:
					R_UART2_Receive(g_rx_data, timeSettingSize);
					g_commnunication_flag.recived_time_setting_flag = 1;
					break;
				case SAVE_NUMBER:
					R_UART2_Receive(g_rx_data, numberSettingSize);
					g_commnunication_flag.recived_number_setting_flag = 1;
					break;
				case NEXT_ANIMATION:

					break;
				case TESTING_MODE_START:
					g_commnunication_flag.test_flag = TESTING_MODE_START;
					break;
				case TESTING_MODE_STOP:
					g_commnunication_flag.test_flag = TESTING_MODE_STOP;
					break;
				case TEST_POWER_ON:
					g_commnunication_flag.test_flag = TEST_POWER_ON;
					break;
				case TEST_FLOW_RATE:
					g_commnunication_flag.test_flag = TEST_FLOW_RATE;
					break;
				case TEST_CURRENT:
					g_commnunication_flag.test_flag = TEST_CURRENT;
					break;
				case TEST_INDIVIDUAL:
					g_commnunication_flag.test_flag = TEST_INDIVIDUAL;
					g_commnunication_flag.recieve_status_flag = 1;
					R_UART2_Receive(g_rx_data, 4);
					break;
				case TEST_ELECTROLYTIC:
					g_commnunication_flag.test_flag = TEST_ELECTROLYTIC;
					break;
				case WASHING_MODE:
					g_machine_mode = g_rx_data[5];
					break;
				case OK_USER:
					g_machine_state.user = 2;
					break;
				case DRAINAGE_MODE_SET:
					g_commnunication_flag.control_test_save_flag = 1;
					g_test_control.raw.drain = g_rx_data[5];
					break;
				case POWER_ON_TEST_SET:
					g_commnunication_flag.control_test_save_flag = 1;
					g_test_control.raw.power_on = g_rx_data[5];
					break;
				case WATER_FILTER_SET:
					g_commnunication_flag.control_test_save_flag = 1;
					g_test_control.raw.filter = g_rx_data[5];
					break;
				case BIOMECTRIC_SET:
					g_commnunication_flag.control_test_save_flag = 1;
					g_test_control.raw.biomectric = g_rx_data[5];
					break;
				case START_WASHING:
					g_commnunication_flag.send_response_flag = 0;
					break;
				default:
					break;
			}
		}else if ((g_rx_data[0] == H_CLEAR)){
			g_commnunication_flag.alarm_clear_flag = g_rx_data[1];
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
