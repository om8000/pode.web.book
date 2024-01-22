Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Enable-PodeSessionMiddleware -Duration 600 -Extend

 New-PodeAuthScheme -Form | Add-PodeAuth -Name Login -ScriptBlock {
     param($username, $password)
     if ($username -eq 'admin' -and $password -eq 'admin') {
         return @{
              User = @{
                   ID ='admin'
                   Name = 'admin'
                   Type = 'Human'
 }}}}

 Set-PodeWebLoginPage -Authentication Login -PassThru |
     Register-PodeWebPageEvent -Type Load, Unload, BeforeUnload -NoAuth -ScriptBlock {
              Show-PodeWebToast -Message "$($EventType)!"
     }
}