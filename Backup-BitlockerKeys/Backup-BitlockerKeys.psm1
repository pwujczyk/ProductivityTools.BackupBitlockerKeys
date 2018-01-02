function BackupBitlockerKey($letter, $destinationPath)
{
	$volumeDetails=Get-BitLockerVolume -MountPoint $letter
	if ($(Test-Path $destinationPath) -eq $false)
	{
		New-Item $destinationPath -ItemType Directory | Out-Null
	}
	$fileDestination=Join-Path $destinationPath "$letter.bitlocker"
	$volumeDetails.KeyProtector | Out-File $fileDestination
	Write-Verbose "Recovery key saved in $fileDestination"
}


function Backup-BitlockerKeys {
	[cmdletbinding()]
	param ([string]$Destination, [switch]$ToDateDirectory, [string]$DateNamePrefix, [string]$DateNameSuffix,
	[switch]$ToPersonalOneDrive, [switch]$ToBusinessOneDrive)	

	if (($Destination -eq $null -or $Destination -eq "") -and ($ToPersonalOneDrive.IsPresent -eq $favoritesPath -and $ToBusinessOneDrive.IsPresent -eq $false) )
	{
		throw [System.Exception] "Destination directory is required"
	}

	if ($ToPersonalOneDrive.IsPresent)
	{
		$oneDriveDir=Get-OneDriveDirectory -Personal -JustDirectory
		$Destination=Join-Path $oneDriveDir $Destination
	}

	if ($ToBusinessOneDrive.IsPresent)
	{
		$oneDriveDir=Get-OneDriveDirectory -Business -JustDirectory
		$Destination=Join-Path $oneDriveDir $Destination
	}

	if ($ToDateDirectory.IsPresent)
	{
		[string]$dateName=Get-DateName -Prefix $DateNamePrefix -Suffix $DateNameSuffix
		$Destination=Join-Path $Destination $dateName
		Write-Verbose "Destination directory with date directory: $destinationDirectory"
	}
	

	Write-Verbose "Destination directory: $Destination"

	$volumes=Get-BitLockerVolume
	foreach($volume in $volumes)
	{
		if ($volume.ProtectionStatus -eq "On")
		{
			$letter=$volume.MountPoint.Trim(':')
			Write-Verbose "Perform backup bitlocker keys for volume $letter"
			BackupBitlockerKey $letter $Destination
		}
	}
}

Export-ModuleMember Backup-BitlockerKeys 