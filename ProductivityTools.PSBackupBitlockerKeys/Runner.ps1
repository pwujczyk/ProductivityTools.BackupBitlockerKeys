clear
cd $PSScriptRoot
Import-Module .\ProductivityTools.PSBackupBitlockerKeys.psm1 -Force

Backup-BitlockerKeys -verbose -ToPersonalOneDrive -ToDateDirectory