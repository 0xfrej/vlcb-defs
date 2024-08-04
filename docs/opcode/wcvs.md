# Opcode: WCVS
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session (1 bytes), CV (2 bytes), Mode (1 bytes), Value (1 bytes)
# Conditions: If the NN does not match the module’s node number then ignore the message. If the module is not a DCC command station then ignore the request. If the command station does not have an active session with id <Session> then send a ERR(No session) message.
# Direction: To module
# States / Modes: 
# Result: If conditions are met then the DCC command station shall write the specified CV.