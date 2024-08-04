# Opcode: QCVS
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session (1 bytes), CV (2 bytes), Mode (1 bytes)
# Conditions: If the module is not a DCC command station then ignore the message. If the command station does not have an active session with the specified session identifier then send a message ERR(No session).
# Direction: Cab to command station
# States / Modes: 
# Result: 