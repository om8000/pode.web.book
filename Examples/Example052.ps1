
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Time' -ScriptBlock {

    # both (this is the default)
    New-PodeWebDateTime -Name 'Example' -Type Date, Time

    # just date
    New-PodeWebDateTime -Name 'Example' -Type Date

    # just time
    New-PodeWebDateTime -Name 'Example' -Type Time

}}