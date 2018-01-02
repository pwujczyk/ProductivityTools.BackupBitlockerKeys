clear
cd $PSScriptRoot
Import-Module .\Backup-BitlockerKeys.psm1 -Force

Backup-BitlockerKeys -verbose -ToPersonalOneDrive -ToDateDirectory