
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Progress -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebProgress -Name 'Download' -Value 65 -Colour Green -Striped -Animated

) } }