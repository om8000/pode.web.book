
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebAudio -Name 'example' -Source @(
        New-PodeWebAudioSource -Url 'https://samplelib.com/lib/preview/mp3/sample-6s.mp3'
    )
    )

    New-PodeWebContainer -Content @(
    New-PodeWebButton -Name 'Stop' -ScriptBlock {
        Stop-PodeWebAudio -Name 'example'
    }
    )

} }