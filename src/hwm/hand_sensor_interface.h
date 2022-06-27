/*
 * hand_sensor_interface.h
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#ifndef HWM_HAND_SENSOR_INTERFACE_H_
#define HWM_HAND_SENSOR_INTERFACE_H_

#include "hwm_main.h"

#define DETECT_U() (I_HS_ODA_PIN == ON ? 1:0)
#define DETECT_D() (I_HS_OCL_PIN == ON ? 1:0)

enum HS_COLOR {
	BLACK, RED, WHITE, BLUE
};
extern enum HS_COLOR g_color, g_pre_color;

void handSensorLED(enum HS_COLOR color);
void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms);
void HandSensorLEDEndBlink(void);

uint8_t isHandSensorON(void);
void setHandSensorOFF(void);
void setHandSensorON(void);

#endif /* HWM_HAND_SENSOR_INTERFACE_H_ */
