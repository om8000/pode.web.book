
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Items + Line' -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebList -Values 'Item1', 'Item2', 'Item3'
    New-PodeWebLine
    New-PodeWebList -Values 'Item1', 'Item2', 'Item3' -Numbered
) } }