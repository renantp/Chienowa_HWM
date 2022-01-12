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
