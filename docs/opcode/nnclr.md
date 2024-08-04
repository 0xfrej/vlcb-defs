# Opcode: NNCLR
# Priority: Low
# Services: Teach
# Parameters: NN (2 bytes) Node number
# Conditions: If the NN does not match the module’s node number then the message is ignored. If the module is not in learn mode then a CMDERR(Not Learn Mode) message and a GRSP(Not in Learn Mode) is returned. If the module does not support event teaching then the message is ignored.
# Direction: To module
# States / Modes: 
# Result: message.