Start-PodeServer -EnablePool Tasks {
   Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
   New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
   Use-PodeWebTemplates -Title ' ' -Theme Dark
   Add-PodeWebPage -Name 'Roles' -Icon 'Settings' -ScriptBlock {
       New-PodeWebSelect -Name 'Role' -Options @('Choose...', 'User', 'Admin', 'Operations') |
           Register-PodeWebEvent -Type Change -ScriptBlock {
                    Show-PodeWebToast -Message "The value was changed: $($WebEvent.Data['Role'])"
           }
   }
}

