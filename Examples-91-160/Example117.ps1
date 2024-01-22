
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebHero -Title 'Welcome!' `
                    -Message 'This is an example Hero for Pode.Web' -Content @(
    New-PodeWebText -Value 'Pode.Web lets you build websites using PowerShell.' `
                    -InParagraph -Alignment Center
    New-PodeWebParagraph -Alignment Center -Elements @(
        New-PodeWebButton -Name 'Repository' -Icon Link `
           -Url 'https://github.com/Badgerati/Pode.Web'
    )
    )

} }
