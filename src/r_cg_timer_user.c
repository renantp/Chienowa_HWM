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
* File Name    : r_cg_timer_user.c
* Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
* Device(s)    : R5F104ML
* Tool-Chain   : CCRL
* Description  : This file implements device driver for TAU module.
* Creation Date: 24/11/2021
***********************************************************************************************************************/

/***********************************************************************************************************************
Includes
***********************************************************************************************************************/
#include "r_cg_macrodriver.h"
#include "r_cg_timer.h"
/* Start user code for include. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
#include "r_cg_userdefine.h"

/***********************************************************************************************************************
Pragma directive
***********************************************************************************************************************/
#pragma interrupt r_tau0_channel0_interrupt(vect=INTTM00)
#pragma interrupt r_tau0_channel1_interrupt(vect=INTTM01)
#pragma interrupt r_tau0_channel2_interrupt(vect=INTTM02)
/* Start user code for pragma. Do not edit comment generated here */
volatile uint8_t timer0_ch0_flag, timer0_ch1_flag, timer0_ch2_flag;
volatile uint32_t g_systemTime;
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
Global variables and functions
***********************************************************************************************************************/
/* Start user code for global. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
* Function Name: r_tau0_channel0_interrupt
* Description  : This function is INTTM00 interrupt service routine.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
static void __near r_tau0_channel0_interrupt(void)
{
    /* Start user code. Do not edit comment generated here */
	g_systemTime++;
	timer0_ch0_flag = 1;
    /* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
* Function Name: r_tau0_channel1_interrupt
* Description  : This function is INTTM01 interrupt service routine.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
static void __near r_tau0_channel1_interrupt(void)
{
    /* Start user code. Do not edit comment generated here */
	timer0_ch1_flag = 1;
    /* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
* Function Name: r_tau0_channel2_interrupt
* Description  : This function is INTTM02 interrupt service routine.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
static void __near r_tau0_channel2_interrupt(void)
{
    /* Start user code. Do not edit comment generated here */
	timer0_ch2_flag = 1;
    /* End user code. Do not edit comment generated here */
}

/* Start user code for adding. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
