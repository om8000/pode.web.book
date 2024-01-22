
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 

    Add-PodeWebPage -Name Page1 -Layouts @(
    New-PodeWebContainer -NoBackground -Content @(
        New-PodeWebButton -Name 'Change to Page2' -ScriptBlock {
            Move-PodeWebPage -Name 'Page2'
    } ) )

    Add-PodeWebPage -Name Page2 -Layouts @(
    New-PodeWebContainer -NoBackground -Content @(
        New-PodeWebButton -Name 'Change to Page1' -ScriptBlock {
            Move-PodeWebPage -Name 'Page1'
} ) ) }