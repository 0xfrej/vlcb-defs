# Opcode: ASOF
# Priority: Low
# Services: Producer or Consumer
# Parameters: NN (2 bytes) Node number, EN (2 bytes) Event number
# Conditions: If the module has not been taught the event nor has the event by default then the event message is ignored.
# Direction: 
# States / Modes: 
# Result: If the module has the event configured to be sent when there is a change of state and that object changes to state OFF then send this event. If the module has been configured to consume the event (ignoring the NN) then perform the actions associated with the OFF event.