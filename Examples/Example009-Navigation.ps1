Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark


 $navAbout = New-PodeWebNavLink -Name 'About' -Url '/pages/About' -Icon 'help-circle'
 $navDiv = New-PodeWebNavDivider
 $navYT = New-PodeWebNavLink -Name 'YouTube' -Url 'https://youtube.com' -Icon 'youtube'

 Set-PodeWebNavDefault -Items $navAbout, $navDiv, $navYT

 Add-PodeWebPage -Name Example 

}