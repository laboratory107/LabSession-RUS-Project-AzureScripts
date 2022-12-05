@echo off

::Iskoristite isti resource group kao za IoT Hub 
set resourceGroup="<nazivResourceGroupa>" 
::Upisite ime svog IoT Hub-a
set iotHubName="<iotHubNaziv>"
set appName="<nazivAppa>"

FOR /F "tokens=2" %%F IN ('call az iot hub connection-string show -n %iotHubName% --default-eventhub') DO SET connStr=%%F

echo Postavljam connection string u varijablu Function Appa pod imenom EventHubConnectionString
call az functionapp config appsettings set --name %appName% --resource-group %resourceGroup% --settings "EventHubConnectionString=%connStr%"

echo:
echo:
echo Endpoint conn string: %connStr% 

set "connStr=%connStr:*EntityPath=%"
set connStr=%connStr:~1,-1%

echo:
echo:
echo Endpoint name (first arg of EventHubTrigger): %connStr%


pause