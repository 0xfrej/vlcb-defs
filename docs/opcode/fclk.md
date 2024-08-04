# Opcode: FCLK
# Priority: Normal
# Services: 
# Parameters: mins (1 bytes) Minutes 0-59, hrs (1 bytes) Hours 0-23, wdmon (1 bytes) Bits 0-3 define day of week (1=Sun ..7=Sat). Bits 4-7 define month (1=Jan .. 12=Dec), div (1 bytes) Divider. 0=freeze, mday (1 bytes) Day of month 1-31, temp (1 bytes) Temperature. Two’s complement -127 to +127
# Conditions: 
# Direction: 
# States / Modes: 
# Result: If conditions are met then update a fast clock with the specified settings.