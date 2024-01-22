

Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark
     New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Add-PodeWebPage -name 'Form' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebForm -Name 'Example' -ScriptBlock { 
                                    $WebEvent.data | Out-PodeWebTable
                                    } -Content @(
        New-PodeWebTextbox -Name 'Name'
        New-PodeWebTextbox -Name 'Password' -Type Password -PrependIcon Lock
        New-PodeWebCheckbox -Name 'Checkboxes' -Options @('Terms', 'Privacy') -AsSwitch
        New-PodeWebSelect -Name 'Role' -Options @('User', 'Admin', 'Operations') -Multiple
        
    ) )
    New-PodeWebContainer -NoBackground -Content @(
        New-PodeWebButton -Name 'Submit Form' -ScriptBlock {
            Submit-PodeWebForm -Name 'Example'
    }
    )

} }

