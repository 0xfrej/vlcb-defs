# Opcode: RDCC6
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: REP (1 bytes), Byte0 (1 bytes), Byte1 (1 bytes), Byte2 (1 bytes), Byte3 (1 bytes), Byte4 (1 bytes), Byte5 (1 bytes)
# Conditions: If the NN does not match the node number of the module then ignore the message. If the module is not a DCC command station then ignore the message.
# Direction: To module
# States / Modes: 
# Result: If conditions are met then the requested DCC packet is sent <REP> times.