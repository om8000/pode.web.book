
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Min - Max' -ScriptBlock {

    # both (this is the default)
    New-PodeWebMinMax -Name 'Example' -Type Min, Max

    # just min
    New-PodeWebMinMax -Name 'Example' -Type Min

    # just max
    New-PodeWebMinMax -Name 'Example' -Type Max

   }
}