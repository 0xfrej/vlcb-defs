# Opcode: NNULN
# Priority: Low
# Services: Teach
# Parameters: NN (2 bytes) Node number
# Conditions: If the module does not support event teaching then the message is ignored. If the module is in Learn mode then the module exits Learn mode and returns to Normal mode. Note: the NN does not need to match the module’s node number.
# Direction: To module
# States / Modes: 
# Result: If the conditions are met the module exits Learn mode and enters Normal mode.