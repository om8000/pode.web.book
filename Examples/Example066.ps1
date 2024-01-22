
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Badges -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebList -Items @(
        New-PodeWebListItem -Content @(
            New-PodeWebBadge -Colour Green -Value 'Green'
        )
        New-PodeWebListItem -Content @(
            New-PodeWebBadge -Colour Cyan -Value 'Cyan'
        )
        New-PodeWebListItem -Content @(
            New-PodeWebBadge -Colour Yellow -Value 'Yellow'
        )
        New-PodeWebListItem -Content @(
            New-PodeWebBadge -Colour Red -Value 'Red'
        )
        New-PodeWebListItem -Content @(
            New-PodeWebBadge -Colour Grey -Value 'Grey'
        )
    )
    )
   }
}