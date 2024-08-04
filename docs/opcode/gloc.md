# Opcode: GLOC
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Addr (2 bytes), Flags (1 bytes)
# Conditions: (Invalid Request) message. If the loco with the specified address is taken and steal/share is disabled then send an ERR (Loco taken) message.
# Direction: Cab to command station
# States / Modes: 
# Result: 