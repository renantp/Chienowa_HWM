# Chienowa_HWM
Control PCBA Version 1.10 Test Report
Problem in this version
Change in next version

1.	Component:

•	Capacitor C6, C7, C17, C18 are TMK325ABJ476MM but we buy EDH476M050A9HAA -> Do not fit the footprint -> Change footprint to EDH476M050A9HAA

•	Diode zener D42 is BZX84B5V1LYFHT116 but we buy RB160M-30TR -> Don’t fit the footprint -> Replace footprint to RB160M-30TR

•	Some connector was mounted wrong direction. -> Note for PCBA

•	2 Power supply module without case -> Change to no-case module

•	NC7SZ05P5X output is open-drain (Flow sensor signal) -> Add pull-up resistor

2.	Schematic

•	Some pin is open-drain (P60-P63) -> Can not output directly 5V to drive TLP241 -> Change the wiring, all pin will be sink output.

•	IC21 - ICL3232CVZ (RS232) did not connect to 5V power supply -> Fix the schematic

•	J28 – UART connector, pin 2 did not connect to GND -> Fix the schematic

•	P130 can only OUTPUT -> Change CVCC_ALARM_IN to CVCC_ALARM_RESET and vice versa

•	RS485 optional resistor swap needed -> A/Y to 5V, B/Z to GND

3.	Peripheral connection:

•	UART: OK.

•	RS485/RS232: OK.

•	EEPROM: OK.

•	Analog I/O: OK.

