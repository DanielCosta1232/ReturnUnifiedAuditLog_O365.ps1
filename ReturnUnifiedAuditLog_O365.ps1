# Functions

function Connect-Exo 
{
  $credential = Get-Credential
  $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRedirection
  Import-PSSession $Session -AllowClobber -DisableNameChecking
}

function UAL
{
  $startdate = (Get-Date).AddDays(-90)
  $enddate = (Get-Date).AddDays(1)
  $random = Get-Random -minimum 1000000000
  Search-UnifiedAuditLog -StartDate $startdate -EndDate $enddate -Formatted -UserIDs $user -ResultSize 5000 -SessionCommand ReturnLargeSet -SessionID $random
}

# Script starts here
$WindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$WindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($WindowsID)
$AdminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator

if ($WindowsPrincipal.IsInRole($AdminRole)) {
    Clear-Host
    Write-Host "Please sign-in with your O365 Admin account when prompted."
    Start-Sleep -s 5
    Connect-Exo
    Clear-Host
    $i = 1
    while ($i -eq 1) {
      $path = Read-Host "Please enter a path and name for the output .csv file. Use quotes for spaces. (example syntax: C:\Users\temp\userlogs.csv)"
      $user = Read-Host "Please enter the user's email address."
      UAL | Select-Object | Export-CSV -Path $path
      Write-Host "Done! Please check $path for your .csv file."
      $i = Read-Host "`n`nPlease select one of the following options:`n1. Pull Unified Audit Logs for another user.`n2. Exit script.`n`n"
      }    
        if ($i -eq 2) {
          Write-Host "You have chosen to exit the script. Killing all active sessions..."
          Get-PSSession | Remove-PSSession
        }
        else {
          Write-Host "Error. Killing all active sessions..."
          Get-PSSession | Remove-PSSession
          Write-Host "Exiting script..."
        }
}
else {
    Write-Host "`nPlease run this script in an elevated PowerShell window."
}