
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Steps' -ScriptBlock {

    New-PodeWebSteps -Name 'AddUser' -Steps @(

    New-PodeWebStep -Name 'Name' -Icon 'User-Plus' -Content @(
        New-PodeWebTextbox -Name 'FirstName'
    )
    New-PodeWebStep -Name 'LastName' -Icon 'User-Plus' -Content @(
        New-PodeWebTextbox -Name 'LastName'
    )
    New-PodeWebStep -Name 'Email' -Icon 'Mail' -Content @(
        New-PodeWebTextbox -Name 'Email'
    )
    ) -ArgumentList 'Value1', "$(get-date)", $false `
      -ScriptBlock {
       param($value1, $value2, $value3)
       Show-PodeWebToast -Message `
            "User created: $($WebEvent.Data['FirstName']) $($WebEvent.Data['LastName']) on: $value2"
    }

} }
