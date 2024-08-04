# Opcode: BOOTM
# Priority: Low
# Services: Boot
# Parameters: NN (2 bytes) Node number
# Conditions: If NN does not match the module’s node number then ignore the message.
# Direction: To module
# States / Modes: 
# Result: If conditions are met then enter BOOT mode. If using the standard PIC bootloader then write a 0x01 to the top EEPROM location and reset the processor. The module’s PIC bootloader will be activated before the application code. Once the bootloading is complete it will pass control by to the application at the Load Address in the parameter block.