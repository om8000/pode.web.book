Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Add-PodeWebPage -Name Sample -ScriptBlock {

     New-PodeWebCard -Content @(
         New-PodeWebText -Value 'All tests ran'
         New-PodeWebBadge -Value 'successfully' -Colour Green
         New-PodeWebLine
         New-PodeWebText -Value 'All tests ran, and'
         New-PodeWebBadge -Value 'failed' -Colour Red
         New-PodeWebLine
         New-PodeWebText -Value 'Some installed plugins are'
         New-PodeWebBadge -Value 'out-of-date' -Colour Yellow
     )

 }
}