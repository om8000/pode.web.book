
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebButton -Name 'Update 1' -ScriptBlock {
        Update-PodeWebFileStream -Name 'Example' -Url '/logs/error.log'
    }
    New-PodeWebButton -Name 'Update 2' -ScriptBlock {
        Update-PodeWebFileStream -Name 'Example' -Url '/logs/error2.log'
    }

    New-PodeWebFileStream -Name 'Example' -Url '/logs/error.log'
    )

} }