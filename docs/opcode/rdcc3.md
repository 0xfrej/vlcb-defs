# Opcode: RDCC3
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Rep (1 bytes), Byte1 (1 bytes), Byte2 (1 bytes), Byte3 (1 bytes)
# Conditions: If the module is not a command station then ignore the message.
# Direction: Cab to common station
# States / Modes: 
# Result: If conditions are met then the DCC command stations shall send the requested DCC packet <REP> times.