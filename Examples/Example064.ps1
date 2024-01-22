﻿
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Link -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebText -Value 'This is a link to '
    New-PodeWebLink -Source 'https://github.com/Badgerati/Pode' -Value 'Pode'
    )
   }
}