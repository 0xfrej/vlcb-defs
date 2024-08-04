# Opcode: KCON
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session (1 bytes), Consist# (1 bytes)
# Conditions: If the module does not have a consist with the specified Consist# id then ignore the message.
# Direction: To module
# States / Modes: 
# Result: If conditions are met then remove the specified session from the specified consist.