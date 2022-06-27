/*
 * operation.c
 *
 *  Created on: 11 Jan 2022
 *      Author: Hung
 */

#include "operation.h"

/**
 * 30/11/2021: Checked by An
 */
void electrolyticOperationON(void) {
	//Electrolytic operation ON
	O_SUPPLY_WATER_PIN_SV1 = ON;
	O_CVCC_ON_PIN = ON;
	O_PUMP_SALT_PIN_SP1 = ON; //SP1
	g_machine_state.electrolyteOperation = 1;
	g_TimeKeeper.electrolyteOff_h = 0;
	g_TimeKeeper.neutralization =
			g_TimeKeeper.neutralization == 0 ?
					g_systemTime : g_TimeKeeper.neutralization;
}
/**
 *
 */
void isElectrolyticOperationOFF_nostop(void) {
	uint8_t *state = &g_machine_state.electrolyteOFF;
	uint32_t *tick = &g_Tick.tickElectrolyticOff;
	switch (*state) {
	case 0:
		// Set g_machine_state.electrolyteOFF = 1 to start OFF
		// This case run when electrolyte is ON or already OFF
//		if (ns_delay_ms(tick, (uint32_t) 60000 * 60)
//				&& g_machine_state.electrolyteOperation == 0) {
//			sendToRasPi_u32(H_READ, MID_NIGHT, 0x00);
//			g_TimeKeeper.electrolyteOff_h++;
//		} else if (g_machine_state.electrolyteOperation == 1) {
//			if (ns_delay_ms(&g_TimeKeeper.neutralization, 1000)) {
//				g_neutralization_time_s++;
//			}
//			(*tick) = g_systemTime;
//		}
		break;
	case 1:
		g_TimeKeeper.neutralization = 0;
		O_CVCC_ON_PIN = OFF;
		O_PUMP_SALT_PIN_SP1 = OFF; //SP1

		(*state)++;
		break;
	case 2:
		if (ns_delay_ms(tick,
				g_timerSetting.t5_electrolysisStopDelay_s * 1000)) {
			(*state) = 0;
			O_SUPPLY_WATER_PIN_SV1 = OFF;
			//TODO: Change this
//			g_machine_state.electrolyteOperation--;
		}
		break;
	default:
		break;
	}
}

void TestModeOperation(void) {
	if (g_commnunication_flag.test_flag) {

	}
	if (g_machine_state.test_operation == TEST_INDIVIDUAL) {
		//TODO: Pause other operation

	}
}
