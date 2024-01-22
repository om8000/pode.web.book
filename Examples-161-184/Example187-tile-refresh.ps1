
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'TileSync' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebTile -Name 'Randomness' -ScriptBlock {
        return (Get-Random -Minimum 0 -Maximum 1000)
    }

    New-PodeWebButton -Name 'Refresh Tile' -ScriptBlock {
        Sync-PodeWebTile -Name 'Randomness'
} ) } }