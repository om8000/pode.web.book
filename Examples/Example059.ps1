

Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Hidden -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebForm -Name 'Example' -ScriptBlock {
        $date = $WebEvent.Data['HiddenDate']
    } -Content @(
        New-PodeWebHidden -Name 'HiddenDate' -Value ([datetime]::Now.ToString())
) ) } }
