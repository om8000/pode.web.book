

Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebCodeEditor -Language PowerShell -Name 'Code Editor'

    New-PodeWebButton -Name 'Template1' -ScriptBlock {
        Update-PodeWebCodeEditor -Name 'Code Editor' `
                                 -Value '<optional-value>' -Language '<optional-language>'
    }
    New-PodeWebButton -Name 'Template2' -ScriptBlock {
        Update-PodeWebCodeEditor `
           -Name 'Code Editor' -Value "write-host 'value1'`necho 'value2'`n#author: "
    }
    )

} }

