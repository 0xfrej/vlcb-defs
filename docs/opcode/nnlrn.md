# Opcode: NNLRN
# Priority: Low
# Services: Teach
# Parameters: NN (2 bytes) Node number
# Conditions: if the NN does NOT match the node number of the module and the module is in Learn mode then it must revert to Normal mode. If the NN does NOT match the node number of the module and the module is not in Learn mode then the message is ignored. If the NN matches the module’s node number and the module supports event teaching then the module enters Learn mode. If the NN matches the module’s node number and the module does not support event teaching then the message is ignored.
# Direction: To module
# States / Modes: 
# Result: If conditions are met then the module enters Learn mode.