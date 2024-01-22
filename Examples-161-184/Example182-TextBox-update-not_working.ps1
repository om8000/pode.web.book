
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'TextBox' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebTextBox -Name 'Content'

    New-PodeWebButton -Name 'Update Textbox' -ScriptBlock {
        Update-PodeWebTexBox -Name 'Content' -Value $([datetime]::Now.ToString())
} ) } }