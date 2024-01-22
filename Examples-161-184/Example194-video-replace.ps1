
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark
    Add-PodeWebPage -name 'VideoReplace' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebVideo -Name 'sample' `
       -Thumbnail 'https://samplelib.com/lib/preview/mp4/sample-5s.jpg' -Source @(
        New-PodeWebVideoSource `
           -Url 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4'
    ) )
    New-PodeWebContainer -Content @(
    New-PodeWebButton -Name 'Replace' -ScriptBlock {
        Update-PodeWebVideo -Name 'sample' `
              -Thumbnail 'https://samplelib.com/lib/preview/mp4/sample-10s.jpg' `
              -Source @( New-PodeWebVideoSource `
              -Url 'https://samplelib.com/lib/preview/mp4/sample-10s.mp4'
) } ) } }