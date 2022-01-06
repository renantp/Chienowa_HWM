/*
 * hand_sensor_interface.h
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#ifndef HWM_HAND_SENSOR_INTERFACE_H_
#define HWM_HAND_SENSOR_INTERFACE_H_

#include "main.h"

#define DETECT_U() (I_HS_ODA_PIN == ON ? 1:0)
#define DETECT_D() (I_HS_OCL_PIN == ON ? 1:0)

enum HS_COLOR{
	BLACK, RED, WHITE, BLUE
};
extern enum HS_COLOR g_color, g_pre_color;

void handSensorLED(enum HS_COLOR color);
void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms);

#endif /* HWM_HAND_SENSOR_INTERFACE_H_ */
