
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Image -ScriptBlock {
    New-PodeWebCard -Content @(
    New-PodeWebImage -Source '/pode.web/images/icon.png' -Title 'Pode' -Alignment Center
) } }