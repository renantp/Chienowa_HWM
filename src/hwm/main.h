/*
 * main.h
 *
 *  Created on: 16 Nov 2021
 *      Author: Hung
 */

#ifndef HWM_MAIN_H_
#define HWM_MAIN_H_

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
//void electrolyticOperationON(void);
//void electrolyticOperationOFF(void);


//const uint8_t io_statusSize = sizeof(union IO_Status_u);
static const uint8_t io_statusSize = 5 + 13;
//const uint8_t timeSettingSize = sizeof(struct Timer_Setting_s);
static const uint8_t timeSettingSize = 141 + 8;
//const uint8_t numberSettingSize = sizeof(struct Number_Setting_s);
static const uint8_t numberSettingSize = 37;

void UpdateMachineStatus(void);
uint8_t DrainageAcidAndAlkalineTankStart_nostop(void);

void main_loop_20211111(void);
void realTimeResponse(void);

#endif /* HWM_MAIN_H_ */
