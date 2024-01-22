$global:fll = $MyInvocation.InvocationName
$global:a = cat $fll |out-string
$a|out-default

function PS_func(){ 
         Get-Process|select Name, ID, WorkingSet, CPU, Company, Handles, Id, SI
         }

Start-PodeServer -Threads 1 {
      Add-PodeEndpoint -Address localhost -Port 8080 -Protocol Http
      New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
      Use-PodeWebTemplates -Title 'Tables' -Theme Dark

##### METHOD1 - using Layouts
      $table1 = New-PodeWebTable -Name ' ' -SimpleFilter `
                                           -SimpleSort `
                                           -Compact `
                                           -AsCard `
                                           -ScriptBlock `
             { PS_func } 
	         Add-PodeWebPage -Name 'CPU1' -Layouts $table1

##### METHOD2 - using Dynamic ScriptBlock
      Add-PodeWebPage -Name 'CPU2' -ScriptBlock `
          { New-PodeWebTable -Name ' ' -SimpleFilter `
                                       -SimpleSort `
                                       -Compact `
                                       -AsCard `
                                       -ScriptBlock `
          { PS_func } }


##### METHOD3 - using Functions + Invoke-expression (useful to create menus in a loop)
      $e="Add-PodeWebPage  -Name 'CPU3' -ScriptBlock { 
          New-PodeWebTable -Name T3 -SimpleFilter -SimpleSort ``
                           -Compact -AsCard -ScriptBlock { PS_func } } "
      Invoke-Expression $e

##### METHOD4 - using Functions + Invoke-expression + confirmation button + Views/Contents
      $e="Add-PodeWebPage -Name 'CPU4' -ScriptBlock {
          New-PodeWebForm  -Name `"PSF`" -SubmitText `"DISPLAY`" ``
                                         -AsCard  -ScriptBlock {
              update-PodeWebTable -name `"PST`" -Data @(PS_func)
              }  -Content @(
                  New-PodeWebContainer -Content @(
                  New-PodeWebText -Value `" `") 
                  New-PodeWebTable -Name `"PST`" -SimpleFilter -SimpleSort -Compact
                  New-PodeWebParagraph -value `" `"
                  ) } "
      Invoke-Expression $e

##### METHOD5 - simplified table with confirmation and in separated menu gr
      $e= "Add-PodeWebPage -Name `"CPU5`" -Group 'Users' ``
                           -scriptblock {
                            New-PodeWebForm -Name `" `" ``
                           -SubmitText `"DISPLAY`" -AsCard ``
                           -ScriptBlock { PS_func|ft|Out-Default
                                          PS_func|Out-PodeWebTable} ``
                           -Content @(New-PodeWebContainer ``
                           -Content @(New-PodeWebText -Value `" `"))}"
      Invoke-Expression $e

      Add-PodeWebPage -Name Editor -ScriptBlock { New-PodeWebCodeEditor -Name 'E' -Language 'powershell' -value $a }

}
