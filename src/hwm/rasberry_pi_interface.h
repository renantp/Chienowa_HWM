/*
// * rasberry_pi_interface.h
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#ifndef HWM_RASBERRY_PI_INTERFACE_H_
#define HWM_RASBERRY_PI_INTERFACE_H_
#include "main.h"

enum Control_status;
enum UART_header_e;


void sendToRasPi_f(enum UART_header_e head, enum Control_status type, float value);
void sendToRasPi_u32(enum UART_header_e head, enum Control_status type, uint32_t value);
void RaspberryCommunication_nostop(void);
void waitAlarmConfirm_stop(enum Control_status alarm, uint8_t timeout_s);
uint8_t waitAlarmConfirm_nonstop(enum Control_status alarm);
void resetAlarm(void);

#endif /* HWM_RASBERRY_PI_INTERFACE_H_ */
