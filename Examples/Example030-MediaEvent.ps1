Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Add-PodeWebPage -Name Sample -ScriptBlock {

     New-PodeWebAudio -Name 'example' -Source @(
         New-PodeWebAudioSource -Url `
         'https://samplelib.com/lib/preview/mp3/sample-6s.mp3'
     ) |
        Register-PodeWebMediaEvent -Type Play -ScriptBlock {
                 Show-PodeWebToast -Title 'Action' -Message $EventType
        }
 }
}
