# Opcode: DFLG
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session (1 bytes), SpeedMode (1 bytes)
# Conditions: If the module is not a DCC command station then ignore the message. If the module does not have an active session with the specified session identifier then send an ERR (No session) message.
# Direction: Cab to command station
# States / Modes: 
# Result: If conditions are met then set the specified session flags.