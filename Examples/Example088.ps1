
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name TableButtons -ScriptBlock {

    $table = New-PodeWebTable -Name 'Services' -ScriptBlock {
    foreach ($svc in (Get-Service)) {
        [ordered]@{
            Name      = $svc.Name
            Status    = "$($svc.Status)"
            StartType = "$($svc.StartType)"
        }
    }
    }
    $table | Add-PodeWebTableButton -Name 'Excel' -Icon Database -ScriptBlock {
        $WebEvent.Data | Export-Csv -Path $path -NoTypeInformation
    }
    New-PodeWebContainer -Content $table
   }
}