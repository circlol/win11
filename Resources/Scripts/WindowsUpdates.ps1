Write-Host Automatically downloading and installing all available Windows Updates
Start-sleep 4
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force > update_log.txt
Import-Module PSWindowsUpdate -Force >> update_log.txt
Install-Module PSWindowsUpdate -Force >> update_log.txt
Get-WindowsUpdate >> update_log.txt
Get-WindowsUpdate
Install-WindowsUpdate -AcceptAll -Install -IgnoreReboot -NoConfirm