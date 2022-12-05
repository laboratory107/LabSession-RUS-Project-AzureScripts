@echo off

call az storage account list --query "[].{name:name}"
pause