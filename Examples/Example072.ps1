
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Quote -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebQuote -Value 'Pode is the best!' -Source 'Badgerati'
) } }