
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Select' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebSelect -Name Options -ScriptBlock {
        return @(foreach ($i in (1..10)) {
            Get-Random -Minimum 1 -Maximum 10
        })
    }

    New-PodeWebButton -Name 'Sync Select' -ScriptBlock {
        Sync-PodeWebSelect -Name Options

} ) } }