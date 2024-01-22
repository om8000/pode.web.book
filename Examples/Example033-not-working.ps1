Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 Add-PodeWebPage -Name Sample `
                 -ScriptBlock {New-PodeWebCard -Content @(
                               New-PodeWebTextBox -name 'aa' -value $a
                               New-PodeWebTextBox -name 'bb' -value $b
                               New-PodeWebTextBox -name 'cc' -value $c
                               New-PodeWebButton `
                                  -Name 'Click Me' `
                                  -ArgumentList 'Value1', 2, 3 `
                                  -ScriptBlock {
                                                param($value1, $value2, $value3)
                                                $global:a=$value1
                                                $global:b=$value2
                                                $global:c=$value2
                                                Update-PodeWebTextBox -name 'aa' -value $a
                                                Update-PodeWebTextBox -name 'bb' -value $b
                                                Update-PodeWebTextBox -name 'cc' -value $c
                                                $a=0;$b=0;$c=0
                                               }
                               )
                              } 
}