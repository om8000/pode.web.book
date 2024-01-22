Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Add-PodeWebPage -Name Theme -ScriptBlock {
     New-PodeWebButton -Name 'Dark'          `
                       -Icon 'moon-new'      `
                       -Colour Dark          `
                       -ScriptBlock {
                        Update-PodeWebTheme -Name Dark }
     New-PodeWebButton -Name 'Light'         `
                       -Icon 'weather-sunny' `
                       -Colour Light         `
                       -ScriptBlock {
                        Update-PodeWebTheme -Name Light }
     New-PodeWebButton -Name 'Terminal'      `
                       -Icon 'monitor'       `
                       -Colour Green         `
                       -ScriptBlock { 
                        Update-PodeWebTheme -Name Terminal }
     New-PodeWebButton -Name 'Reset'         `
                       -Icon 'refresh'       `
                       -ScriptBlock {
                        Reset-PodeWebTheme }
 }
}

# enter this script every time, your style is changed out of unknown reason