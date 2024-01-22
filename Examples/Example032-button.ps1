Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Add-PodeWebPage -Name Sample -ScriptBlock {
     New-PodeWebCard -Content @(
         New-PodeWebButton -Name 'Click Me' `
                           -DataValue 'Random' -ScriptBlock {
             Show-PodeWebToast -Message `
                  "This came from a button, with a data value of `
                  '$($WebEvent.Data['Value'])'!"
         }
     )
 }
}