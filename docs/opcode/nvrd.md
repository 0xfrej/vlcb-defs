# Opcode: NVRD
# Priority: Low
# Services: NV
# Parameters: NN (2 bytes) Node number, NV# (1 bytes) Node variable index
# Conditions: (Invalid Command) message is returned. If NV# is not between 0 and the supported number of NVs then CMDERR (Invalid Node Variable Index) message is returned and a
# Direction: To module
# States / Modes: 
# Result: If conditions are met and NV# is 0 then send a NVANS response for NV#0 and value of the number of NVs followed by a NVANS for each NV. If conditions are met and NV# is greater than 0 then send a single NVANS response containing the value of the requested NV.