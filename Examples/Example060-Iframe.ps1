
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name iFrame -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebIFrame -Url '/'

) } }