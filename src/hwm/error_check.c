/*
 * hwm_error_check.c
 *
 *  Created on: 6 Jan 2022
 *      Author: Hung
 */

#include "error_check.h"
union Alarm_Flag_u g_alarm;

/**
 * Alarm once when voltage fail. Stop until voltage valid.
 * 30/11/2021: Checked by An
 * @return 0 - OK; 1 - Error
 */
uint8_t Voltage1Check_waitReset(void) {
	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
			resetAlarm();
			sendToRasPi_f(H_ALARM, OVER_VOLTAGE_1,
					g_io_status.refined.CVCCVoltage);
			g_alarm.refined.over_voltage_1 = 1;
			electrolyticOperationOFF();
			waitAlarmConfirm_stop(OVER_VOLTAGE_1, 0);
			g_alarm.refined.over_voltage_1 = 0;
			return 1;
		}
	} else
		g_Tick.tickVoltage1Check = g_systemTime;
	return 0;
}
/**
 * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
 * 16/12/2021: Checked by An
 * @return 0 - OK
 */
void Voltage2Check_nostop(void) {
	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
			if (!(g_io_status.refined.CVCCVoltage
					>= g_numberSetting.upperVoltage1)) {
				resetAlarm();
				g_alarm.refined.over_voltage_2 = 1;
				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
						g_io_status.refined.CVCCVoltage);
			}
		}
	} else {
		g_Tick.tickVoltage2Check = g_systemTime;
		g_alarm.refined.over_voltage_2 = 0;
	}
}
/**
 * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
 * 16/12/2021: Checked by An
 * @return 0 - OK; 1 - Error
 */
uint8_t Voltage3Check_waitReset(void) {
	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
			if (!(g_io_status.refined.CVCCVoltage
					>= g_numberSetting.upperVoltage2)) {
				resetAlarm();
				g_alarm.refined.over_voltage_3 = 1;
				g_Tick.tickElectrolyticOff = g_systemTime;
//				g_machine_state.electrolyteOFF =
//						g_machine_state.electrolyteOFF == 0 ?
//								1 : g_machine_state.electrolyteOFF;
				electrolyticOperationOFF();
				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
						g_io_status.refined.CVCCVoltage);
				waitAlarmConfirm_stop(OVER_VOLTAGE_3, 0);
				g_alarm.refined.over_voltage_3 = 0;
				return 1;
			}
		}
	} else {
		g_Tick.tickVoltage3Check = g_systemTime;
	}
	return 0;
}
/**
 * Checked 16/12/2021
 * @return
 */
uint8_t LowVoltageCheck_waitReset(void) {
	if ((g_systemTime - g_TimeKeeper.neutralization
			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
				resetAlarm();
				g_alarm.refined.underVoltage = 1;
				g_Tick.tickElectrolyticOff = g_systemTime;
//				g_machine_state.electrolyteOFF =
//						g_machine_state.electrolyteOFF == 0 ?
//								1 : g_machine_state.electrolyteOFF;
				electrolyticOperationOFF();
				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
						g_io_status.refined.CVCCVoltage);
				waitAlarmConfirm_stop(UNDER_VOLTAGE, 0);
				g_alarm.refined.underVoltage = 0;
				return 1;
			}
		} else
			g_Tick.tickVoltageLowCheck = g_systemTime;
	} else
		g_Tick.tickVoltageLowCheck = g_systemTime;
	return 0;
}
uint8_t OverCurrentCheck_waitReset(void) {
	uint32_t _time_count = g_systemTime;
	const uint16_t _max_time = 10000;
	if (g_systemTime - g_TimeKeeper.neutralization >= 5000) {
		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
				|| (g_io_status.refined.CVCCCurrent
						>= g_numberSetting.upperCurrent)) {
			if ((g_alarm.refined.abnormal_current == 0)
					&& (g_alarm.refined.over_curent == 0)
					&& (g_io_status.refined.CVCCCurrent
							<= g_numberSetting.lowerCurrent)) {
				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
						g_io_status.refined.CVCCCurrent);
			}
			g_alarm.refined.abnormal_current =
					g_io_status.refined.CVCCCurrent
							<= g_numberSetting.lowerCurrent ? 1 : 0;

			if (g_io_status.refined.CVCCCurrent
					>= g_numberSetting.upperCurrent) {
				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
					resetAlarm();
					g_alarm.refined.over_curent = 1;
					g_Tick.tickElectrolyticOff = g_systemTime;
//					g_machine_state.electrolyteOFF =
//							g_machine_state.electrolyteOFF == 0 ?
//									1 : g_machine_state.electrolyteOFF;
					electrolyticOperationOFF();
					sendToRasPi_f(H_ALARM, OVER_CURRENT,
							g_io_status.refined.CVCCCurrent);
					waitAlarmConfirm_stop(OVER_CURRENT, 10);
					g_alarm.refined.over_curent = 0;
					return 1;
				}
			} else {
				g_Tick.tickCurrentCheck = g_systemTime;
			}
		}
	}
	return 0;
}

/**
 *
 * @return 1 - Invalid, 0 - OK
 */
uint8_t FlowSensorCheck_nonstop(void) {
	if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
			|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
		if(O_SUPPLY_WATER_PIN_SV1 == ON){
			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
					g_io_status.refined.FlowValue);
			g_alarm.refined.abnormal_flow = 1;
			return 1;
		}
		g_alarm.refined.abnormal_flow = 0;
		return 0;
	}
	g_alarm.refined.abnormal_flow = 0;
	return 0;
}

