Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark
 
 Add-PodeWebPage -Name Alerts -ScriptBlock {
     New-PodeWebCard -Content @(
         New-PodeWebAlert -Value 'Everything looks to be OK here!' -Type Success
         New-PodeWebAlert -Type Error -Content @(
             New-PodeWebText -Value 'Eek, an error! Go'
             New-PodeWebLink -Value 'here' -Source 'https://google.com'
             New-PodeWebText -Value 'for more information.'
         )
         New-PodeWebAlert -Value 'Example of a Note alarm' -Type Note
         New-PodeWebAlert -Value 'Example of a Tip alarm' -Type Tip
         New-PodeWebAlert -Value 'Example of a Important alarm' -Type Important
         New-PodeWebAlert -Value 'Example of a Info alarm' -Type Info
         New-PodeWebAlert -Value 'Example of a Warning alarm' -Type Warning
     )
}
}
