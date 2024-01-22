
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name TileClick -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebTile -Name 'Randomness' -ScriptBlock {
        return (Get-Random -Minimum 0 -Maximum 1000)
    } `
    -ClickScriptBlock {
        Show-PodeWebToast -Message 'Processes listed!'
        get-process|out-default
} ) } }
