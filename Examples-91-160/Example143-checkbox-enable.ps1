
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebCheckbox -Name 'Disabled' -AsSwitch -Disabled

    New-PodeWebButton -Name 'Enable Checkbox' -ScriptBlock {
        Enable-PodeWebCheckbox -Name 'Disabled'
    }
    )

} }