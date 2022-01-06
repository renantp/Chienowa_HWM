/*
 * normal_operation.c
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#include "normal_operation.h"


/**
 * Tested: 10/12/2021 by Mr.An
 */
void WaterWashingMode_nostop(void) {
	uint8_t *state = &g_machine_state.water;
	uint32_t *tick = &g_Tick.tickWater;
	switch (*state) {
	case 0:
		g_machine_state.mode = WATER_WASHING;
		O_SPOUT_WATER_PIN_SV2 = ON;
		g_color = WHITE;
		*tick = g_systemTime;
		(*state)++;
		handSensorLED(g_color);
		break;
	case 1:
		if (ns_delay_ms(tick, 50)) {
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
			(*state)++;
		}
		break;
	case 2:
		if (DETECT_U() == I_ON) {
			O_SPOUT_WATER_PIN_SV2 = OFF;
			g_color = BLACK;
			(*state) = 0;
			g_machine_state.mode = BUSY;
			handSensorLED(g_color);
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
		}
		break;
	default:
		(*state) = 0;
		break;
	}
}

/**
 * Tested: 24/12/2021 by Mr.An
 */
void HandWashingMode_nostop(void) {
	uint8_t *state = &g_machine_state.handwash;
	uint32_t *tick = &g_Tick.tickHandWash;
	const uint32_t delayPump_ms = 50;
	if ((*state) == 0) {
		g_timerSetting.t54_overLapTime_ms =
				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
		g_timerSetting.t54_overLapTime_ms =
				g_timerSetting.t54_overLapTime_ms > 1000 ?
						1000 : g_timerSetting.t54_overLapTime_ms;
	} else {
//		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
//			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
//		}
	}
	switch (*state) {
	case 0:
		*state = 1;
		*tick = g_systemTime;
		break;
	case 1:
		g_machine_state.mode = HAND_WASHING;
		O_SPOUT_ALK_PIN_SV4 = ON;
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ALK_PIN = ON;
			handSensorLED(BLUE);
			(*state)++;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
//			g_Tick.tickAnimation = g_systemTime;
//			g_machine_state.waitAnimationRes = 1;
		}
		break;
	case 2:
		if (ns_delay_ms(tick,
				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
						- g_timerSetting.t54_overLapTime_ms)) {
			O_PUMP_ALK_PIN = OFF;
			O_SPOUT_ACID_PIN_SV3 = ON;
			(*state)++;
		}
		break;
	case 3:
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ACID_PIN = ON;
			handSensorLED(RED);
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
			(*state)++;
		}
		break;
	case 4:
		if (ns_delay_ms(tick,
				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
			O_SPOUT_ALK_PIN_SV4 = OFF;
			(*state)++;
		}
		break;
	case 5:
		if (ns_delay_ms(tick,
				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
						- g_timerSetting.t54_overLapTime_ms)) {
			O_PUMP_ACID_PIN = OFF;
			handSensorLED(WHITE);
			O_SPOUT_WATER_PIN_SV2 = ON;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
			(*state)++;
		}
		break;
	case 6:
		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
			O_SPOUT_ACID_PIN_SV3 = OFF;
			(*state)++;
		}
		break;
	case 7:
		if (ns_delay_ms(tick,
				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
			O_SPOUT_WATER_PIN_SV2 = OFF;
			handSensorLED(BLACK);
			(*state) = 0;
			g_machine_state.mode = BUSY;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		}
		break;
	default:
		(*state) = 0;
		break;
	}

}
/**
 * Tested: 24/12/2021 by Mr.An
 */
void AcidWaterMode_nostop(void) {
	uint8_t *state = &g_machine_state.acid;
	uint32_t *tick = &g_Tick.tickAcid;
	const uint32_t delayPump_ms = 50;
	switch (*state) {
	case 0:
//		*state = DETECT_U == I_ON ? 1 : 0;
		g_machine_state.mode = ACID_WASHING;
		*state = 1;
		*tick = g_systemTime;
		break;
	case 1:
		O_SPOUT_ACID_PIN_SV3 = ON;
		g_color = RED;
		handSensorLED(g_color);
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ACID_PIN = ON;
			(*state)++;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		}
		break;
	case 2:
		//TODO: Change turn OFF signal here
		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
				|| (DETECT_U() == I_ON)) {
			O_PUMP_ACID_PIN = OFF;
			(*state)++;
		}
		break;
	case 3:
		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
			O_SPOUT_ACID_PIN_SV3 = OFF;
			g_color = BLACK;
			handSensorLED(g_color);
			(*state)++;
		}
		break;
	default:
		g_machine_state.mode = BUSY;
		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		*state = 0;
		break;
	}
}
/**
 * Tested: 24/12/2021 by Mr.An
 */
void AlkalineWaterMode_nostop(void) {
	uint8_t *state = &g_machine_state.akaline;
	uint32_t *tick = &g_Tick.tickAlkaline;
	const uint32_t delayPump_ms = 50;
	switch (*state) {
	case 0:
//		*state = DETECT_U == I_ON ? 1 : 0;
		g_machine_state.mode = ALKALINE_WASHING;
		*state = 1;
		*tick = g_systemTime;
		break;
	case 1:
		O_SPOUT_ALK_PIN_SV4 = ON;
		g_color = BLUE;
		handSensorLED(g_color);
		if (ns_delay_ms(tick, delayPump_ms)) {
			O_PUMP_ALK_PIN = ON;
			(*state)++;
			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		}
		break;
	case 2:
		//TODO: Change turn OFF signal here
		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
				|| (DETECT_U() == I_ON)) {
			O_PUMP_ALK_PIN = OFF;
			(*state)++;
		}
		break;
	case 3:
		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
			O_SPOUT_ALK_PIN_SV4 = OFF;
			g_color = BLACK;
			handSensorLED(g_color);
			(*state)++;
		}
		break;
	default:
		g_machine_state.mode = BUSY;
		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
		*state = 0;
		break;
	}
}