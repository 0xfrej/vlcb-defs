# Opcode: DSPD
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session (1 bytes), Speed/Dir (1 bytes)
# Conditions: If the module is not a DCC command station then ignore the message. If the module does not have an active session with the specified session identifier then send ERR (No session).
# Direction: Cab to command station
# States / Modes: 
# Result: If conditions are met then set the speed and direction of the loco specified by the session.