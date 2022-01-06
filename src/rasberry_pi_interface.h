/*
 * rasberry_pi_interface.h
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#ifndef RASBERRY_PI_INTERFACE_H_
#define RASBERRY_PI_INTERFACE_H_
#include "main.h"
#include "r_cg_userdefine.h"

enum Control_status;
enum UART_header_e;
void sendToRasPi_f(enum UART_header_e head, enum Control_status type, float value);
void sendToRasPi_u32(enum UART_header_e head, enum Control_status type, uint32_t value);
void RaspberryResponse_nostop(void);
void stop_waitAlarmConfirm(enum Control_status alarm, uint8_t timeout_s);
uint8_t nostop_waitAlarmConfirm(enum Control_status alarm);
#endif /* RASBERRY_PI_INTERFACE_H_ */
