
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Color' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebButton -Name 'Solid' -Colour Green -ScriptBlock {
        Show-PodeWebToast -Message 'Hello, there'
    }

    New-PodeWebButton -Name 'Example' -ScriptBlock {
        Update-PodeWebButton -Name 'Solid' -Colour Yellow -ColourState Outline
} ) } }