
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'TableActions' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebTable -Name 'Services' -DataColumn Name -ScriptBlock {
        $editBtn = New-PodeWebButton -Name 'Edit' -Icon 'Edit' -IconOnly -ScriptBlock {
            $svc = Get-Service -Name $WebEvent.Data.Value
            Show-PodeWebModal -Name 'Edit Service' -DataValue $WebEvent.Data.Value -Actions @(
                Set-PodeWebSelect -Name 'StartType' -Value $svc.StartType
            )
        }
        foreach ($svc in (Get-Service)) {
            [ordered]@{
                Name = $svc.Name
                Status = "$($svc.Status)"
                StartType = "$($svc.StartType)"
                Actions = @($editBtn)
              # Actions = $editBtn
            }
        }
    }
    )
    New-PodeWebModal -Name 'Edit Service' -AsForm -Content @(
    New-PodeWebSelect -Name 'StartType' -Options Manual, Automatic, Disabled
    ) -ScriptBlock {
    Get-Service -Name $WebEvent.Data.Value | Set-Service -StartType $WebEvent.Data.StartType | Out-Null
    Show-PodeWebToast -Message "$($WebEvent.Data.Value) editted"
    Sync-PodeWebTable -Name 'Services'
    Hide-PodeWebModal

} } }
# Not working!!!