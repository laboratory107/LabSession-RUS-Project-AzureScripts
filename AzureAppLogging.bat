@echo off

::Iz VSCode-a se logging čudno ponaša i nekada jednostavno ne prikazuje poruke

::Iskoristite isti resource group kao za IoT Hub 
set resourceGroup="<nazivGrupe>" 
set functionAppName="<nazivFunctionAppa>"

az webapp log tail --resource-group %resourceGroup% --name %functionAppName%

pause