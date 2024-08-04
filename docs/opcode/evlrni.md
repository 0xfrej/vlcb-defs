# Opcode: EVLRNI
# Priority: Low
# Services: Teach
# Parameters: NN (2 bytes) Event Node number, EN (2 bytes) Event number, EN# (1 bytes) Event index, EV# (1 bytes) Event variable index, EV val (1 bytes) Event variable value
# Conditions: message. If the event variable index is greater than the number of EVs per event parameter then send a CMDERR(Invalid Event Variable Index)
# Direction: To module
# States / Modes: 
# Result: If conditions are met then Save the EV and send a WRACK message.