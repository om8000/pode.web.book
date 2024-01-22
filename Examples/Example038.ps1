Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Chart -ScriptBlock {

    New-PodeWebContainer -Content @(
        New-PodeWebChart -Name 'Top Processes' -Type Bar `
                         -AutoRefresh -Colours '#ff0000', '#00ff00' -ScriptBlock {
        Get-Process |
            Sort-Object -Property CPU -Descending |
                 Select-Object -First 10 |
                        ConvertTo-PodeWebChartData -LabelProperty ProcessName `
                                                   -DatasetProperty CPU, Handles
        }
    )





  }
 }
