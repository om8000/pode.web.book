
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Select' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebSelect -Name Options -Options Option1, Option2, Option3

    New-PodeWebButton -Name 'Clear Select' -ScriptBlock {
        Clear-PodeWebSelect -Name Options
} ) } }