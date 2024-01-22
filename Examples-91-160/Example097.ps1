
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name TileChart -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebTile -Name 'CPU' -Icon 'chart-box' -Content @(
        New-PodeWebCounterChart -Counter `
        '\Processor(_Total)\% Processor Time' -MaxItems 10
) ) } }