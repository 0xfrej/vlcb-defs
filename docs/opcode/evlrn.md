# Opcode: EVLRN
# Priority: Low
# Services: Event/Teach
# Parameters: NN (2 bytes) Event Node number, EN (2 bytes) Event number, EV# (1 bytes) Event variable index, (1-n) EV val (1 bytes) Event variable value
# Conditions: GRSP(Too many events) message.
# Direction: To module
# States / Modes: 
# Result: If the NN is zero then the taught event will be considered to be a Short event. If the NN is non zero then the event will be considered to be a Long event.