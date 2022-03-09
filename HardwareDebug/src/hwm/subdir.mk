################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
../src/hwm/error_check.c \
../src/hwm/hand_sensor_interface.c \
../src/hwm/hwm_main.c \
../src/hwm/io_control.c \
../src/hwm/normal_operation.c \
../src/hwm/operation.c \
../src/hwm/raspberry_pi_interface.c 

COMPILER_OBJS += \
src/hwm/error_check.obj \
src/hwm/hand_sensor_interface.obj \
src/hwm/hwm_main.obj \
src/hwm/io_control.obj \
src/hwm/normal_operation.obj \
src/hwm/operation.obj \
src/hwm/raspberry_pi_interface.obj 

C_DEPS += \
src/hwm/error_check.d \
src/hwm/hand_sensor_interface.d \
src/hwm/hwm_main.d \
src/hwm/io_control.d \
src/hwm/normal_operation.d \
src/hwm/operation.d \
src/hwm/raspberry_pi_interface.d 

# Each subdirectory must supply rules for building sources it contributes
src/hwm/%.obj: ../src/hwm/%.c 
	@echo 'Scanning and building file: $<'
	@echo 'Invoking: Scanner and Compiler'
	@echo src\hwm\cDepSubCommand.tmp=
	@sed -e "s/^/ /" "src\hwm\cDepSubCommand.tmp"
	ccrl -subcommand="src\hwm\cDepSubCommand.tmp" -o "$(@:%.obj=%.d)"  -MT="$(@:%.obj=%.obj)"  -MT="$(@:%.obj=%.d)" -msg_lang=english "$<"
	@echo src\hwm\cSubCommand.tmp=
	@sed -e "s/^/ /" "src\hwm\cSubCommand.tmp"
	ccrl -subcommand="src\hwm\cSubCommand.tmp" -msg_lang=english -o "$(@:%.d=%.obj)" "$<"
	@echo 'Finished Scanning and building: $<'
	@echo.

