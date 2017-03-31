@ECHO OFF
"D:\Program Files (x86)\AVRStudio4\AvrAssembler2\avrasm2.exe" -S "C:\Micros\P6\labels.tmp" -fI -W+ie -o "C:\Micros\P6\P6.hex" -d "C:\Micros\P6\P6.obj" -e "C:\Micros\P6\P6.eep" -m "C:\Micros\P6\P6.map" "C:\Micros\P6\test.asm"
