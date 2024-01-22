Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Chart -ScriptBlock {

    New-PodeWebCard -Content @(
        New-PodeWebText -Value 'Here is some example code: '
        New-PodeWebCode -Value 'Write-Host "Hello, world!"'
    )

  }
}

##################################################################################