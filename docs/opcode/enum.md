# Opcode: ENUM
# Priority: Low
# Services: CAN
# Parameters: NN (2 bytes) Node number
# Conditions: If the NN does not match the module’s node number then the message will be ignored.
# Direction: To module
# States / Modes: 
# Result: If conditions are met then start to perform self enumeration. A RTR CAN frame is sent. The module must wait 100ms for other modules to respond with a zero length data frame containing their CANID. After 100ms the module shall select an unused CANID in the range 1..127. If no CANIDs are available then send CMDERR(7).