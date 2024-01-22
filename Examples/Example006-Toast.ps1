Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark
 Add-PodeWebPage -Name Example -Layouts $some_layouts -PassThru |
     Register-PodeWebPageEvent -Type Load, Unload, BeforeUnload -ScriptBlock {
              Show-PodeWebToast -Message "Bye!"
    }
}
