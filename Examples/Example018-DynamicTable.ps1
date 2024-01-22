Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark


 Add-PodeWebPage -Name Services -Icon Settings -ScriptBlock {
     $value = $WebEvent.Query['value']

     # table of services
     if ([string]::IsNullOrWhiteSpace($value)) {
         New-PodeWebCard -Content @(
             New-PodeWebTable -Name 'Services' -DataColumn Name -Click -ScriptBlock {
                 foreach ($svc in (Get-Service)) {
                     [ordered]@{
                         Name = $svc.Name
                         Status = "$($svc.Status)"
     } } } ) }
     # code-block with service info
     else {
           $svc = Get-Service -Name $value | Out-String

           New-PodeWebCard -Name "$($value) Details" -Content @(
               New-PodeWebCodeBlock -Value $svc -NoHighlight
) } } }