@echo off
setlocal enabledelayedexpansion

:: Mac 주소 목록
set "MACS=192.168.100.100"
set "USER=cm"
set "REMOTE_PATH=~/output.txt"
set "LOCAL_PATH=C:\MacData"

:: 로컬 저장 경로 생성
if not exist "%LOCAL_PATH%" mkdir "%LOCAL_PATH%"

:: 각 Mac에서 데이터 수집 후 SCP로 가져오기
for %%M in (%MACS%) do (
    echo Connecting to %%M...
    ssh %USER%@%%M "ioreg -l | grep IOPlatformSerialNumber > %REMOTE_PATH% && sw_vers >> %REMOTE_PATH%"
    scp %USER%@%%M:%REMOTE_PATH% "%LOCAL_PATH%\%%M_output.txt"
)

echo All data collected!
