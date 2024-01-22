Start-PodeServer {
    # add a simple endpoint
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http

    # set the use of templates
    Use-PodeWebTemplates -Title 'Pode.Web'

    # convert module to pages
    ConvertTo-PodeWebPage -Module Pode.Web     -GroupVerbs

}
