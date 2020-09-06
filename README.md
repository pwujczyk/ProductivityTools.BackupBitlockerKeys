<!--Category:PowerShell--> 
 <p align="right">
    <a href="https://www.powershellgallery.com/packages/ProductivityTools.PSBackupBitlockerKeys/"><img src="Images/Header/Powershell_border_40px.png" /></a>
    <a href="http://productivitytools.tech/backup-bitlockerkeys/"><img src="Images/Header/ProductivityTools_green_40px_2.png" /><a> 
    <a href="https://github.com/pwujczyk/ProductivityTools.PSBackupBitlockerKeys"><img src="Images/Header/Github_border_40px.png" /></a>
</p>
<p align="center">
    <a href="http://http://productivitytools.tech/">
        <img src="Images/Header/LogoTitle_green_500px.png" />
    </a>
</p>

# PSBackup-BitlockerKeys
It gets all bit-locker volumes and saves recovery keys to specified localization.

<!--more-->

It checks all connected drives if any of them is bit-locker protected. If this situation occurs it saves recovery password to given location.

`Backup-BitlockerKeys -Destination d:\destination`

`Backup-BitlockerKeys -Destination d:\destination -ToDateDirectory`

<!--og-image-->
![BackupBitlockerKeys](Images/Backup-BitlockerKeys.png)



Module depends on Get-DateName and Get-OneDriveDirectory so it can automatically detect where OneDrive directory is placed and save file in the directory which has date in the name.

`Backup-BitlockerKeys -Destination destination -ToDateDirectory -ToPersonalOneDrive`

`Backup-BitlockerKeys -Destination destination -ToDateDirectory -ToBusinessOneDrive`

![BackupBitlockerKeys](Images/Backup-BitlockerKeysOneDrive.png)

It can be installed using powershell using commant

`Install-Module Backup-BitlockerKeys`
