
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Chart' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Update Processes' -ScriptBlock {
        Get-Process |
            Sort-Object -Property CPU -Descending |
            Select-Object -First 15 |
            ConvertTo-PodeWebChartData -LabelProperty ProcessName -DatasetProperty CPU |
            Update-PodeWebChart -Name 'Processes'
    }

    New-PodeWebChart -Name 'Processes' -Type Line -NoRefresh -ScriptBlock {
        Get-Process |
            Sort-Object -Property CPU -Descending |
            Select-Object -First 15 |
            ConvertTo-PodeWebChartData -LabelProperty ProcessName -DatasetProperty CPU

} ) } }