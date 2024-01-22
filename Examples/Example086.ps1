
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name TableSort -ScriptBlock {

    New-PodeWebTable -Name 'Example' -Sort -AsCard `
                     -Paginate -Pagesize 10 -ScriptBlock {
    # load the file
    $filePath = Join-Path (Get-PodeServerPath) './users.csv'
    $data = Import-Csv -Path $filePath

    # apply sorting
    $sortColumn = $WebEvent.Data.SortColumn
    if (![string]::IsNullOrWhiteSpace($sortColumn)) {
        $descending = ($WebEvent.Data.SortDirection -ieq 'desc')
        $data = @($data | `
        Sort-Object -Property { $_.$sortColumn } -Descending:$descending)
    }

    # update table
    return $data
    }
   }
}
