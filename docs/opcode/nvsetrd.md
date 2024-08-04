# Opcode: NVSETRD
# Priority: Low
# Services: NV
# Parameters: NN (2 bytes) Node number, NV# (1 bytes) Node variable index NVvalue (1 byte) Node variable value
# Conditions: If the NN does not match the module’s node number then ignore the message. If the message is short so that it does not include the specified parameters then a GRSP (Invalid Command) message is returned.
# Direction: To module
# States / Modes: 
# Result: message containing the NV value.