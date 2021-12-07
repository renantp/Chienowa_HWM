/*
 * crc8.h
 *
 *  Created on: 6 Dec 2021
 *      Author: Hung
 */

#ifndef CRC8_H_
#define CRC8_H_
#include <stdlib.h>
#include "r_cg_macrodriver.h"

uint8_t crc8_4(uint8_t *p, uint8_t len);
uint8_t crc8_1(uint8_t *p, uint8_t len);

#endif /* CRC8_H_ */
