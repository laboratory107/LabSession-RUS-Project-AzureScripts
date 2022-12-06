@echo off

set location="westeurope"
::Iskoristite isti resource group kao za IoT Hub 
set resourceGroup="<nazivResourceGroupa>" 
::Dio je javnog URL-a preko kojega se pristupa bazi, stoga neka bude unique, npr. rus22lposaric
set appName="<nazivAppa>"
::Prije ste napravili storage account, ovdje iskoristite to ime 
::Ako se ne sjecate provedite sljedecu naredbu: az storage account list --query "[].{name:name}" ili pokrenite ListAllStorageAccountNames.bat
set storageName="<storageAccountNaziv>"

::Ako ne znate koji je naziv resource group-a, odkomentiraje sljedeću liniju kako biste stvorili novi
:: call az group create --name %resourceGroup% --location %location%

::Ako nemate storage account od prije
call az storage account create --name %storageName% --location %location% --resource-group %resourceGroup%

echo "Stvaram novi function app sa nazivom %appName%, sa Windows OS-om i .Net 6.0 runtime stackom i storage accountom %storageName%"
call az functionapp create --consumption-plan-location %location% --storage-account %storageName% --name %appName% --disable-app-insights --os-type Windows --resource-group %resourceGroup% --runtime dotnet --runtime-version 6 --functions-version 4

pause