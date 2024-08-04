# Opcode: REVAL
# Priority: Low
# Services: Teach
# Parameters: NN (2 bytes) Node number, EN# (1 bytes) Event index, EV# (1 bytes) Event variable index
# Conditions: If the module does not have an event for the event index then send a message CMDERR(Invalid Event).
# Direction: To module
# States / Modes: 
# Result: message with the EV value. If conditions are met and EV# is zero then first send NEVAL for index 0