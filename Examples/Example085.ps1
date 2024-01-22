
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Table -ScriptBlock {

    New-PodeWebTable -Name 'Dynamic Users' -Paginate `
                     -AsCard -ScriptBlock {
    # load the file
    $filePath = Join-Path (Get-PodeServerPath) './users.csv'
    $data = Import-Csv -Path $filePath

    # apply paging
    $totalCount = $data.Length
    $pageIndex = [int]$WebEvent.Data.PageIndex
    $pageSize = [int]$WebEvent.Data.PageSize
    $data = $data[(($pageIndex - 1) * $pageSize) .. (($pageIndex * $pageSize) - 1)]

    # update table
    $data | Update-PodeWebTable -Name 'Dynamic Users' `
                                -PageIndex $pageIndex `
                                -TotalItemCount $totalCount

    }
   }
}