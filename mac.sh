
#!/bin/bash
OUTPUT_FILE="/Users/cm/Desktop/mac/output.txt"
ioreg -l | grep IOPlatformSerialNumber > "$OUTPUT_FILE"
sw_vers >> "$OUTPUT_FILE"
Echo "data saved to $OUTPUT_FILE"
