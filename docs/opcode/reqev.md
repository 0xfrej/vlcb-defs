# Opcode: REQEV
# Priority: Low
# Services: Teach
# Parameters: NN (2 bytes) Node number of event, EN (2 bytes) Event number, EV# (1 bytes) Event variable index
# Conditions: If the EV# is greater than the number of EVs per event then send a message CMDERR(Invalid event variable index) and GRSP(Invalid
# Direction: To module
# States / Modes: 
# Result: message with the EV value. If conditions are met and EV# is zero then first send EVANS for index 0