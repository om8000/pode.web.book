
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebAccordion -Bellows @(
    New-PodeWebBellow -Name Bellow1 -Content @(
        New-PodeWebImage -Source '/pode.web/images/icon.png' -Alignment Center
    )
    New-PodeWebBellow -Name Bellow2 -Content @(
        New-PodeWebImage -Source '/pode.web/images/icon.png' -Alignment Center
    )
    New-PodeWebBellow -Name Bellow3 -Content @(
        New-PodeWebImage -Source '/pode.web/images/icon.png' -Alignment Center
    )
    )

} }