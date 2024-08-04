# Opcode: RQNPN
# Priority: Low
# Services: MNS
# Parameters: NN (2 bytes) Node number, Para# (1 bytes)
# Conditions: (Invalid Command) message is returned. If Para# is greater than the number of supported parameters the send message CMDERR(Invalid Parameter Index) and message
# Direction: To module
# States / Modes: 
# Result: message for each of the parameters else send a single PARAN