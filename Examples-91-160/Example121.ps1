
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebSteps -Name 'AddUser' -Steps @(
    New-PodeWebStep -Name 'Details' -Icon 'User-Plus' -Content @(
        New-PodeWebTextbox -Name 'FirstName'
        New-PodeWebTextbox -Name 'LastName'
    )
    New-PodeWebStep -Name 'Email' -Icon 'Mail' -Content @(
        New-PodeWebTextbox -Name 'Email'
    ) -ScriptBlock {
        if ($WebEvent.Data['Email'] -inotlike '*@*') {
            Out-PodeWebValidation -Name 'Email' -Message 'The email supplied is invalid'
        }
    }
    New-PodeWebStep -Name 'Password' -Icon 'Lock' -Content @(
        New-PodeWebTextbox -Name 'Password' -Type Password
    ) -ScriptBlock {
        if ($WebEvent.Data['Password'].Length -lt 8) {
            Out-PodeWebValidation -Name 'Password' -Message 'Password should be 8+ characters'
        }
    }
    ) -ScriptBlock {
       Show-PodeWebToast -Message "User created: $($WebEvent.Data['FirstName']) $($WebEvent.Data['LastName'])"
    }

} }