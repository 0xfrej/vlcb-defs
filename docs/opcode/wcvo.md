# Opcode: WCVO
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session (1 bytes), CV (2 bytes), Value (1 bytes)
# Conditions: If the module is not a DCC command station then ignore the message. If the command station does not have an active session with the specified session identifier then send a message ERR(No session).
# Direction: To command station
# States / Modes: 
# Result: If conditions are met then the DCC command stations shall write the specified value to the specified CV.