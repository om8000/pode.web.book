Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Add-PodeWebPage -Name Example

 # Static
 Add-PodeWebPageLink -Name Google -Url 'https://www.google.com' -Icon 'google' -NewTab

 # Dynamic
 Add-PodeWebPageLink -Name Twitter -Icon Twitter -ScriptBlock {
     Move-PodeWebUrl -Url 'https://twitter.com' -NewTab
 }
}
