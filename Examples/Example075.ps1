
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Raw -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebRaw -Value '<h1>A title</h1><p>And then some text</p>'
) } }