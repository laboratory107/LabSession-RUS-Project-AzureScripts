@echo off

set location="westeurope"
::Iskoristite isti resource group kao za IoT Hub 
set resourceGroup="<nazivGrupe>" 
::Dio je javnog URL-a preko kojega se pristupa bazi, stoga neka bude unique, npr. rus22lposaric
::Dopusteni znakovi: lowercase letters 'a'-'z', the numbers 0-9 and the hyphen (crtica ne smije biti na početku ili kraju!)
set server="<nazivServera>"
set database="<nazivBaze>"
set login="<LDAP_username>"
::Pravila za passworde
:: 1) ne smije sadržavati login name/username
:: 2) mora zadovoljavati tri od sljedećih četiri pravila:
::    a) mali znak
::    b) veliki znak
::    c) broj
::    d) simbol
set password="<lozinka>"
:: Po defaultu je uključen firewall, stoga je potrebno napraviti iznimku za Azure servise 
set startIp=0.0.0.0
set endIp=0.0.0.0

:: ako ne znate koji je naziv resource group-a, odkomentiraje sljedeću liniju kako biste stvorili novi
::call az group create --name %resourceGroup% --location %location%
echo "Stvaranje SQL server-a s nazivom %server% u resource group %resourceGroup% s korisničkim imenom %login% i lozinkom %password%"
call  az sql server create --name %server% --resource-group %resourceGroup% --location %location% --admin-user %login% --admin-password %password%
echo "Isključujemo firewall za Azure Servise"
call az sql server firewall-rule create --resource-group %resourceGroup% --server %server% --name AllowAllAzureIPs --start-ip-address %startIp% --end-ip-address %endIp%
echo "Stvaranje baze sa nazivom %database% on %server% sa Serverless compute modelom, 1GB prostora i najvise jednom vCore"
az sql db create --resource-group %resourceGroup% --server %server% --name %database% --edition GeneralPurpose --family Gen5 --capacity 1 --compute-model Serverless --max-size 1GB

pause