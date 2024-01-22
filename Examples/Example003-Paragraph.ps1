Start-PodeServer {
   Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
   New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
   Use-PodeWebTemplates -Title ' ' -Theme Dark
       Add-PodeWebPage -Name 'Styles' -Icon 'Settings' -ScriptBlock {
           New-PodeWebParagraph -CssStyle @{ Color = 'Yellow' } -Elements @(
               New-PodeWebText -Value 'And then here is some more text, that also includes a '
               New-PodeWebLink -Value 'link' -Source 'https://google.com'
               New-PodeWebText -Value ' that takes you to Google'
           )
       }
}
