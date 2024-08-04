# Opcode: RLOC
# Priority: Normal
# Services: DCC_CAB or DCC_CMD
# Parameters: Dat1 (1 bytes) AddrH of the decoder, Dat2 (1 bytes) AddrL of the decoder
# Conditions: (Loco stack full) message is sent. If the loco is currently assigned to another session then an ERR (Loco
# Direction: Cab to command station
# States / Modes: 
# Result: If conditions are met then associate loco address to the specified session and send a PLOC message.