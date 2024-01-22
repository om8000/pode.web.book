Start-PodeServer {
    # add a simple endpoint
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http

    # set the use of templates
    Use-PodeWebTemplates -Title 'PowershellGet'

    # convert module to pages
    ConvertTo-PodeWebPage -Module PowershellGet     -GroupVerbs

}

# Get-Module -ListAvailable |where {$_.ModuleType -match "Script"}