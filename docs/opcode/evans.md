# Opcode: EVANS
# Priority: Low
# Services: Teach
# Parameters: NN (2 bytes) event’s Node number, EN (2 bytes) Event number, EV# (1 bytes) Event variable index, EV val (1 bytes) Event variable value
# Conditions: If the original request was for EV# of zero then multiple EVANS will be sent, The first for EV#0 with EV val set to the number of EVs and subsequent EVANS one for each EV containing the EV value.
# Direction: From module
# States / Modes: 
# Result: 