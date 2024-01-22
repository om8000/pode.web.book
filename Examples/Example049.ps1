
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Credentials' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebForm -Name 'Example' -ScriptBlock {
        $username = $WebEvent.Data['Creds_Username']
        $password = $WebEvent.Data['Creds_Password']
        echo $username |out-default
        echo $password |out-default
    } -Content @(
        New-PodeWebCredential -Name 'Creds'
    )
    )
   }
}