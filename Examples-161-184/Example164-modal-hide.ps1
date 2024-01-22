
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Modal' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Show Modal' -ScriptBlock {
        Show-PodeWebModal -Name 'Mod1'
    } )

    New-PodeWebModal -Name 'Mod1' -Content @(
        New-PodeWebText -Value "Modal!"
    ) -ScriptBlock {
                    Hide-PodeWebModal
} } }