
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8000 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Ping' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Ping Me!' -ScriptBlock {
        Show-PodeWebNotification -Title 'Hi!' -Body 'Hello, there!'
    }
    )

} }