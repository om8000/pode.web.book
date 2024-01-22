Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Add-PodeWebPage -Name Charts -NoSidebar -Layouts @(
     New-PodeWebCard -Content @(
         New-PodeWebCounterChart -Counter '\Processor(_Total)\% Processor Time'
     )
 )
}
