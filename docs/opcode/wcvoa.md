# Opcode: WCVOA
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Addr (2 bytes), CV (2 bytes), Mode (1 bytes), Value (1 bytes)
# Conditions: If the NN does not match the module’s node number then ignore the message. If the module is not a DCC command station then ignore the request.
# Direction: To command station
# States / Modes: 
# Result: If conditions are met then the DCC command station shall write the specified CV.