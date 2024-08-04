# Opcode: ENACK
# Priority: Low
# Services: ENACK and Consumer
# Parameters: NN (2 bytes) Module’s Node Number, opcode (1 bytes), The opcode of the event being acknowledged, EventNNh (1 bytes), The high byte of the event’s NN, EventNNl (1 bytes), The low byte of the event’s NN, EventENh (1 bytes), The high byte of the event’s EN, EventENl (1 bytes), The low byte of the event’s EN
# Conditions: Module must be in event acknowledge mode. Module must have the specified defined as a consumed event. Sent in response to an event.
# Direction: From module
# States / Modes: 
# Result: 