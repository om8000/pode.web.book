
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Editor -ScriptBlock {

    New-PodeWebCard -Content @(
        New-PodeWebComment `
           -Username 'User1' -Message 'Is this real?' `
           -Icon '/pode.web/images/icon.png'
        New-PodeWebComment `
           -Username ‘Blogger' -Message 'Where?' `
           -Icon '/pode.web/images/icon.png'
        New-PodeWebComment `
           -Username 'Joe Doe' -Message 'Here!' `
           -Icon '/pode.web/images/icon.png'
   )
   }
}