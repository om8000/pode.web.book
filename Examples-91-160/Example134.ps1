
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Enabled' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebButton -Name 'Enabled' -ScriptBlock {
        Show-PodeWebToast -Message 'Hello, there'
    }

    New-PodeWebButton -Name 'Example' -ScriptBlock {
        Disable-PodeWebButton -Name 'Enabled'

} ) } }