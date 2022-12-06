@echo off

set serverName="<nazivServera>" 
set dbName="<nazivBaze>"

call az sql db show-connection-string -s %serverName% -n %dbName% -c ado.net

pause
