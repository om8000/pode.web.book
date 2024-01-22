
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Spinner -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebText -Value 'Here is an spinner: '
    New-PodeWebSpinner -Colour 'cornflowerblue'
    )
   }
}