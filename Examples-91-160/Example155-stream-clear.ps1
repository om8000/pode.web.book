
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Clear' -ScriptBlock {
        Clear-PodeWebFileStream -Name 'Example'
    }

    New-PodeWebFileStream -Name 'Example' -Url '/logs/error.log'
    )

} }