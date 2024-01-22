
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Modal' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebTable -Name 'Services' -Click -DataColumn Name -ScriptBlock {
        $stopBtn = New-PodeWebButton -Name 'Stop' -Icon 'Stop-Circle' -IconOnly -ScriptBlock {
            Show-PodeWebModal -Name 'Stop Service' -DataValue $WebEvent.Data.Value -Actions @(
                Update-PodeWebText -Id 'svc_name' -Value $WebEvent.Data.Value
            )
        }
        foreach ($svc in (Get-Service)) {
            [ordered]@{
                Name = $svc.Name
                Status = "$($svc.Status)"
               #Actions = @($stopBtn)
                Actions =   $stopBtn
            }
        }
    }
    )
    New-PodeWebModal -Name 'Stop Service' -Content @(
    New-PodeWebText -Value 'Are you sure you want to stop '
    New-PodeWebText -Id 'svc_name'
    New-PodeWebText -Value '?'
    ) -ScriptBlock {
    Stop-Service -Name $WebEvent.Data.Value -Force | Out-default
    Show-PodeWebToast -Message "$($WebEvent.Data.Value) stopped"
    Sync-PodeWebTable -Name 'Services'
    Hide-PodeWebModal

} } }