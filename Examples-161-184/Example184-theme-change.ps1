
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Theme' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Dark Theme' -Icon 'moon-new' -Colour Dark -ScriptBlock {
        Update-PodeWebTheme -Name Dark
    }
    New-PodeWebButton -Name 'Light Theme' -Icon 'weather-sunny' -Colour Light -ScriptBlock {
        Update-PodeWebTheme -Name Light
} ) } }