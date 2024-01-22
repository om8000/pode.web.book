Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark


 Enable-PodeSessionMiddleware -Duration 120 -Extend
 New-PodeAuthScheme -Form | Add-PodeAuth -Name Example -ScriptBlock {
     param($username, $password)
     if ($username -eq 'admin' -and $password -eq 'admin') {
         return @{
              User = @{
                   ID ='admin'
                   Name = 'admin'
 }}}}

 Set-PodeWebLoginPage -Authentication Example -PassThru |
     Register-PodeWebPageEvent -Type Load -NoAuth -ScriptBlock {
         Show-PodeWebToast -Message "Hi!"
     }
}