/*
 * usr_timer.c
 *
 *  Created on: 6 Oct 2021
 *      Author: Renan
 */

#include "usr_timer.h"
#include "r_cg_wdt.h"

void delay_ms(uint32_t ms){
	uint32_t stamp = g_systemTime;
	if(0xffffffff - stamp < ms){
		while(g_systemTime <= ms - 0xffffffff - stamp);
	}else{
		while(g_systemTime - stamp < ms);
	}
}
void delay(uint8_t s){
	while(s != 0){
		delay_ms(1000);
		s--;
		R_WDT_Restart();
	}
}
int ns_delay_ms(uint32_t *stamp, uint32_t ms){
//	if(0xffffffff - *stamp < ms)
//		if((g_systemTime <= ms - (0xffffffff - *stamp))&(g_systemTime < 0xffff0000))
//			return 0;
//	else
	if(g_systemTime - *stamp < ms)
		return 0;
	*stamp = g_systemTime;
	return 1;
}
int non_block_delay(uint32_t *stamp, uint32_t ms){
	return 1;

}

void mTask(void (*func)(void), uint32_t *_p_stamp ,uint32_t ms){
	if(g_systemTime - *_p_stamp >= ms){
		func();
		*_p_stamp = g_systemTime;
	}
}

