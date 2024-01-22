Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark
    Add-PodeWebPage -name 'ModalShow' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Show Modal' -ScriptBlock {
        Show-PodeWebModal -Name 'ModalShow'
    }
    )
    New-PodeWebModal -Name 'ModalShow' -Content @(
        New-PodeWebText -Value "Modal!"
    ) -ScriptBlock {
                    Hide-PodeWebModal
} } }
