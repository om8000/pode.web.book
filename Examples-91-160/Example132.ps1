
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebButton -Name 'InvokeMe' -ScriptBlock {
        Show-PodeWebToast -Message 'Hello, there'
    }
    New-PodeWebButton -Name 'Example' -ScriptBlock {
        Invoke-PodeWebButton -Name 'InvokeMe'

} ) } }