@echo off

::Upisite ime svog IoT Hub-a
set iotHubName="<iotHubNaziv>"

FOR /F "tokens=2" %%F IN ('call az iot hub connection-string show -n %iotHubName% --default-eventhub') DO SET connStr=%%F

echo Endpoint conn string: %connStr% 

set "connStr=%connStr:*EntityPath=%"
set connStr=%connStr:~1,-1%
echo Endpoint name (first arg of EventHubTrigger): %connStr%

pause