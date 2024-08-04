# Opcode: RDGN
# Priority: Low
# Services: MNS
# Parameters: NN (2 bytes) Node number, ServiceIndex (1 bytes) Index into the list of services, DiagnosticCode (1 bytes) Diagnostic data code
# Conditions: If ServiceIndex references an unsupported service then send a GRSP(Invalid service) message. If ServiceIndex references a valid service and DiagnosticCode is zero but the service does not support diagnostics then GRSP (INVALID_DIAGNOSTIC) should be returned. If DiagnosticCode references an invalid or unsupported diagnostic number then send a GRSP(Invalid diagnostic) message.
# Direction: To module
# States / Modes: 
# Result: indicating the number of DiagnosticCodes for that service followed by a DGN message for each diagnostic code. Note that DiagnosticCode in