
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Options' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebSelect -Name Options -Options Option1, Option2, Option3

    New-PodeWebButton -Name 'Update Select' -ScriptBlock {
        $rand = Get-Random -Minimum 0 -Maximum 3
        $opt = (@('Option1', 'Option2', 'Option3'))[$rand]
        Set-PodeWebSelect -Name Options -Value $opt
} ) } }