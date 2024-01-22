Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark


 Add-PodeWebPage -Name Services -Icon Settings -ArgumentList 'Value1', 2, $false -ScriptBlock {
     param($value1, $value2, $value3)

     # $value1 = 'Value1'
     # $value2 = 2
     # $value3 = $false

     New-PodeWebCodeBlock -Value $Value1 -NoHighlight
     New-PodeWebCodeBlock -Value $Value2 -NoHighlight
     New-PodeWebCodeBlock -Value $Value3 -NoHighlight
 }
}
