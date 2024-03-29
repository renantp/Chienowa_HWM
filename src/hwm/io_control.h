/*
 * io_control.h
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#ifndef HWM_IO_CONTROL_H_
#define HWM_IO_CONTROL_H_

#include "hwm_main.h"

struct IO_Struct;

float measureFlowSensor(uint32_t s);
float measureFlowSensor_nostop(void);

uint8_t isAcidTankFull(void);
uint8_t isAcidTankAlmostFull(void);
uint8_t isAcidTankHasSomething(void);
uint8_t isAcidTankAlmostEmpty(void);
uint8_t isAcidTankEmpty(void);

uint8_t isAlkalineTankFull(void);
uint8_t isAlkalineTankAlmostFull(void);
uint8_t isAlkalineTankHasSomething_nonstop(void);
uint8_t isAlkalineTankAlmostEmpty(void);
uint8_t isAlkalineTankEmpty_nonstop(void);

void OutputIO(struct IO_Struct *io);

#endif /* HWM_IO_CONTROL_H_ */
