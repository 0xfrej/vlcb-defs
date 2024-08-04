# Opcode: ALOC
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Session ID (1 byte) the Session ID. Allocation code (1 byte) application specific allocation code.
# Conditions: If the module is not a DCC command station then ignore the request. If the module does not have an active session with the specified session identifier then send an ERR (No session) message.
# Direction: To command station
# States / Modes: 
# Result: If conditions are met then assign the activity code to the session otherwise.