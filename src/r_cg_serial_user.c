/***********************************************************************************************************************
 * DISCLAIMER
 * This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products.
 * No other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
 * applicable laws, including copyright laws.
 * THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING THIS SOFTWARE, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY
 * LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE FOR ANY DIRECT,
 * INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR
 * ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
 * Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability
 * of this software. By using this software, you agree to the additional terms and conditions found by accessing the
 * following link:
 * http://www.renesas.com/disclaimer
 *
 * Copyright (C) 2011, 2020 Renesas Electronics Corporation. All rights reserved.
 ***********************************************************************************************************************/

/***********************************************************************************************************************
 * File Name    : r_cg_serial_user.c
 * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
 * Device(s)    : R5F104ML
 * Tool-Chain   : CCRL
 * Description  : This file implements device driver for Serial module.
 * Creation Date: 30/11/2021
 ***********************************************************************************************************************/

/***********************************************************************************************************************
 Includes
 ***********************************************************************************************************************/
#include "hwm/hwm_main.h"
#include "r_cg_macrodriver.h"
#include "r_cg_serial.h"
/* Start user code for include. Do not edit comment generated here */
#include "r_cg_wdt.h"
#include "r_cg_userdefine.h"
/* End user code. Do not edit comment generated here */
/***********************************************************************************************************************
 Pragma directive
 ***********************************************************************************************************************/
#pragma interrupt r_uart1_interrupt_send(vect=INTST1)
#pragma interrupt r_uart1_interrupt_receive(vect=INTSR1)
#pragma interrupt r_csi00_interrupt(vect=INTCSI00)
#pragma interrupt r_csi01_interrupt(vect=INTCSI01)
#pragma interrupt r_uart2_interrupt_send(vect=INTST2)
#pragma interrupt r_uart2_interrupt_receive(vect=INTSR2)
#pragma interrupt r_uart3_interrupt_send(vect=INTST3)
#pragma interrupt r_uart3_interrupt_receive(vect=INTSR3)
/* Start user code for pragma. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
 Global variables and functions
 ***********************************************************************************************************************/
extern volatile uint8_t *gp_uart1_tx_address; /* uart1 send buffer address */
extern volatile uint16_t g_uart1_tx_count; /* uart1 send data number */
extern volatile uint8_t *gp_uart1_rx_address; /* uart1 receive buffer address */
extern volatile uint16_t g_uart1_rx_count; /* uart1 receive data number */
extern volatile uint16_t g_uart1_rx_length; /* uart1 receive data length */
extern volatile uint8_t *gp_csi00_rx_address; /* csi00 receive buffer address */
extern volatile uint16_t g_csi00_rx_length; /* csi00 receive data length */
extern volatile uint16_t g_csi00_rx_count; /* csi00 receive data count */
extern volatile uint8_t *gp_csi00_tx_address; /* csi00 send buffer address */
extern volatile uint16_t g_csi00_send_length; /* csi00 send data length */
extern volatile uint16_t g_csi00_tx_count; /* csi00 send data count */
extern volatile uint8_t *gp_csi01_rx_address; /* csi01 receive buffer address */
extern volatile uint16_t g_csi01_rx_length; /* csi01 receive data length */
extern volatile uint16_t g_csi01_rx_count; /* csi01 receive data count */
extern volatile uint8_t *gp_csi01_tx_address; /* csi01 send buffer address */
extern volatile uint16_t g_csi01_send_length; /* csi01 send data length */
extern volatile uint16_t g_csi01_tx_count; /* csi01 send data count */
extern volatile uint8_t *gp_uart2_tx_address; /* uart2 send buffer address */
extern volatile uint16_t g_uart2_tx_count; /* uart2 send data number */
extern volatile uint8_t *gp_uart2_rx_address; /* uart2 receive buffer address */
extern volatile uint16_t g_uart2_rx_count; /* uart2 receive data number */
extern volatile uint16_t g_uart2_rx_length; /* uart2 receive data length */
extern volatile uint8_t *gp_uart3_tx_address; /* uart3 send buffer address */
extern volatile uint16_t g_uart3_tx_count; /* uart3 send data number */
extern volatile uint8_t *gp_uart3_rx_address; /* uart3 receive buffer address */
extern volatile uint16_t g_uart3_rx_count; /* uart3 receive data number */
extern volatile uint16_t g_uart3_rx_length; /* uart3 receive data length */
/* Start user code for global. Do not edit comment generated here */
volatile uint8_t send_response_flag, send_response_time_flag,
		send_response_number_flag, recived_time_setting_flag,
		send_respone_status_flag, recived_number_setting_flag;
