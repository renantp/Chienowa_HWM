/*
 * io_control.c
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#include "io_control.h"

void OutputIO(struct IO_Struct *io) {
	O_SUPPLY_WATER_PIN_SV1 = io->Valve.SV1;
	O_SPOUT_WATER_PIN_SV2 = io->Valve.SV2;
	O_SPOUT_ACID_PIN_SV3 = io->Valve.SV3;
	O_SPOUT_ALK_PIN_SV4 = io->Valve.SV4;
	O_DRAIN_ACID_PIN_SV5 = io->Valve.SV5;
	O_DRAIN_ALK_PIN_SV6 = io->Valve.SV6;
	O_NEUTRALIZE_PIN_SV7 = io->Valve.SV7;
	O_OPTION_2_PIN_SV8 = io->Valve.SV8;
	O_OPTION_3_PIN_SV9 = io->Valve.SV9;

	if (O_SPOUT_ACID_PIN_SV3 == OFF && O_DRAIN_ACID_PIN_SV5 == OFF) {
		O_ACID_PUMP_PIN_P1 = 1U;
	} else {
		O_ACID_PUMP_PIN_P1 = io->Pump1 == 1U? 0U : 1U;
	}
	if (O_DRAIN_ALK_PIN_SV6 == OFF && O_SPOUT_ALK_PIN_SV4 == OFF) {
		O_ALK_PUMP_PIN_P2 = 1U;
	} else {
		O_ALK_PUMP_PIN_P2 = io->Pump2 == 1U? 0U : 1U;
	}
	O_PUMP_SALT_PIN_SP1 = io->SaltPump == 1U? 0U : 1U;
	O_CVCC_ON_PIN = io->CVCC_ON;
}
/********************** Check Input *******************/
uint8_t isAcidTankFull(void) {
	if (I_ACID_H_PIN_FL3 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
				g_timerSetting.t23_onDelayHighLevel_s * 1000)
				|| (g_mean_io_status.refined.io.AcidHighLevel == 1)) {
			g_mean_io_status.refined.io.AcidHighLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[0] = g_systemTime;
		g_mean_io_status.refined.io.AcidHighLevel = 0;
	}
	return 0;
}
uint8_t isAcidTankAlmostFull(void) {
	if (I_ACID_M_PIN_FL2 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
				g_timerSetting.t22_onDelayLowLevel_s * 1000)
				|| (g_mean_io_status.refined.io.AcidLowLevel == 1)) {
			g_mean_io_status.refined.io.AcidLowLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[1] = g_systemTime;
		g_mean_io_status.refined.io.AcidLowLevel = 0;
	}
	return 0;
}

