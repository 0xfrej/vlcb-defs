# Opcode: QLOC
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session (1 bytes)
# Conditions: If the module is not a DCC command station then the message is ignored. If the module does not have an active session with the specified session identifier then an ERR message is sent.
# Direction: Cab to command station
# States / Modes: 
# Result: 