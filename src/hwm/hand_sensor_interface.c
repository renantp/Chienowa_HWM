/*
 * hand_sensor_interface.c
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#include "hand_sensor_interface.h"
uint8_t bink_reset_flag = 0;
uint8_t hand_sensor_debounce = 0;

void handSensorLED(enum HS_COLOR color) {
	g_color = color;
	if (g_color != g_pre_color) {
		switch (color) {
		case RED:
			O_HS_ICL_PIN = 1;
			O_HS_IDA_PIN = 0;
			break;
		case BLUE:
			O_HS_ICL_PIN = 0;
			O_HS_IDA_PIN = 0;
			break;
		case WHITE:
			O_HS_ICL_PIN = 0;
			O_HS_IDA_PIN = 1;
			break;
		default:
			O_HS_ICL_PIN = 1;
			O_HS_IDA_PIN = 1;
			break;
		}
		g_pre_color = g_color;
	}
}

void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	bink_reset_flag = 1U;
	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
		g_color = g_color == color ? BLACK : color;
		handSensorLED(g_color);
	}
}

void HandSensorLEDEndBlink(void) {
	if (bink_reset_flag) {
		handSensorLED(BLACK);
		bink_reset_flag = 0;
	}
}

/*!
 * Check state of hand sensor
 * @return g_machine_state.handsensor
 */
uint8_t isHandSensorON(void){
	if(hand_sensor_debounce == 0){
		if(DETECT_U() == I_ON && g_machine_state.handsensor == 0){
			setHandSensorON();
			g_Tick.tickHandSensor[0] = g_systemTime;
			hand_sensor_debounce = 1;
		}else if(DETECT_U() == I_ON && g_machine_state.handsensor == 1){
			if(g_machine_state.mode != HAND_WASHING)
				setHandSensorOFF();
			g_Tick.tickHandSensor[0] = g_systemTime;
			hand_sensor_debounce = 1;
		}else{
			hand_sensor_debounce = 0;
		}
	}else{
		if(ns_delay_ms(&g_Tick.tickHandSensor[0], 1000))
			hand_sensor_debounce = 0;
	}

	return g_machine_state.handsensor;
}

void setHandSensorOFF(void){
	g_machine_state.handsensor = 0U;
	if(g_machine_state.mode != HAND_WASHING)
		g_io_status.refined.io.HandSensorOFF = 1U;
}

void setHandSensorON(void){
	g_machine_state.handsensor = 1U;
	if(g_machine_state.mode != HAND_WASHING)
		g_io_status.refined.io.HandSensorON = 1U;
}
