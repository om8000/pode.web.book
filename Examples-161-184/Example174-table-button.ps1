
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Table' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebTable -Name 'Processes' -DataColumn ID -NoRefresh -ScriptBlock {
        $refreshBtn = New-PodeWebButton -Name 'Refresh' -Icon 'refresh' -IconOnly -ScriptBlock {
            $processId = $WebEvent.Data.Value

            Get-Process -Id $processId |
                Select-Object -Property WorkingSet, CPU |
                Update-PodeWebTableRow -Name 'Processes' -DataValue $processId
        }

        Get-Process |
            Sort-Object -Property CPU -Descending |
            Select-Object -First 15 |
            ForEach-Object {
                [ordered]@{
                    Name        = $_.Name
                    ID          = $_.ID
                    WorkingSet  = $_.WorkingSet
                    CPU         = $_.CPU
                    Refresh     = @($refreshBtn)
                }
            }
    }
)


} }