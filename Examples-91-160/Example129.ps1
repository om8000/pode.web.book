
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Track' -ScriptBlock {

    New-PodeWebCard -Content @(
        New-PodeWebAudio -Name 'example1' -Source @(
        New-PodeWebAudioSource -Url 'https://samplelib.com/lib/preview/mp3/sample-6s.mp3'
        )    
    )

    New-PodeWebContainer -Content @(
        New-PodeWebButton -Name 'UpdateTrack' -ScriptBlock {
            Update-PodeWebAudio -Name 'example1' -Source @(
                   New-PodeWebAudioSource -Url 'https://samplelib.com/lib/preview/mp3/sample-9s.mp3'
            ) 
        }
      )
    }
}
