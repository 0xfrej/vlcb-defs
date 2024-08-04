# Opcode: STMOD
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session (1 bytes), mode (1 bytes)
# Conditions: If the module is not a DCC command station then ignore the request. If the module does not have an active session with the specified session identifier then send an ERR (No session) message.
# Direction: Cab to command station
# States / Modes: 
# Result: If conditions are met then update the session information for number of speed steps, service mode and sound control mode.