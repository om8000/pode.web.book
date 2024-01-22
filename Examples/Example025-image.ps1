Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Add-PodeWebPage -Name Example -ScriptBlock {
     New-PodeWebImage -Width 100 -Height 100      `
        -Source 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png'
     New-PodeWebImage -Width '25%' -Height '10em' `
        -Source 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png'
 }

}