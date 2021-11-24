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
	switch (ADS) {
		case _00_AD_INPUT_CHANNEL_0:
			R_ADC_Get_Result(&g_adc_value[0]);
			g_cvcc_current = (float)g_adc_value[0]/512;
			ADS = _01_AD_INPUT_CHANNEL_1;
			break;
		case _01_AD_INPUT_CHANNEL_1:
			R_ADC_Get_Result(&g_adc_value[1]);
			g_cvcc_voltge = (float)g_adc_value[1]/512;
			ADS = _00_AD_INPUT_CHANNEL_0;
			break;
		default:
			break;
	}
//	R_ADC_top();
	R_ADC_Start();
}