uint8_t isAcidTankHasSomething(void) {
	if (I_ACID_L_PIN_FL1 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
				g_timerSetting.t21_onDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.io.AcidEmptyLevel == 1)) {
			g_mean_io_status.refined.io.AcidEmptyLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[2] = g_systemTime;
		isAcidTankEmpty();
	}
	return 0;
}
uint8_t isAcidTankAlmostEmpty(void) {
	if (!levelSkipErrorCheck() && isAcidTankHasSomething()) {
		if (I_ACID_M_PIN_FL2 == I_OFF) {
			if (ns_delay_ms(&g_Tick.tickAcidLevel[4],
					g_timerSetting.t24_offDelayEmptyLevel_s * 1000)) {
				g_mean_io_status.refined.io.AcidLowLevel = 0;
				return 1;
			}
		} else {
			g_Tick.tickAcidLevel[4] = g_systemTime;
			isAcidTankHasSomething();
		}
	}
	return 0;
}
uint8_t isAcidTankEmpty(void) {
	if (I_ACID_L_PIN_FL1 == I_OFF) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
				g_timerSetting.t24_offDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.io.AcidEmptyLevel == 0)) {
			g_mean_io_status.refined.io.AcidEmptyLevel = 0;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[3] = g_systemTime;
		isAcidTankHasSomething();
	}
	return 0;
}
uint8_t isAlkalineTankFull(void) {
	if (I_ALKALI_H_PIN_FL6 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
				g_timerSetting.t23_onDelayHighLevel_s * 1000)
				|| (g_mean_io_status.refined.io.AlkalineHighLevel == 1)) {
			g_mean_io_status.refined.io.AlkalineHighLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[0] = g_systemTime;
		g_mean_io_status.refined.io.AlkalineHighLevel = 0;
	}
	return 0;
}
uint8_t isAlkalineTankAlmostFull(void) {
	if (I_ALKALI_M_PIN_FL5 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
				g_timerSetting.t22_onDelayLowLevel_s * 1000)
				|| (g_mean_io_status.refined.io.AlkalineLowLevel == 1)) {
			g_mean_io_status.refined.io.AlkalineLowLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[1] = g_systemTime;
		g_mean_io_status.refined.io.AlkalineLowLevel = 0;
	}
	return 0;
}
uint8_t isAlkalineTankHasSomething_nonstop(void) {
	if (I_ALKALI_L_PIN_FL4 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
				g_timerSetting.t21_onDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.io.AlkalineEmptyLevel == 1)) {
			g_mean_io_status.refined.io.AlkalineEmptyLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[2] = g_systemTime;
		isAlkalineTankEmpty_nonstop();
	}
	return 0;
}
uint8_t isAlkalineTankAlmostEmpty(void) {
	if (!levelSkipErrorCheck() && isAlkalineTankHasSomething_nonstop()) {
		if (I_ALKALI_M_PIN_FL5 == I_OFF) {
			if (ns_delay_ms(&g_Tick.tickAlkalineLevel[4],
					g_timerSetting.t24_offDelayEmptyLevel_s * 1000)) {
				g_mean_io_status.refined.io.AlkalineLowLevel = 0;
				return 1;
			}
		} else {
			g_Tick.tickAlkalineLevel[4] = g_systemTime;
			isAcidTankHasSomething();
		}
	}
	return 0;
}
uint8_t isAlkalineTankEmpty_nonstop(void) {
	if (I_ALKALI_L_PIN_FL4 == I_OFF) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
				g_timerSetting.t24_offDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.io.AlkalineEmptyLevel == 0)) {
			g_mean_io_status.refined.io.AlkalineEmptyLevel = 0;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[3] = g_systemTime;
		isAlkalineTankHasSomething_nonstop();
	}
	return 0;
}
//TODO: Water flow measurement
inline float measureFlowSensor(uint32_t s) {
	uint32_t stamp_flow_sensor = g_systemTime;
	float flow_pluse = 0.0;
	uint8_t flow_pulse_state = I_OFF;
	while (!ns_delay_ms(&stamp_flow_sensor, s * 1000)) {
		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
			if (I_FLOW_PLUSE_PIN == 0)
				flow_pluse++;
			flow_pulse_state = I_FLOW_PLUSE_PIN;
		}
		R_WDT_Restart();
		realTimeResponse();
	}
	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (s); // L/minutes
	return g_io_status.refined.FlowValue;
}

uint8_t _pre_flow_state = I_OFF;
float _flow_pulse;
float measureFlowSensor_nostop(void) {
	uint8_t *state = &g_machine_state.flowSensor;
	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	switch (*state) {
	case 0:
//		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
//			(*state)++;
//		}
		(*state)++;
		break;
	case 1:
		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
			_pre_flow_state = I_FLOW_PLUSE_PIN;
			if (I_FLOW_PLUSE_PIN == I_ON) {
				_flow_pulse++;
			}
		}
		if (ns_delay_ms(tick,
				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
			(*state)++;
		}
		break;
	case 2:
		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
				/ g_timerSetting.t3_flowSensorMonitorTime_s;
		_flow_pulse = 0;
		(*state) = 0;
		break;
	default:
		(*state) = 0;
		break;
	}
	return g_io_status.refined.FlowValue;
}
