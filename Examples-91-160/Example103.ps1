
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebVideo -Name 'example' -Width 100 -height 100 `
       -Thumbnail 'https://samplelib.com/lib/preview/mp4/sample-5s.jpg' -Source @(
        New-PodeWebVideoSource -Url 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4'
    ) |
    Register-PodeWebMediaEvent -Type Play -ScriptBlock {
             Show-PodeWebToast -Title 'Action' -Message $EventType
    }
} }