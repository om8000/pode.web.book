
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Disabled' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebButton -Name 'Disabled' -Disabled -ScriptBlock {
        Show-PodeWebToast -Message 'Hello, there'
    }
    New-PodeWebButton -Name 'Example' -ScriptBlock {
        Enable-PodeWebButton -Name 'Disabled'

} ) } }