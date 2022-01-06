/*
 * io_control.c
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#include "io_control.h"

/********************** Check Input *******************/
uint8_t isAcidTankFull(void) {
	if (I_ACID_H_PIN_FL3 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
				g_timerSetting.t28_onDelayHighLevel_s * 1000)
				|| (g_mean_io_status.refined.AcidHighLevel == 1)) {
			g_mean_io_status.refined.AcidHighLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[0] = g_systemTime;
		g_mean_io_status.refined.AcidHighLevel = 0;
	}
	return 0;
}
uint8_t isAcidTankAlmostFull(void) {
	if (I_ACID_M_PIN_FL2 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
				g_timerSetting.t27_onDelayLowLevel_s * 1000)
				|| (g_mean_io_status.refined.AcidLowLevel == 1)) {
			g_mean_io_status.refined.AcidLowLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[1] = g_systemTime;
		g_mean_io_status.refined.AcidLowLevel = 0;
	}
	return 0;
}
uint8_t isAcidTankHasSomething(void) {
	if (I_ACID_L_PIN_FL1 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.AcidEmptyLevel == 1)) {
			g_mean_io_status.refined.AcidEmptyLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAcidLevel[2] = g_systemTime;
		isAcidTankEmpty();
	}
	return 0;
}
uint8_t isAcidTankEmpty(void) {
	if (I_ACID_L_PIN_FL1 == I_OFF) {
		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.AcidEmptyLevel == 0)) {
			g_mean_io_status.refined.AcidEmptyLevel = 0;
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
				g_timerSetting.t28_onDelayHighLevel_s * 1000)
				|| (g_mean_io_status.refined.AlkalineHighLevel == 1)) {
			g_mean_io_status.refined.AlkalineHighLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[0] = g_systemTime;
		g_mean_io_status.refined.AlkalineHighLevel = 0;
	}
	return 0;
}
uint8_t isAlkalineTankAlmostFull(void) {
	if (I_ALKALI_M_PIN_FL5 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
				g_timerSetting.t27_onDelayLowLevel_s * 1000)
				|| (g_mean_io_status.refined.AlkalineLowLevel == 1)) {
			g_mean_io_status.refined.AlkalineLowLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[1] = g_systemTime;
		g_mean_io_status.refined.AlkalineLowLevel = 0;
	}
	return 0;
}
uint8_t isAlkalineTankHasSomething(void) {
	if (I_ALKALI_L_PIN_FL4 == I_ON) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 1)) {
			g_mean_io_status.refined.AlkalineEmptyLevel = 1;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[2] = g_systemTime;
		isAlkalineTankEmpty();
	}
	return 0;
}
uint8_t isAlkalineTankEmpty(void) {
	if (I_ALKALI_L_PIN_FL4 == I_OFF) {
		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 0)) {
			g_mean_io_status.refined.AlkalineEmptyLevel = 0;
			return 1;
		}
	} else {
		g_Tick.tickAlkalineLevel[3] = g_systemTime;
		isAlkalineTankHasSomething();
	}
	return 0;
}

//TODO: Water flow measurement
float measureFlowSensor(uint32_t *s) {
	uint32_t stamp_flow_sensor = g_systemTime;
	float flow_pluse = 0.0;
	uint8_t flow_pulse_state = I_OFF;
	while (!ns_delay_ms(&stamp_flow_sensor, (*s) * 1000)) {
		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
			if (I_FLOW_PLUSE_PIN == 0)
				flow_pluse++;
			flow_pulse_state = I_FLOW_PLUSE_PIN;
		}
		R_WDT_Restart();
	}
	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*s); // L/minutes
	return g_io_status.refined.FlowValue;
}

uint8_t _pre_flow_state = I_OFF;
float _flow_pulse;
float measureFlowSensor_nostop(void) {
	uint8_t *state = &g_machine_state.flowSensor;
	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	switch (*state) {
	case 0:
		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
			(*state)++;
		}
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
