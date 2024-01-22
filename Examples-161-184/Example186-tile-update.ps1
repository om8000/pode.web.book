
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebTile -Name 'Randomness' -ScriptBlock {
        return (Get-Random -Minimum 0 -Maximum 1000)
    }

    New-PodeWebButton -Name 'Update Tile' -ScriptBlock {
        $rand = Get-Random -Minimum 0 -Maximum 3
        $colour = (@('Green', 'Yellow', 'Cyan'))[$rand]
        Update-PodeWebTile -Name 'Randomness' -Colour $colour
} ) } }