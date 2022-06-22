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
struct Raspberry_state_s g_rasp_state;
uint8_t isCommandNeedResponse(uint8_t *data);
struct Flag_counter{
	uint8_t time_setting;
	uint8_t number_setting;
	uint8_t mode_setting;
	uint8_t alarm_setting;
}flag_counter;

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
/*!
 * Use in uart2 interrupt function
 */
void Raspberry_uart2_handle(void){
	g_Tick.tickUartTimeout = g_systemTime;
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
				case NEXT_ANIMATION:
					g_commnunication_flag.send_response_flag = 0;
					g_commnunication_flag.next_animation_flag = 1;
					break;
				case READ_TIME:
					flag_counter.time_setting++;
					g_commnunication_flag.send_response_time_flag = 1;
					break;
				case MACHINE_IO_DATA:
					g_commnunication_flag.send_response_status_flag = 1;
					break;
				case READ_NUMBER:
					flag_counter.number_setting++;
					g_commnunication_flag.send_response_number_flag = 1;
					break;
				case WASHING_MODE:
					flag_counter.mode_setting++;
					g_commnunication_flag.send_response_mode_flag = 1;
					g_commnunication_flag.send_response_flag = 0;
					break;
				case MID_NIGHT:
					g_machine_state.isMidNight = g_rx_data[5];
					break;
				case DRAINAGE_MODE_SET:
					g_commnunication_flag.control_setting_flag = DRAINAGE_MODE_SET;
					g_commnunication_flag.send_response_flag = 0U;
					break;
				case POWER_ON_TEST_SET:
					g_commnunication_flag.control_setting_flag = POWER_ON_TEST_SET;
					g_commnunication_flag.send_response_flag = 0U;
					break;
				case WATER_FILTER_SET:
					g_commnunication_flag.control_setting_flag = WATER_FILTER_SET;
					g_commnunication_flag.send_response_flag = 0U;
					break;
				case BIOMETRIC_SET:
					g_commnunication_flag.control_setting_flag = BIOMETRIC_SET;
					g_commnunication_flag.send_response_flag = 0U;
					break;
				case CONTROL_SETTING:
					g_commnunication_flag.control_setting_flag = CONTROL_SETTING;
					g_commnunication_flag.send_response_flag = 0;
					break;
				case ALARM_STATUS:
					flag_counter.alarm_setting++;
					g_commnunication_flag.alarm_response_flag = 1U;
					break;
				default:
					break;
			}
			if(g_commnunication_flag.control_setting_flag != 0){
				g_commnunication_flag.send_response_flag = 0;
			}
		}else if(g_rx_data[0] == H_SET){
			switch (g_rx_data[1]) {
				case OK_ALL:
					g_commnunication_flag.send_response_flag = 0;
					g_commnunication_flag.save_confirm_flag = 1;
					break;
				case SAVE_TIME:
					R_UART2_Receive(g_rx_data, timeSettingSize);
					g_commnunication_flag.recived_time_setting_flag = 1;
					break;
				case SAVE_NUMBER:
					R_UART2_Receive(g_rx_data, numberSettingSize);
					g_commnunication_flag.recived_number_setting_flag = 1;
					break;
				case NEXT_ANIMATION:
					g_commnunication_flag.send_response_flag = 0;
					g_commnunication_flag.next_animation_flag = 1;
					break;
				case TESTING_MODE_START:
					g_commnunication_flag.test_flag = TESTING_MODE_START;
					g_commnunication_flag.test_enable_flag = 1U;
					g_commnunication_flag.send_response_flag = 0U;
					break;
				case TESTING_MODE_STOP:
					g_commnunication_flag.test_flag = TESTING_MODE_STOP;
					g_commnunication_flag.test_enable_flag = 0U;
					g_commnunication_flag.send_response_flag = 0U;
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
					g_commnunication_flag.recieve_status_flag = 1;
					g_commnunication_flag.test_individual_flag = 1;
					R_UART2_Receive(g_rx_data, 3);
					break;
				case TEST_ELECTROLYTIC:
					g_commnunication_flag.test_flag = TEST_ELECTROLYTIC;
					break;
				case WASHING_MODE:
					g_machine_mode = g_rx_data[5];
					break;
				case OK_USER:
					g_machine_state.user = 2;
					g_commnunication_flag.send_response_flag = 0U;
					break;
				//----------------Control Setting--------------------
				case DRAINAGE_MODE_SET:
					g_commnunication_flag.control_setting_flag = DRAINAGE_MODE_SET;
					g_commnunication_flag.control_setting_save_flag = 1;
					g_control_setting.raw.drain = g_rx_data[5];
					g_commnunication_flag.send_response_flag = 0;
					break;
				case POWER_ON_TEST_SET:
					g_commnunication_flag.control_setting_flag = POWER_ON_TEST_SET;
					g_commnunication_flag.control_setting_save_flag = 1;
					g_control_setting.raw.power_on = g_rx_data[5];
					g_commnunication_flag.send_response_flag = 0;
					break;
				case WATER_FILTER_SET:
					g_commnunication_flag.control_setting_flag = WATER_FILTER_SET;
					g_commnunication_flag.control_setting_save_flag = 1;
					g_control_setting.raw.filter = g_rx_data[5];
					g_commnunication_flag.send_response_flag = 0;
					break;
				case BIOMETRIC_SET:
					g_commnunication_flag.control_setting_flag = BIOMETRIC_SET;
					g_commnunication_flag.control_setting_save_flag = 1;
					g_control_setting.raw.biomectric = g_rx_data[5];
					g_commnunication_flag.send_response_flag = 0;
					break;
				//----------------End Control Setting--------------------
				case START_WASHING:
					g_commnunication_flag.send_response_flag = 0;
					break;
				case MONITOR_START:
					g_rasp_state.isMonitorScreen = 1U;
					g_commnunication_flag.test_enable_flag = 0U;
					g_commnunication_flag.monitor_enable_flag = 1U;
					break;
				case MONITOR_STOP:
					g_rasp_state.isMonitorScreen = 0U;
					g_commnunication_flag.monitor_enable_flag = 0U;
					g_commnunication_flag.test_enable_flag = 0U;
					break;
				default:
					break;
			}
		}else if ((g_rx_data[0] == H_CLEAR)){
			g_commnunication_flag.alarm_clear_flag = g_rx_data[1];
			g_commnunication_flag.send_response_flag = 0;
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
