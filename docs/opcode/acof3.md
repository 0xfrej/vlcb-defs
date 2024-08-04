# Opcode: ACOF3
# Priority: Low
# Services: Producer or Consumer
# Parameters: NN (2 bytes) Node number, EN (2 bytes) Event number, data1 (1 bytes) Event data 1, data2 (1 bytes) Event data 2, data3 (1 bytes) Event data 3
# Conditions: If the module has not been taught the event nor has the event by default then the event message is ignored.
# Direction: 
# States / Modes: 
# Result: If the module has the event configured to be sent when there is a change of state and that object changes to state OFF then send this event. If the module has been configured to consume the event then perform the actions associated with the OFF event.