
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'ThemeReset' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Reset Theme' -Icon 'refresh' -ScriptBlock {
        Reset-PodeWebTheme
} ) } }