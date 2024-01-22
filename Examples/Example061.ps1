Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Editor -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebText -Value 'Here is an icon: '
    New-PodeWebIcon -Name 'alert' -Colour 'yellow' -Spin
    New-PodeWebText -Value ', and here is another one!: '
    New-PodeWebIcon -Name 'emoticon-happy' -Colour '#bb0000'
) } }

