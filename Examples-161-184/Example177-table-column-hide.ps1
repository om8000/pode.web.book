
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Table' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebButton -Name 'HideCPU' -ScriptBlock {
        Hide-PodeWebTableColumn -Name 'Processes' -Key 'CPU'
    }
    New-PodeWebButton -Name 'HideWorkingSet' -ScriptBlock {
        Hide-PodeWebTableColumn -Name 'Processes' -Key 'WorkingSet'
    }

    New-PodeWebTable `
        -Name 'Processes' `
        -Paginate `
        -Compact `
        -ScriptBlock {
            $processes = Get-Process | Select-Object -Property Name, ID, WorkingSet, CPU

            $totalCount = $processes.Length
            $pageIndex = [int]$WebEvent.Data.PageIndex
            $pageSize = [int]$WebEvent.Data.PageSize
            $processes = $processes[(($pageIndex - 1) * `
                          $pageSize) .. (($pageIndex * $pageSize) - 1)]

            $processes | Update-PodeWebTable -Name $ElementData.Name `
                                             -PageIndex $pageIndex `
                                             -TotalItemCount $totalCount
        } `
        -Columns @(
            Initialize-PodeWebTableColumn -Key 'Name'
            Initialize-PodeWebTableColumn -Key 'ID'
            Initialize-PodeWebTableColumn -Key 'WorkingSet' -Name 'Memory' `
                                                            -Alignment Center `
                                                            -Width 10
            Initialize-PodeWebTableColumn -Key 'CPU'
) ) } }