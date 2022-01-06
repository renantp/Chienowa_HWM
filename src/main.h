/*
 * main.h
 *
 *  Created on: 16 Nov 2021
 *      Author: Hung
 */

#ifndef MAIN_H_
#define MAIN_H_
#define electrolyticOperationOFF() (g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1 : g_machine_state.electrolyteOFF)

#include "r_cg_macrodriver.h"
#include "r_cg_userdefine.h"
#include "usr_setting_sheet.h"
#include "usr_timer.h"
#include "r_cg_cgc.h"
#include "r_cg_port.h"
#include "r_cg_serial.h"
#include "r_cg_adc.h"
#include "r_cg_timer.h"
#include "r_cg_wdt.h"
#include "rasberry_pi_interface.h"

//const uint8_t io_statusSize = sizeof(union IO_Status_u);
static const uint8_t io_statusSize = 5 + 12;
//const uint8_t timeSettingSize = sizeof(struct Timer_Setting_s);
static const uint8_t timeSettingSize = 141 + 8;
//const uint8_t numberSettingSize = sizeof(struct Number_Setting_s);
static const uint8_t numberSettingSize = 37;
extern struct Timer_Setting_s _settingTime;
extern struct Number_Setting_s _settingNumber;
//void electrolyticOperationON(void);
//void electrolyticOperationOFF(void);
void waitReset(void);
void solenoidCheck(void);
uint8_t Voltage1Check_waitReset(void);
void Voltage2Check_nostop(void);
uint8_t Voltage3Check_waitReset(void);


//void StartSV1OperationTime(void);
//void StartSV2OperationTime(void);
//void StopSV1OperationTime(void);
//void StopSV2OperationTime(void);
void UpdateMachineStatus(void);
uint8_t DrainageAcidAndAlkalineTankStart_nostop(void);

float measureFlowSensor(uint32_t *t);
float measureFlowSensor_nostop(void);
void HandWashingMode_nostop(void);
void WaterWashingMode_nostop(void);
void AcidWaterMode_nostop(void);
void AlkalineWaterMode_nostop(void);
void CallanCleaningMode_nostop(void);

uint8_t isAcidTankFull(void);
uint8_t isAcidTankAlmostFull(void);
uint8_t isAcidTankHasSomething(void);
uint8_t isAcidTankEmpty(void);

uint8_t isAlkalineTankFull(void);
uint8_t isAlkalineTankAlmostFull(void);
uint8_t isAlkalineTankHasSomething(void);
uint8_t isAlkalineTankEmpty(void);

void main_loop_20211111(void);
void realTimeResponse(void);
void isElectrolyticOperationOFF_nostop(void);
void electrolyticOperationON(void);
#endif /* MAIN_H_ */
