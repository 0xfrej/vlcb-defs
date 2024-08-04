# Opcode: SNN
# Priority: Low
# Services: MNS
# Parameters: NN (2 bytes) the new node number
# Conditions: Module must be in setup mode otherwise the SNN message is ignored.
# Direction: To module
# States / Modes: 
# Result: If conditions are met then the specified node number is saved in persistent storage for use in future communications. The module shall send a NNACK message in response.