
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Check' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebCheckbox -Name 'Enable' -AsSwitch -Checked

    New-PodeWebButton -Name 'Disable Checkbox' -ScriptBlock {
        Disable-PodeWebCheckbox -Name 'Enable'
    }
    New-PodeWebButton -Name 'Enable Checkbox' -ScriptBlock {
        Enable-PodeWebCheckbox -Name 'Enable'
    }
    )

} }