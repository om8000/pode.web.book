
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebCodeEditor -Language PowerShell -Name 'Code Editor' -Value "Write-Host 'hi!'"

    New-PodeWebButton -Name 'Clear Editor' -ScriptBlock {
        Clear-PodeWebCodeEditor -Name 'Code Editor'
    }
    )

} }