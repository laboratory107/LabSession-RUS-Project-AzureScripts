@echo off

::Upisite ime svog IoT Hub-a
set iotHubName="<iotHubNaziv>"
::Iskoristite isti resource group kao za IoT Hub 
set resourceGroup="<nazivGrupe>" 
::Nije kritican, ali dajte neki smisleni naziv za ovu rutu
set routeName="TelemetrijaRuta"
::Dopustene vrijednosti su: deviceconnectionstateevents, devicejoblifecycleevents, devicelifecycleevents, devicemessages, digitaltwinchangeevents, invalid, twinchangeevents
set source="devicemessages"

az iot hub route create -g %resourceGroup% --hub-name %iotHubName% --endpoint-name events --source %source% --route-name %routeName%
az iot hub route test -g %resourceGroup% --hub-name %iotHubName% --route-name %routeName%

pause