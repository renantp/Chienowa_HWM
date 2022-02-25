/*
 * main.h
 *
 *  Created on: 16 Nov 2021
 *      Author: Hung
 */

#ifndef HWM_HWM_MAIN_H_
#define HWM_HWM_MAIN_H_

#define electrolyticOperationOFF() (g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1 : g_machine_state.electrolyteOFF)

#include "../src/r_cg_macrodriver.h"
#include "../src/r_cg_userdefine.h"
#include "../src/usr_setting_sheet.h"
#include "../src/usr_timer.h"
#include "../src/r_cg_cgc.h"
#include "../src/r_cg_port.h"
#include "../src/r_cg_serial.h"
#include "../src/r_cg_adc.h"
#include "../src/r_cg_timer.h"
#include "../src/r_cg_wdt.h"

#include "rasberry_pi_interface.h"
#include "error_check.h"
#include "hand_sensor_interface.h"
#include "normal_operation.h"
#include "io_control.h"
#include "operation.h"

extern struct Timer_Setting_s _settingTime;
extern struct Number_Setting_s _settingNumber;
struct Cotrol_s {
	uint8_t drain :1;
	uint8_t power_on :1;
	uint8_t filter :1;
	uint8_t biomectric :1;
	uint8_t RSVD :4;
};
union Control_u {
	struct Cotrol_s raw;
	uint8_t data;
};
extern union Control_u g_test_control;
//void electrolyticOperationON(void);
//void electrolyticOperationOFF(void);

static const uint8_t io_statusSize = 5 + 13;
static const uint8_t timeSettingSize = 141 + 8;
static const uint8_t numberSettingSize = 37;

void UpdateMachineStatus(void);
uint8_t DrainageAcidAndAlkalineTankStart_nostop(void);

void main_loop_20211111(void);
void realTimeResponse(void);

#endif /* HWM_HWM_MAIN_H_ */
