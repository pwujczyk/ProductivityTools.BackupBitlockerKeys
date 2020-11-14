clear
cd $PSScriptRoot
Import-Module .\ProductivityTools.BackupBitlockerKeys.psm1 -Force

Backup-BitlockerKeys -verbose -ToPersonalOneDrive -ToDateDirectory