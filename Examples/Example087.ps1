
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name TableIcon -ScriptBlock {

    New-PodeWebContainer -Content @(
    New-PodeWebTable -Name 'Services' -ScriptBlock {
        foreach ($svc in (Get-Service)) {
            [ordered]@{
                Name      = $svc.Name
                Status    = "$($svc.Status)"
                StartType = "$($svc.StartType)"
            }
        }
    } `
    -Columns @(
        Initialize-PodeWebTableColumn -Key Status -Alignment Center -Icon Activity
        Initialize-PodeWebTableColumn -Key StartType -Alignment Center -Icon Clock
    )
    )
   }
}