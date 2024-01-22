Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Select_Dynamic -ScriptBlock {

    New-PodeWebCard -Content @(
        New-PodeWebSelect  -Name 'CPUs' `
                           -Required -ScriptBlock { $(1..8) }
        New-PodeWebSelect  -Name 'Randoms' `
                           -Required -ScriptBlock { foreach ($i in (1..10)) `
                            { Get-Random -Minimum 1 -Maximum 10 } } 

    ) } }