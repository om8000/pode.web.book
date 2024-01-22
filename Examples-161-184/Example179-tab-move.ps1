
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Change Tab' -ScriptBlock {
        Move-PodeWebTab -Name "Tab$(Get-Random -Minimum 1 -Maximum 4)"
    }
    )
    New-PodeWebTabs -Tabs @(
    New-PodeWebTab -Name Tab1 -Layouts @(
        New-PodeWebCard -Content @(
            New-PodeWebImage -Source '/pode.web/images/icon.png' `
                             -height 200 `
                             -Alignment Center
        )
    )
    New-PodeWebTab -Name Tab2 -Layouts @(
        New-PodeWebCard -Content @(
            New-PodeWebImage -Source '/pode.web/images/icon.png' `
                             -height 200 `
                             -Alignment Center
        )
    )
    New-PodeWebTab -Name Tab3 -Layouts @(
        New-PodeWebCard -Content @(
            New-PodeWebImage -Source '/pode.web/images/icon.png' `
                             -height 200 `
                             -Alignment Center
        )
    )
    )

} }