uint8_t solenoidCheck_nonstop(void) {
	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
		if (g_io_status.refined.FlowValue >= 0.1) {
			if (ns_delay_ms(&g_Tick.tickSolenoidCheck,
					g_timerSetting.t17_solenoidLeakageStartTime_s * 1000))
				sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
			g_alarm.refined.solenoid = 1;
			return 1;
		} else
			g_Tick.tickSolenoidCheck = g_systemTime;
	} else
		g_Tick.tickSolenoidCheck = g_systemTime;
	return 0;
}
uint8_t saltWaterTankFullCheck_nonstop(void) {
	if (I_SALT_H_PIN == ON) {
		if (ns_delay_ms(&g_Tick.tickSaltFullCheck,
				g_timerSetting.t18_fullSaltWaterMonitoringStart_h * 60 * 60
						* 1000)) {
			sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
			g_Tick.tickElectrolyticOff = g_systemTime;
			g_machine_state.electrolyteOFF =
					g_machine_state.electrolyteOFF == 0 ?
							1 : g_machine_state.electrolyteOFF;
			g_alarm.refined.salt_full = 1;
			;
			return 1;
		}
	} else
		g_Tick.tickSaltFullCheck = g_systemTime;
	return 0;
}

uint8_t saltWaterTankEmptyCheck(void) {
	if (I_SALT_L_PIN == 0) {
		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
		g_Tick.tickElectrolyticOff = g_systemTime;
		g_machine_state.electrolyteOFF =
				g_machine_state.electrolyteOFF == 0 ?
						1 : g_machine_state.electrolyteOFF;
		g_alarm.refined.salt_empty = 1;
		//TODO: Control Off

		return 1;
	}
	return 0;
}

uint8_t acidSkipErrorCheck_nonstop(void) {
	if (((I_ACID_L_PIN_FL1 == I_OFF)
			&& ((I_ACID_M_PIN_FL2 == I_ON || I_ACID_H_PIN_FL3 == I_ON)))
			|| (I_ACID_M_PIN_FL2 == I_OFF && I_ACID_H_PIN_FL3 == I_ON)) {
		sendToRasPi_f(H_ALARM, ACID_SKIP_ERROR, 1);
		g_alarm.refined.acid_skip = 1;
		//TODO: Control OFF
		return 1;
	}
	return 0;
}

uint8_t alkalineSkipErrorCheck(void) {
	if (((I_ALKALI_L_PIN_FL4 == I_OFF)
			&& ((I_ALKALI_M_PIN_FL5 == I_ON || I_ALKALI_H_PIN_FL6 == I_ON)))
			|| (I_ALKALI_M_PIN_FL5 == I_OFF && I_ALKALI_H_PIN_FL6 == I_ON)) {
		sendToRasPi_f(H_ALARM, ALKALINE_SKIP_ERROR, 1);
		g_alarm.refined.acid_skip = 1;
		//TODO: Control OFF
		return 1;
	}
	return 0;
}

uint8_t waterFullErrorCheck(void) {

	//Check g_color == BLACK for x hours
	if (g_machine_state.mode != HAND_WASHING
			&& g_machine_state.mode != WATER_WASHING
			&& g_machine_state.mode != ACID_WASHING
			&& g_machine_state.mode != ALKALINE_WASHING) {
		if(ns_delay_ms(&g_Tick.tickWaterFull, (uint32_t)20*60*1000)){
			sendToRasPi_f(H_ALARM, WATER_FULL_ERROR, 1);
			//TODO: Control OFF
			return 1;
		}
	}else
		g_Tick.tickWaterFull = g_systemTime;
	return 0;
}

uint8_t filterReplacementErrorCheck(void) {
	if (g_TimeKeeper.SV1SV2OnTime_h
			>= g_timerSetting.t20_waterFilterAlarmIgnore_h) {
		g_alarm.refined.filter = FILTER_REPLACEMENT_E2;
		sendToRasPi_u32(H_ALARM, FILTER_REPLACEMENT_E2,
				g_TimeKeeper.SV1SV2OnTime_h);
		//TODO: Control OFF
		return 2;

	} else if (g_TimeKeeper.SV1SV2OnTime_h
			>= g_timerSetting.t19_waterFilterAlarm_h) {
		g_alarm.refined.filter = FILTER_REPLACEMENT_E1;
		sendToRasPi_u32(H_ALARM, FILTER_REPLACEMENT_E1,
				g_TimeKeeper.SV1SV2OnTime_h);
		return 1;
	}
	return 0;
}

uint8_t levelSkipErrorCheck(void){
	if(I_ACID_L_PIN_FL1 == I_OFF && (I_ACID_M_PIN_FL2 == I_ON || I_ACID_H_PIN_FL3 == I_ON))
		g_alarm.refined.acid_skip = ON;
	else if (I_ACID_M_PIN_FL2 == I_OFF && I_ACID_H_PIN_FL3 == I_ON)
		g_alarm.refined.acid_skip = ON;
	else
		g_alarm.refined.acid_skip = OFF;

	if(I_ALKALI_L_PIN_FL4 == I_OFF && (I_ALKALI_M_PIN_FL5 == I_ON || I_ALKALI_H_PIN_FL6 == I_ON))
		g_alarm.refined.alkaline_skip = ON;
	else if(I_ALKALI_M_PIN_FL5 == I_OFF && I_ALKALI_H_PIN_FL6 == I_ON)
		g_alarm.refined.alkaline_skip = ON;
	else
		g_alarm.refined.alkaline_skip = OFF;

	return g_alarm.refined.acid_skip == ON || g_alarm.refined.alkaline_skip == ON ? 1 : 0;
}
