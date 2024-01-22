
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Editor -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebText -Value 'This is separated by...'
    New-PodeWebLine
    New-PodeWebText -Value '... a horizontal line'
    )
   }
}