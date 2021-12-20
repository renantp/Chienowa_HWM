/*
 * main.h
 *
 *  Created on: 16 Nov 2021
 *      Author: Hung
 */

#ifndef MAIN_H_
#define MAIN_H_



//void electrolyticOperationON(void);
//void electrolyticOperationOFF(void);
void waitReset(void);
void solenoidCheck(void);
uint8_t Voltage1Check_waitReset(void);
void Voltage2Check_loop(void);
uint8_t Voltage3Check_waitReset(void);
void RaspberryResponse_nostop(void);

//void StartSV1OperationTime(void);
//void StartSV2OperationTime(void);
//void StopSV1OperationTime(void);
//void StopSV2OperationTime(void);
void UpdateMachineStatus(void);
void InitialOperationModeStart(void);

float measureFlowSensor(void);
float nostop_measureFlowSensor(void);
uint8_t nostop_WaterSupplyOperation(void);
void HandWashingMode_nostop(void);
void WaterWashingMode_nostop(void);
void AcidWaterMode_nostop(void);
void AlkalineWaterMode_nostop(void);
void CallanCleaningMode_nostop(void);
#endif /* MAIN_H_ */
