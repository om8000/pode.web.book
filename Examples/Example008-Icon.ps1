Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark
   Add-PodeWebPage -Name 'Roles' -Icon 'Settings' -Layouts @(
       New-PodeWebCard -Content @(
           New-PodeWebButton -Name 'Repository' -Icon 'github' -Url 'https://github.com/Badgerati/Pode.Web'
       )
   )
}
