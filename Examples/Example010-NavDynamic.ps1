Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 $navToast = New-PodeWebNavLink -Name 'Toast Me!' -Icon Settings -ScriptBlock {
    Show-PodeWebToast -Message "I'm from a nav link!"
 }
 Set-PodeWebNavDefault -Items $navToast

 Add-PodeWebPage -Name Example 

}