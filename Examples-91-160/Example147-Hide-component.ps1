
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title 'HideCard' -Theme Dark 
    Add-PodeWebPage -name 'HideCard' -ScriptBlock {

    New-PodeWebCodeBlock -Value "Test1" -NoHighlight -Id "Test1"

        New-PodeWebButton -Name 'Hide' -ScriptBlock {
            Hide-PodeWebComponent -Id "Test1"
        }

} }