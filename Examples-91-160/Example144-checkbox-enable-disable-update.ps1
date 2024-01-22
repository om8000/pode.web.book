
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Checkbox' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebCheckbox -Name 'Enabled' -AsSwitch

    New-PodeWebButton -Name 'Update Checkbox' -ScriptBlock {
        $checked = [bool](Get-Random -Minimum 0 -Maximum 2)
        Update-PodeWebCheckbox -Name 'Enabled' -Checked:$checked
    }
    New-PodeWebButton -Name 'Enable Checkbox' -ScriptBlock {
        Update-PodeWebCheckbox -Name 'Enabled' -Checked:$true -State Enabled
    }
    New-PodeWebButton -Name 'Disable Checkbox' -ScriptBlock {
        Update-PodeWebCheckbox -Name 'Enabled' -Checked:$false -State Disabled
    }
    )

} }