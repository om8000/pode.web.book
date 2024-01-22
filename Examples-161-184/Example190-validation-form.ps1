
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebForm -Name 'Example' -ScriptBlock {
        $invalid = $false

        if ($WebEvent.Data['Username'].Length -le 3) {
            Out-PodeWebValidation -Name 'Username' -Message 'Username must be 4+ chars'
            $invalid = $true
        }

        if ($WebEvent.Data['Password'].Length -le 7) {
            Out-PodeWebValidation -Name 'Password' -Message 'Password must be 8+ chars'
            $invalid = $true
        }

        if ($invalid) {
            return
        }
    } -Content @(
        New-PodeWebTextbox -Name 'Username'
        New-PodeWebTextbox -Name 'Password' -Type Password -PrependIcon Lock
        New-PodeWebSelect -Name 'Role' -Options @('User', 'Admin') -Multiple
    )
    )

} }