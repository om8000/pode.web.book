
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebCarousel -Slides @(
    New-PodeWebSlide -Title Slide1 -Message 'This is a message' -Content @(
        New-PodeWebContainer -Nobackground -Content @(
            New-PodeWebQuote -Value 'Pode is awesome!' -Source 'Badgerati' -Alignment Center
        )
    )
    New-PodeWebSlide -Title Slide2 -Message 'This is a message' -Content @(
        New-PodeWebContainer -Nobackground -Content @(
            New-PodeWebQuote -Value 'You should try Pode.Web!' -Source 'Badgerati' -Alignment Center
        )
    )
    New-PodeWebSlide -Title Slide3 -Message 'This is a message' -Content @(
        New-PodeWebContainer -Nobackground -Content @(
            New-PodeWebQuote -Value 'PowerShell rocks!' -Source 'Badgerati' -Alignment Center
        )
    )
    )

} }