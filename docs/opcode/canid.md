# Opcode: CANID
# Priority: Low
# Services: CAN
# Parameters: NN (2 bytes) Node number, CAN_ID (1 bytes) CAN identifier
# Conditions: If NN does not match the module’s node number then ignore the message. If the message is short so that it does not include the CAN_ID then a GRSP (Invalid Command) message is returned.
# Direction: To module
# States / Modes: 
# Result: 