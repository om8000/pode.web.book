Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Editor -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebCodeEditor -Name 'Editor' -Language 'powershell' -value ' Hi there!'
    )

  }
} 


##################################################################################