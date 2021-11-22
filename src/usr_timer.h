/*
 * usr_timer.h
 *
 *  Created on: 6 Oct 2021
 *      Author: Renan
 */

#ifndef USR_TIMER_H_
#define USR_TIMER_H_

#include "r_cg_macrodriver.h"
#include "r_cg_userdefine.h"

void delay_ms(uint32_t ms);
void delay(uint8_t s);
void mTask(void (*func)(void), uint32_t *_p_stamp ,uint32_t ms);
int ns_delay_ms(uint32_t *stamp, uint32_t ms);
int non_block_delay(uint32_t *stamp, uint32_t ms);

#endif /* USR_TIMER_H_ */
