# Opcode: NVSET
# Priority: Low
# Services: NV
# Parameters: NN (2 bytes) Node number, NV# (1 bytes) Node variable index, NV val (1 bytes) Node variable value
# Conditions: If NV# is not between 1 (inclusive) and the number of NVs )inclusive) then send a CMDERR(Invalid Node Variable Index) message.
# Direction: To module
# States / Modes: 
# Result: 