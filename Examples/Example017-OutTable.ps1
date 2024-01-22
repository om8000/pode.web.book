Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Add-PodeWebPage -Name Processes -Icon Activity -Layouts @(
     New-PodeWebCard -Content @(
         New-PodeWebForm -Name 'Search' -ScriptBlock {
             $p= Get-Process -Name $WebEvent.Data.Name -ErrorAction Ignore |
                     Select-Object Name, ID, WorkingSet, CPU
                           $p | Out-podeWebTable
                         # $p | Out-PodeWebTextbox -Multiline -Preformat -ReadOnly # this is not working
         } -Content @(
             New-PodeWebTextbox -Name 'Name'
         )
     )
 )
}
