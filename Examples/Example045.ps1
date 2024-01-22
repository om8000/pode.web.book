Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Chart -ScriptBlock {

    New-PodeWebCard -Content @(
        New-PodeWebCodeBlock -Value 'Write-Host "Hello!"' -Language PowerShell
    )

  }
}

##################################################################################