volatile struct Communicaition_flag_s g_commnunication_flag;
volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end,
		g_uart1_send, g_uart2_sendend, g_uart2_receive;
uint8_t g_rx_data[4 * 40];
uint8_t g_uart3_rx_data[8];
volatile uint8_t g_uart2_fault;
volatile uint8_t g_uart3_sendend;

/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
 * Function Name: r_uart1_interrupt_receive
 * Description  : This function is INTSR1 interrupt service routine.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void __near r_uart1_interrupt_receive(void) {
	volatile uint8_t rx_data;
	volatile uint8_t err_type;

	err_type = (uint8_t) (SSR03 & 0x0007U);
	SIR03 = (uint16_t) err_type;

	if (err_type != 0U) {
		r_uart1_callback_error(err_type);
	}

	rx_data = RXD1;

	if (g_uart1_rx_length > g_uart1_rx_count) {
		*gp_uart1_rx_address = rx_data;
		gp_uart1_rx_address++;
		g_uart1_rx_count++;

		if (g_uart1_rx_length == g_uart1_rx_count) {
			r_uart1_callback_receiveend();
		}
	} else {
		r_uart1_callback_softwareoverrun(rx_data);
	}
}

/***********************************************************************************************************************
 * Function Name: r_uart1_interrupt_send
 * Description  : This function is INTST1 interrupt service routine.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void __near r_uart1_interrupt_send(void) {
	if (g_uart1_tx_count > 0U) {
		TXD1 = *gp_uart1_tx_address;
		gp_uart1_tx_address++;
		g_uart1_tx_count--;
	} else {
		r_uart1_callback_sendend();
	}
}

/***********************************************************************************************************************
 * Function Name: r_uart1_callback_receiveend
 * Description  : This function is a callback function when UART1 finishes reception.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart1_callback_receiveend(void) {
	/* Start user code. Do not edit comment generated here */
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart1_callback_softwareoverrun
 * Description  : This function is a callback function when UART1 receives an overflow data.
 * Arguments    : rx_data -
 *                    receive data
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart1_callback_softwareoverrun(uint16_t rx_data) {
	/* Start user code. Do not edit comment generated here */
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart1_callback_sendend
 * Description  : This function is a callback function when UART1 finishes transmission.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart1_callback_sendend(void) {
	/* Start user code. Do not edit comment generated here */
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart1_callback_error
 * Description  : This function is a callback function when UART1 reception error occurs.
 * Arguments    : err_type -
 *                    error type value
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart1_callback_error(uint8_t err_type) {
	/* Start user code. Do not edit comment generated here */
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_csi00_interrupt
 * Description  : This function is INTCSI00 interrupt service routine.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void __near r_csi00_interrupt(void) {
	volatile uint8_t err_type;

	err_type = (uint8_t) (SSR00 & _0001_SAU_OVERRUN_ERROR);
	SIR00 = (uint16_t) err_type;

	if (err_type != 1U) {
		if (g_csi00_tx_count > 0U) {
			SIO00 = *gp_csi00_tx_address;
			gp_csi00_tx_address++;
			g_csi00_tx_count--;
		} else {
			r_csi00_callback_sendend(); /* complete send */
		}
	}
}

/***********************************************************************************************************************
 * Function Name: r_csi00_callback_sendend
 * Description  : This function is a callback function when CSI00 finishes transmission.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void r_csi00_callback_sendend(void) {
	/* Start user code. Do not edit comment generated here */
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_csi01_interrupt
 * Description  : This function is INTCSI01 interrupt service routine.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void __near r_csi01_interrupt(void) {
	volatile uint8_t err_type;
	volatile uint8_t sio_dummy;

	err_type = (uint8_t) (SSR01 & _0001_SAU_OVERRUN_ERROR);
	SIR01 = (uint16_t) err_type;

	if (1U == err_type) {
		r_csi01_callback_error(err_type); /* overrun error occurs */
	} else {
		if (g_csi01_tx_count > 0U) {
			if (0U != gp_csi01_rx_address) {
				*gp_csi01_rx_address = SIO01;
				gp_csi01_rx_address++;
			} else {
				sio_dummy = SIO01;
			}

			if (0U != gp_csi01_tx_address) {
				SIO01 = *gp_csi01_tx_address;
				gp_csi01_tx_address++;
			} else {
				SIO01 = 0xFFU;
			}

			g_csi01_tx_count--;
		} else {
			if (0U == g_csi01_tx_count) {
				if (0U != gp_csi01_rx_address) {
					*gp_csi01_rx_address = SIO01;
				} else {
					sio_dummy = SIO01;
				}
			}

			r_csi01_callback_sendend(); /* complete send */
			r_csi01_callback_receiveend(); /* complete receive */
		}
	}
}

/***********************************************************************************************************************
 * Function Name: r_csi01_callback_receiveend
 * Description  : This function is a callback function when CSI01 finishes reception.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void r_csi01_callback_receiveend(void) {
	/* Start user code. Do not edit comment generated here */
	g_csi_rev_end++;
	R_CSI01_Stop();
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_csi01_callback_error
 * Description  : This function is a callback function when CSI01 reception error occurs.
 * Arguments    : err_type -
 *                    error type value
 * Return Value : None
 ***********************************************************************************************************************/
static void r_csi01_callback_error(uint8_t err_type) {
	/* Start user code. Do not edit comment generated here */

	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_csi01_callback_sendend
 * Description  : This function is a callback function when CSI01 finishes transmission.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void r_csi01_callback_sendend(void) {
	/* Start user code. Do not edit comment generated here */
	g_csi_send_end++;
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart2_interrupt_receive
 * Description  : This function is INTSR2 interrupt service routine.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void __near r_uart2_interrupt_receive(void) {
	volatile uint8_t rx_data;
	volatile uint8_t err_type;

	err_type = (uint8_t) (SSR11 & 0x0007U);
	SIR11 = (uint16_t) err_type;

	if (err_type != 0U) {
		r_uart2_callback_error(err_type);
	}

	rx_data = RXD2;

	if (g_uart2_rx_length > g_uart2_rx_count) {
		*gp_uart2_rx_address = rx_data;
		gp_uart2_rx_address++;
		g_uart2_rx_count++;

		if (g_uart2_rx_length == g_uart2_rx_count) {
			r_uart2_callback_receiveend();
		}
	} else {
		r_uart2_callback_softwareoverrun(rx_data);
	}
}

/***********************************************************************************************************************
 * Function Name: r_uart2_interrupt_send
 * Description  : This function is INTST2 interrupt service routine.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void __near r_uart2_interrupt_send(void) {
	if (g_uart2_tx_count > 0U) {
		TXD2 = *gp_uart2_tx_address;
		gp_uart2_tx_address++;
		g_uart2_tx_count--;
	} else {
		r_uart2_callback_sendend();
	}
}

/***********************************************************************************************************************
 * Function Name: r_uart2_callback_receiveend
 * Description  : This function is a callback function when UART2 finishes reception.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart2_callback_receiveend(void) {
	/* Start user code. Do not edit comment generated here */
	Raspberry_uart2_handle();
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart2_callback_softwareoverrun
 * Description  : This function is a callback function when UART2 receives an overflow data.
 * Arguments    : rx_data -
 *                    receive data
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart2_callback_softwareoverrun(uint16_t rx_data) {
	/* Start user code. Do not edit comment generated here */
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart2_callback_sendend
 * Description  : This function is a callback function when UART2 finishes transmission.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart2_callback_sendend(void) {
	/* Start user code. Do not edit comment generated here */
	g_uart2_sendend++;
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart2_callback_error
 * Description  : This function is a callback function when UART2 reception error occurs.
 * Arguments    : err_type -
 *                    error type value
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart2_callback_error(uint8_t err_type) {
	/* Start user code. Do not edit comment generated here */
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart3_interrupt_receive
 * Description  : This function is INTSR3 interrupt service routine.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void __near r_uart3_interrupt_receive(void) {
	volatile uint8_t rx_data;
	volatile uint8_t err_type;

	err_type = (uint8_t) (SSR13 & 0x0007U);
	SIR13 = (uint16_t) err_type;

	if (err_type != 0U) {
		r_uart3_callback_error(err_type);
	}

	rx_data = RXD3;

	if (g_uart3_rx_length > g_uart3_rx_count) {
		*gp_uart3_rx_address = rx_data;
		gp_uart3_rx_address++;
		g_uart3_rx_count++;

		if (g_uart3_rx_length == g_uart3_rx_count) {
			r_uart3_callback_receiveend();
		}
	} else {
		r_uart3_callback_softwareoverrun(rx_data);
	}
}

/***********************************************************************************************************************
 * Function Name: r_uart3_interrupt_send
 * Description  : This function is INTST3 interrupt service routine.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void __near r_uart3_interrupt_send(void) {
	if (g_uart3_tx_count > 0U) {
		TXD3 = *gp_uart3_tx_address;
		gp_uart3_tx_address++;
		g_uart3_tx_count--;
	} else {
		r_uart3_callback_sendend();
	}
}

/***********************************************************************************************************************
 * Function Name: r_uart3_callback_receiveend
 * Description  : This function is a callback function when UART3 finishes reception.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart3_callback_receiveend(void) {
	/* Start user code. Do not edit comment generated here */
	R_UART3_Receive(g_uart3_rx_data, 7);
	if (g_uart3_rx_data[0] == 1) {
		//Read timer setting
		if ((rs485_rx_p[0] == H_READ) && (rs485_rx_p[1] == READ_TIME)) {
			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 1;
		} else if ((rs485_rx_p[0] == 82) && (rs485_rx_p[1] == 24)) {
			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 1;
		} else if ((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 70)) {
			//TODO: Start Water Softener

		} else if ((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 80)) {
			//TODO: Stop Water Softener + Time of SNP ON (4 bytes)
		}
	} else if (g_uart3_rx_data[0] == 2) {
		if ((rs485_rx_p[0] == 11)) {
			g_commnunication_flag.rs485_send_to_valve_response_flag = 1;
		} else if ((rs485_rx_p[0] == 12)) {
			g_commnunication_flag.rs485_get_valve_gesture_flag = 1;
		}
	} else if (g_uart3_rx_data[0] != 0xff) {
		g_commnunication_flag.rs485_fault = 1;
	}
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart3_callback_softwareoverrun
 * Description  : This function is a callback function when UART3 receives an overflow data.
 * Arguments    : rx_data -
 *                    receive data
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart3_callback_softwareoverrun(uint16_t rx_data) {
	/* Start user code. Do not edit comment generated here */
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart3_callback_sendend
 * Description  : This function is a callback function when UART3 finishes transmission.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart3_callback_sendend(void) {
	/* Start user code. Do not edit comment generated here */
	g_uart3_sendend++;
	O_RS485_MODE_PIN = 0U;
	/* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
 * Function Name: r_uart3_callback_error
 * Description  : This function is a callback function when UART3 reception error occurs.
 * Arguments    : err_type -
 *                    error type value
 * Return Value : None
 ***********************************************************************************************************************/
static void r_uart3_callback_error(uint8_t err_type) {
	/* Start user code. Do not edit comment generated here */
	/* End user code. Do not edit comment generated here */
}

/* Start user code for adding. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
