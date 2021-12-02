################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
../src/EEPROM.c \
../src/interrupt_handle.c \
../src/main.c \
../src/r_cg_adc.c \
../src/r_cg_adc_user.c \
../src/r_cg_cgc.c \
../src/r_cg_cgc_user.c \
../src/r_cg_dac.c \
../src/r_cg_dac_user.c \
../src/r_cg_port.c \
../src/r_cg_port_user.c \
../src/r_cg_rtc.c \
../src/r_cg_rtc_user.c \
../src/r_cg_serial.c \
../src/r_cg_serial_user.c \
../src/r_cg_timer.c \
../src/r_cg_timer_user.c \
../src/r_cg_wdt.c \
../src/r_cg_wdt_user.c \
../src/r_main.c \
../src/r_systeminit.c \
../src/usr_timer.c 

COMPILER_OBJS += \
src/EEPROM.obj \
src/interrupt_handle.obj \
src/main.obj \
src/r_cg_adc.obj \
src/r_cg_adc_user.obj \
src/r_cg_cgc.obj \
src/r_cg_cgc_user.obj \
src/r_cg_dac.obj \
src/r_cg_dac_user.obj \
src/r_cg_port.obj \
src/r_cg_port_user.obj \
src/r_cg_rtc.obj \
src/r_cg_rtc_user.obj \
src/r_cg_serial.obj \
src/r_cg_serial_user.obj \
src/r_cg_timer.obj \
src/r_cg_timer_user.obj \
src/r_cg_wdt.obj \
src/r_cg_wdt_user.obj \
src/r_main.obj \
src/r_systeminit.obj \
src/usr_timer.obj 

C_DEPS += \
src/EEPROM.d \
src/interrupt_handle.d \
src/main.d \
src/r_cg_adc.d \
src/r_cg_adc_user.d \
src/r_cg_cgc.d \
src/r_cg_cgc_user.d \
src/r_cg_dac.d \
src/r_cg_dac_user.d \
src/r_cg_port.d \
src/r_cg_port_user.d \
src/r_cg_rtc.d \
src/r_cg_rtc_user.d \
src/r_cg_serial.d \
src/r_cg_serial_user.d \
src/r_cg_timer.d \
src/r_cg_timer_user.d \
src/r_cg_wdt.d \
src/r_cg_wdt_user.d \
src/r_main.d \
src/r_systeminit.d \
src/usr_timer.d 

# Each subdirectory must supply rules for building sources it contributes
src/%.obj: ../src/%.c 
	@echo 'Scanning and building file: $<'
	@echo 'Invoking: Scanner and Compiler'
	@echo src\cDepSubCommand.tmp=
	@sed -e "s/^/ /" "src\cDepSubCommand.tmp"
	ccrl -subcommand="src\cDepSubCommand.tmp" -o "$(@:%.obj=%.d)"  -MT="$(@:%.obj=%.obj)"  -MT="$(@:%.obj=%.d)" -msg_lang=english "$<"
	@echo src\cSubCommand.tmp=
	@sed -e "s/^/ /" "src\cSubCommand.tmp"
	ccrl -subcommand="src\cSubCommand.tmp" -msg_lang=english -o "$(@:%.d=%.obj)" "$<"
	@echo 'Finished Scanning and building: $<'
	@echo.

