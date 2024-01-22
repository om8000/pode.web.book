

Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Form -ScriptBlock {

    New-PodeWebCard -Content @(

    New-PodeWebForm -Name 'Example' -ArgumentList "Tom", "Tim", "Tina" -ScriptBlock {
        param($value1, $value2, $value3)
        $WebEvent.Data | Out-Default
        Update-PodeWebTextbox -Name User1 -Value $value1
        Update-PodeWebTextbox -Name User2 -Value $value2
        Update-PodeWebTextbox -Name User3 -Value $value3
    } -Content @(
        New-PodeWebTextbox -Name User1 -PrependIcon Human
        New-PodeWebTextbox -Name User2 -PrependIcon Human
        New-PodeWebTextbox -Name User3 -PrependIcon Human

) ) } }

