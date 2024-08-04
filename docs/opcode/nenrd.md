# Opcode: NENRD
# Priority: Low
# Services: Teach
# Parameters: NN (2 bytes) Node number, EN# (1 bytes) Event index
# Conditions: NN matches module’s node number. EN# is a valid event index
# Direction: To module
# States / Modes: 
# Result: response message otherwise send CMDERR(Invalid Event Index).