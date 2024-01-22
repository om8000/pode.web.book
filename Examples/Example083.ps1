
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name CSV-filter -ScriptBlock {

    New-PodeWebTable -Name 'Example' -Filter -AsCard -ScriptBlock {
    # load a csv file
    $filePath = Join-Path (Get-PodeServerPath) './users.csv'
    $data = Import-Csv -Path $filePath

    # apply filter if present
    $filter = $WebEvent.Data.Filter
    if (![string]::IsNullOrWhiteSpace($filter)) {
        $filter = "*$($filter)*"
        $data = @($data | Where-Object { ($_.psobject.properties.value -ilike $filter).length -gt 0 })
    }
    # update table
    return $data
} } }