New-Variable -Name LUARegistryLocation -Value "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System"  -Force -Option ReadOnly
New-variable -Name NewPowershellManifestModulePlasterTemplateLocation -Value (Get-PlasterTemplate | Where-Object -Property Title -EQ 'New PowerShell Manifest Module' | Select-Object -First 1 -ExpandProperty TemplatePath) -Scope Global -Force -Option ReadOnly
if(-not(Test-Path "$PSScriptRoot\InstalledModules.json")) {
    New-Item -Path "$PSScriptRoot\InstalledModules.json" -Value "[]"
}
New-Variable -Name InstalledModules -Value (Get-Content "$PSScriptRoot\InstalledModules.json" | ConvertFrom-Json) -Force

Export-ModuleMember -Variable *