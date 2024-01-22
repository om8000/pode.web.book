Start-PodeServer -EnablePool Tasks {
   Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
   New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
   Use-PodeWebTemplates -Title ' ' -Theme Dark
   Add-PodeWebPage -Name 'Services' -Icon 'Settings' -ScriptBlock {
    New-PodeWebCard -Content @(
        New-PodeWebTable -Name 'Services' -ScriptBlock {
            foreach ($svc in (Get-Service)) {
                [ordered]@{
                    Name   = $svc.Name
                    Status = "$($svc.Status)"
                }
            }
        }
    )
   }
}
