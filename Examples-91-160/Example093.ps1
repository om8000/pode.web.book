
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name TestBox -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebForm -Name 'Example' -ScriptBlock {
        $message = $WebEvent.Data['Message']
        $message|out-default
    } -Content @(
        New-PodeWebTextbox -Name 'Message' -Multiline
    )
    )

   }
}