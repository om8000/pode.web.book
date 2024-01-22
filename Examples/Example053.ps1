
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Log -ScriptBlock {

    New-PodeWebContainer -Content @(
    New-PodeWebFileStream -Url '/logs/error.log'
    )

} }