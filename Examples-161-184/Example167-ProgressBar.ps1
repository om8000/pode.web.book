
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebProgress -Name 'Download' -Value 0 -Colour Green -Striped -Animated

    New-PodeWebButton -Name 'Update Progress' -ScriptBlock {
        $rand = Get-Random -Minimum 0 -Maximum 3
        $colour = (@('Green', 'Yellow', 'Cyan'))[$rand]
        $value = Get-Random -Minimum 0 -Maximum 99
        Update-PodeWebProgress -Name 'Download' -Colour $colour -Value $value
} ) } }