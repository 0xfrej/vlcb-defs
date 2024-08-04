# Opcode: RQNN
# Priority: low
# Services: MNS
# Parameters: NN (2 bytes) Existing Node number
# Conditions: Module has been instructed to request a new node number. This may be done in a variety of ways such as holding down a push button on the module for a number of seconds. Module will not send RQNN until instructed to obtain new NN.
# Direction: From module
# States / Modes: 
# Result: will return to its previous mode and reclaim its previous NN by issuing a NNACK.