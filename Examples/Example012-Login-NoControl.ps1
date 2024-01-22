Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Enable-PodeSessionMiddleware -Duration 120 -Extend

 New-PodeAuthScheme -Form | Add-PodeAuth -Name Example -ScriptBlock {
     param($username, $password)
         return @{
              User = @{
                   ID ='M0R7Y302'
                 Name = 'Morty'
                 Type = 'Human'
 }}}

 Set-PodeWebLoginPage -Authentication Example

}
