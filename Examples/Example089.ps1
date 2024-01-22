
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Text -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebText -Value 'Here is some Normal text.'
    New-PodeWebText -Value 'Followed by some bold text.' -Style Bold
    New-PodeWebText -Value 'And then some text that is striked through.' -Style StrikeThrough
    )
   }
}