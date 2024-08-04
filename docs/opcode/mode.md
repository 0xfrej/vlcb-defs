# Opcode: MODE
# Priority: Low
# Services: MNS
# Parameters: NN (2 bytes) Node number, Mode (1 bytes) Mode Command. ● Mode command = 0 is a request to transition to Setup Mode ● Mode command = 1 is a request to transition to Normal Mode. Please refer to service specific documentation for other Mode Command definitions.
# Conditions: If the module has a non zero node number and NN does not match the module’s node number then ignore the message. Note that if the module is in Setup mode or Uninitialised mode then the module’s NN should be zero. If the message is short so that it does not include the Mode Command then a GRSP (Invalid Command) message is returned.
# Direction: To module
# States / Modes: 
# Result: If requested Mode Command is supported by the module’s services then send GRSP(ok). Any change to the module’s current mode is