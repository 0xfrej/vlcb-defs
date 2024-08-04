# Opcode: DKEEP
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session (1 bytes)
# Conditions: If the module is not a DCC command station then the message is ignored.
# Direction: Cab to command station
# States / Modes: 
# Result: If conditions are met then Reset the session’s keep alive timer.