
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http 
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Options' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebSelect -Name Options -ScriptBlock {
        return @(foreach ($i in (1..10)) {
            Get-Random -Minimum 1 -Maximum 1000
        })
    }
    New-PodeWebButton -Name 'New Options' -ScriptBlock {
        $options = @(foreach ($i in (1..10)) {
            Get-Random -Minimum 1 -Maximum 1000
        })
        $options | Update-PodeWebSelect -Name Options
} ) } }