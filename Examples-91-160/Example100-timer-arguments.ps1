
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Timer -ScriptBlock {

     New-PodeWebTimer -Interval 5 -ArgumentList 'Value1', 2, $(date) -ScriptBlock {
     param($value1, $value2, $value3)

     # $value1 = 'Value1'
     # $value2 = 2
     # $value3 = $false
     get-process|out-default
     Show-PodeWebToast -Message $value3
    }
   }
}