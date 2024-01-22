
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Modal' -ScriptBlock {

    New-PodeWebModal -Name 'MODAL' -Content @(
        New-PodeWebText -id 'TT' -Value "2ND"
        ) -ArgumentList 'Value1', 2, $false -ScriptBlock {
        param($value1, $value2, $value3)

        # $value1 = 'Value1'
        $b = $value2
        # $value3 = $false


        Update-PodeWebText -Id 'TT' -value "From 2ND parameter: $value2"
        Hide-PodeWebModal
    }

    New-PodeWebModal -Name 'MODAL' -Content @(
        New-PodeWebText -Value "1ST: $value2"
    ) -ScriptBlock { Hide-PodeWebModal }

    New-PodeWebButton -Name 'Modal' -Icon 'Stop-Circle' -ScriptBlock {
        Show-PodeWebModal -Name 'MODAL'
    }
} }
