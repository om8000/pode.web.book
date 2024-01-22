
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Table' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Update Processes' -ScriptBlock {
        Get-Process |
            Sort-Object -Property CPU -Descending |
            Select-Object -First 15 -Property Name, ID, WorkingSet, CPU |
            Update-PodeWebTable -Name 'Processes'
    }

    New-PodeWebTable -Name 'Processes' -NoRefresh -ScriptBlock {
        Get-Process |
            Sort-Object -Property CPU -Descending |
            Select-Object -First 15 -Property Name, ID, WorkingSet, CPU
} ) } }