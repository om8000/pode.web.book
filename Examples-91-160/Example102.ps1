
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
     New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebVideo -Name 'example' -Thumbnail 'https://samplelib.com/lib/preview/mp4/sample-5s.jpg' `
    -Source @(
        New-PodeWebVideoSource -Url 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4'
    ) `
    -Track @(
        New-PodeWebMediaSource -Url './english.vtt' -Language 'en' `
                               -Title 'English' -Type 'subtitles' -Default
        #New-PodeWebMediaTrack -Url $(Join-Path (Get-PodeServerPath) './English.vtt') -Language 'en' `
        #                      -Title 'English' -Type 'subtitles' -Default

    )
    )

} }

# NOT WORKING !!!!!!!!!!!!!!!!!!!!!!!!!