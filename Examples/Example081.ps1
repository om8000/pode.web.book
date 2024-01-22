
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ServicesManagementTable -ScriptBlock {

    New-PodeWebContainer -Content @(
    New-PodeWebTable -Name 'Services' -DataColumn Name -ScriptBlock {
        foreach ($svc in (Get-Service)) {
            [ordered]@{
                Name      = $svc.Name
                Status    = "$($svc.Status)"
                StartType = "$($svc.StartType)"
                Actions   = @(
                   New-PodeWebButton -Name 'Start' -Icon 'Play-Circle' -IconOnly -ScriptBlock {
                       Start-Service -Name $WebEvent.Data.Value -Force | Out-Null
                       Show-PodeWebToast -Message "$($WebEvent.Data.Value) started"
                       Sync-PodeWebTable -Id $ElementData.Parent.ID
                       $($WebEvent.Data.Value) | out-default
                   }
                   New-PodeWebButton -Name 'Stop' -Icon 'Stop-Circle' -IconOnly -ScriptBlock {
                       Stop-Service  -Name $WebEvent.Query['value'] -Force | Out-Null
                       Show-PodeWebToast -Message "$($WebEvent.Data.Value) stopped"
                       Sync-PodeWebTable -Id $ElementData.Parent.ID
                       $($WebEvent.Data.Value) | out-default
} ) } } } ) } }