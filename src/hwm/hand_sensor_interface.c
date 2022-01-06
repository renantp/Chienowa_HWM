/*
 * hand_sensor_interface.c
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#include "hand_sensor_interface.h"

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
	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
		g_color = g_color == color ? BLACK : color;
		handSensorLED(g_color);
	}
}
