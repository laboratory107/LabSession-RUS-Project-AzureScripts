@echo off

set iotHubName="<resoruceGrupa>" 
set deviceName="<nazivUredaja>"

az iot device simulate -n %iotHubName% -d %deviceName%

pause