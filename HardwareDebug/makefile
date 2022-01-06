################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include makefile.init

RM := rm -rf *.sni *.dbg *.lst *.lis *.lpp *.map *.x *.lbp *.h *.bls *.libelf *.rel *.lbk *.abs *.prn *.mi *.fsy *.ud *.udm 1st/*.abs 1st/*.fsy

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include src/hwm/subdir.mk
-include generate/subdir.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif 
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif 
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif 
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif 
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif 
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif 
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif 
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif 
ifneq ($(strip $(SX_DEPS)),)
-include $(SX_DEPS)
endif 
ifneq ($(strip $(JMP_DEPS)),)
-include $(JMP_DEPS)
endif 
ifneq ($(strip $(SRC_DEPS)),)
-include $(SRC_DEPS)
endif 
ifneq ($(strip $(PP_DEPS)),)
-include $(PP_DEPS)
endif 
ifneq ($(strip $(P_DEPS)),)
-include $(P_DEPS)
endif 
ifneq ($(strip $(FSY_DEPS)),)
-include $(FSY_DEPS)
endif 
endif

ifneq ($(strip $(SRC_UPPER_SRCS)),)
ALL_ASMS += $(SRC_UPPER_SRCS) 
endif
ifneq ($(strip $(SRC_SRCS)),)
ALL_ASMS += $(SRC_SRCS) 
endif
ifneq ($(strip $(S_UPPER_SRCS)),)
ALL_ASMS += $(S_UPPER_SRCS) 
endif
ifneq ($(strip $(S_SRCS)),)
ALL_ASMS += $(S_SRCS) 
endif


-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables
LINKER_OUTPUT_OUTPUTS += \
ControlPCB_HWM.abs

CONVERTOR_OUTPUT_OUTPUTS += \
ControlPCB_HWM.mot

OBJS := \
$(COMPILER_OBJS) \
$(INDIVIDUAL_COMPILER_OBJS) \
$(ASSEMBLER_OBJS) \
$(CUSTOM_OBJS)


# All Target
all: $(CONVERTOR_OUTPUT_OUTPUTS) ControlPCB_HWM.x ControlPCB_HWM.udm

	@echo 'Build complete.'

ControlPCB_HWM.mot: $(LINKER_OUTPUT_OUTPUTS) 
	@echo 'Invoking: Converter'
	@echo 'Building target:'
	@echo ConverterControlPCB_HWM.tmp=
	@sed -e "s/^/    /" "ConverterControlPCB_HWM.tmp"
	rlink "ControlPCB_HWM.abs" -subcommand="ConverterControlPCB_HWM.tmp"
	@echo 'Finished building target:'
	@echo.


ControlPCB_HWM.abs: $(OBJS)  $(ALL_ASMS)
	@echo 'Invoking: Linker'
	@echo LinkerControlPCB_HWM.tmp=
	@sed -e "s/^/    /" "LinkerControlPCB_HWM.tmp"
	rlink -subcommand="LinkerControlPCB_HWM.tmp"
	@echo 'Finished building:'
	@echo.


ControlPCB_HWM.x: ControlPCB_HWM.abs
		-D:\Chieniwa\E2_Studio\.eclipse\com.renesas.platform_1435879475\Utilities\\ccrl\renesas_cc_converter.exe ControlPCB_HWM.abs ControlPCB_HWM.x

ControlPCB_HWM.udm: $(LINKER_OUTPUT_OUTPUTS) $(CONVERTOR_OUTPUT_OUTPUTS)
	udcollector -subcommand=udSubcommand.tmp -output=ControlPCB_HWM.udm

# Other Targets
clean:
	-$(RM) $(LINKER_OUTPUT_OUTPUTS) $(CONVERTOR_OUTPUT_OUTPUTS)
	-rm -rf $(OBJS) $(C_DEPS) $(ASM_DEPS) $(DSP_DEPS) 
	-rm -rf src/*.asm src/*.p src/*.pp src/*.src src/*.jmp src/*.lst src/*.prn src/*.i src/*.ud 
	-rm -rf src/hwm/*.asm src/hwm/*.p src/hwm/*.pp src/hwm/*.src src/hwm/*.jmp src/hwm/*.lst src/hwm/*.prn src/hwm/*.i src/hwm/*.ud 
	-rm -rf generate/*.asm generate/*.p generate/*.pp generate/*.src generate/*.jmp generate/*.lst generate/*.prn generate/*.i generate/*.ud 
	@echo
	@echo 'Clean complete.'

.PHONY: all clean 
-include ../makefile.targets