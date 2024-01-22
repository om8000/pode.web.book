
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Paginating -ScriptBlock {

    New-PodeWebTable -Name 'Example' `
                     -Paginate -PageSize 5 `
                     -AsCard -ScriptBlock {
    # load the file
    $filePath = Join-Path (Get-PodeServerPath) './users.csv'
    $data = Import-Csv -Path $filePath

    # update table (Pode.Web will auto-paginate for you)
    return $data
    }
    }
}