
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Badge -ScriptBlock {

    New-PodeWebTimer -Interval 10 -ScriptBlock {
        $rand = Get-Random -Minimum 0 -Maximum 3
        $colour = (@('Green', 'Yellow', 'Cyan'))[$rand]
        Update-PodeWebBadge -Id 'bdg_example' `
              -Value ([datetime]::Now.ToString('yyyy-MM-dd HH:mm:ss')) `
              -Colour $colour
    }

New-PodeWebCard -Content @(
    New-PodeWebBadge -Id 'bdg_example' `
       -Value ([datetime]::Now.ToString('yyyy-MM-dd HH:mm:ss')) `
       -Colour Cyan)

} }
