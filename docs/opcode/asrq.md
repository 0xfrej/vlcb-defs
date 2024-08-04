# Opcode: ASRQ
# Priority: Low
# Services: Producer
# Parameters: NN (2 bytes) Node number, EN (2 bytes) Event number
# Conditions: If NN==0, then every module that produces this short-event should respond. If the NN does not match the module’s node number and is non zero then ignore the message. If the module does not have the event provisioned then ignore the message.
# Direction: To module
# States / Modes: 
# Result: 