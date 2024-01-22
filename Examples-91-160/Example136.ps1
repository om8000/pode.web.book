
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'SizeButton' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebButton -Name 'Large' -Icon 'console-line' -Size Large -ScriptBlock {
        Show-PodeWebToast -Message 'Hello, there'
    }
    New-PodeWebButton -Name 'Example' -ScriptBlock {
        Update-PodeWebButton -Name 'Large' -Size Small -Icon 'safety-goggles'

} ) } }