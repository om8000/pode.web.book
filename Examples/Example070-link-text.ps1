
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Text -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebParagraph -Value 'This is some random text within a paragraph'
    New-PodeWebParagraph -Elements @(
        New-PodeWebText -Value 'And then here is some more text, that also includes a '
        New-PodeWebLink -Value 'link' -Source 'https://google.com'
        New-PodeWebText -Value ' that takes you to Google'
) ) } }