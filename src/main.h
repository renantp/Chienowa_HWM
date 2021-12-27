/*
 * main.h
 *
 *  Created on: 16 Nov 2021
 *      Author: Hung
 */

#ifndef MAIN_H_
#define MAIN_H_

//const uint8_t io_statusSize = sizeof(union IO_Status_u);
static const uint8_t io_statusSize = 5;
//const uint8_t timeSettingSize = sizeof(struct Timer_Setting_s);
static const uint8_t timeSettingSize = 141;
//const uint8_t numberSettingSize = sizeof(struct Number_Setting_s);
static const uint8_t numberSettingSize = 33;
extern struct Timer_Setting_s _settingTime;
extern struct Number_Setting_s _settingNumber;
//void electrolyticOperationON(void);
//void electrolyticOperationOFF(void);
void waitReset(void);
void solenoidCheck(void);
uint8_t Voltage1Check_waitReset(void);
void Voltage2Check_nostop(void);
uint8_t Voltage3Check_waitReset(void);
void RaspberryResponse_nostop(void);

//void StartSV1OperationTime(void);
//void StartSV2OperationTime(void);
//void StopSV1OperationTime(void);
//void StopSV2OperationTime(void);
void UpdateMachineStatus(void);
void InitialOperationModeStart(void);

float measureFlowSensor(uint32_t *t);
float measureFlowSensor_nostop(void);
uint8_t WaterSupplyOperation_nostop(void);
void HandWashingMode_nostop(void);
void WaterWashingMode_nostop(void);
void AcidWaterMode_nostop(void);
void AlkalineWaterMode_nostop(void);
void CallanCleaningMode_nostop(void);


void main_loop_20211111(void);
#endif /* MAIN_H_ */
