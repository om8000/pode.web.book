
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebVideo -Name 'example' `
       -Thumbnail 'https://samplelib.com/lib/preview/mp4/sample-5s.jpg' -Source @(
        New-PodeWebVideoSource -Url 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4'
    ) )

    New-PodeWebContainer -Content @(
    New-PodeWebButton -Name 'Play' -ScriptBlock {
        Start-PodeWebVideo -Name 'example'
    } )

} }