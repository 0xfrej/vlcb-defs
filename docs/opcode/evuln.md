# Opcode: EVULN
# Priority: Low
# Services: Teach
# Parameters: NN (2 bytes) Node number, EN (2 bytes) Event number
# Conditions: If the module does not currently have the event configured then send a CMDERR(Invalid Event) message and a GRSP(Invalid Event)
# Direction: To module
# States / Modes: 
# Result: 