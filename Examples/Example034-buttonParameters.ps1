Start-PodeServer {
    # add a simple endpoint
    Add-PodeEndpoint -Address localhost -Port 9999 -Protocol Http

    # set the use of templates
    Use-PodeWebTemplates -Title 'ComputerManagementDsc' 

    Add-PodeWebPage -name Button -ScriptBlock {
        New-PodeWebContainer -Content @(
            New-PodeWebButton -Name 'Click Me' `
                              -ArgumentList 'Value1', 2, $false `
                              -ScriptBlock {
                param($value1, $value2, $value3)

                # $value1 = 'Value1'
                # $value2 = 2
                # $value3 = $false

               # New-PodeWebCodeBlock -Value $Value1 # This will not work !!!
               Show-PodeWebToast -Message "$value1 $value2 $value3"

            }
        )
    }
 }

