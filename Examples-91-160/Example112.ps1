
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebGrid -Cells @(
    New-PodeWebCell -Content @(
        New-PodeWebImage -Source '/pode.web/images/icon.png' -Alignment Center
    )
    New-PodeWebCell -Content @(
        New-PodeWebImage -Source '/pode.web/images/icon.png' -Alignment Center
    )
    New-PodeWebCell -Content @(
        New-PodeWebImage -Source '/pode.web/images/icon.png' -Alignment Center
    )
    )

} }