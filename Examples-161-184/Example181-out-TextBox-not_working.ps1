
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'OutText' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'New Textbox' -ScriptBlock {
        Get-Process |
            Select-Object Name, ID, WorkingSet, CPU |
            Out-PodeWebTable

     #   Get-Process |
     #       Select-Object Name, ID, WorkingSet, CPU |
     #       Out-PodeWebTextBox -Multiline -Preformat -ReadOnly
} ) } }