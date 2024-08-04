# Opcode: SD
# Priority: Low
# Services: MNS
# Parameters: NN (2 bytes) Node number, ServiceIndex (1 bytes) Index into the list of services. Note that ServiceIndex values may not be contiguous and therefore the ServiceIndex may be greater than the number of services reported within the first response to RQSD. ServiceType (1 bytes) Service Type, Version (1 bytes) Version of the service definition, not the version of its implementation.
# Conditions: 
# Direction: From module
# States / Modes: 
# Result: supported by the module.