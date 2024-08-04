# Opcode: NNRSM
# Priority: Low
# Services: MNS
# Parameters: NN (2 bytes) Node number
# Conditions: If the NN does not match the module’s node number then ignore the message.
# Direction: To module
# States / Modes: 
# Result: then clear all configuration and revert to a state at time of initial programming, including Uninitialised mode i.e. NN=0, manufacturer’s