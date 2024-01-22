Start-PodeServer {
   Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http 
   New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
   Use-PodeWebTemplates -Title 'Example' -Theme Dark -NoPageFilter -HideSideBar

}
