/*
 * hwm_error_check.h
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#ifndef HWM_ERROR_CHECK_H_
#define HWM_ERROR_CHECK_H_

#include "main.h"

extern union Alarm_Flag_u{
	struct{
		uint8_t over_voltage_1 : 1;
		uint8_t over_voltage_2 : 1;
		uint8_t over_voltage_3 : 1;
		uint8_t underVoltage : 1;
		uint8_t abnormal_flow : 1;
		uint8_t abnormal_current : 1;
		uint8_t over_curent : 1;

		uint8_t solenoid : 1;
		uint8_t salt_full : 1;
		uint8_t salt_empty : 1;
		uint8_t acid_skip : 1;
		uint8_t alkaline_skip: 1;
		uint8_t water_full: 1;
		uint8_t filter: 1;
		uint8_t cvcc : 1;
	}refined;
}g_alarm;

uint8_t Voltage1Check_waitReset(void);
void Voltage2Check_nostop(void);
uint8_t Voltage3Check_waitReset(void);
uint8_t LowVoltageCheck_waitReset(void);
uint8_t OverCurrentCheck_waitReset(void);
uint8_t FlowSensorCheck_nonstop(void);
uint8_t solenoidCheck_nonstop(void);
uint8_t saltWaterTankFullCheck_nonstop(void);
uint8_t saltWaterTankEmptyCheck(void);


#endif /* HWM_ERROR_CHECK_H_ */
