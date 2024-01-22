
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'TableSync' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Refresh Processes' -ScriptBlock {
        Sync-PodeWebTable -Name 'Processes'
    }

    New-PodeWebTable -Name 'Processes' -NoRefresh -ScriptBlock {
        Get-Process |
            Sort-Object -Property CPU -Descending |
            Select-Object -First 15 -Property Name, CPU, ID, WorkingSet
} ) } }