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
uint8_t Voltage1Check(void);
void Voltage2Check(void);
uint8_t Voltage3Check(void);
void StartSV1OperationTime(void);
void StartSV2OperationTime(void);
void StopSV1OperationTime(void);
void StopSV2OperationTime(void);

#endif /* MAIN_H_ */
