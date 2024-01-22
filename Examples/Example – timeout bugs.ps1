Start-PodeServer -EnablePool Tasks {
   Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
   New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
   Use-PodeWebTemplates -Title 'Services_tool' -Theme Dark
   

Add-PodeWebPage -Name Services -Icon Settings -ScriptBlock {
    New-PodeWebForm -Name " " -SubmitText "DISPLAY" -AsCard `
       -Content @(New-PodeWebContainer `
       -Content @( New-PodeWebTable -Name 'Services' `
       -Compact -SimpleFilter -SimpleSort ) ) `
       -ScriptBlock { $a=get-process|select   `
                      'ProcessName','Path','Company','Description'
                      update-PodeWebTable -name "Services" -Data @( $a ) }
}

Add-PodeWebPage -Name Services_confirm -Icon Settings `
                -ScriptBlock {
    New-PodeWebForm -Name "Services_confirm" -AsCard `
                    -ScriptBlock { echo "A" | out-default } `
                    -Content @(New-PodeWebContainer -Content @( 
                                   New-PodeWebTable -Compact `
                                                    -Name "ServicesTable"
    New-PodeWebButton -Name 'GenerateData' `
                      -ScriptBlock {
                                    $global:a=get-process
                                    $a|out-default
                                    echo "Data Generated" | out-default
                                   }
    New-PodeWebButton -Name 'CreateTable' `
                      -ScriptBlock {
                            update-PodeWebTable -name 'ServicesTable' -Data @( $a )
                            Sync-PodeWebTable -Name 'ServicesTable'
                            echo "Building Big Table, WAIT ..." | out-default
                                   }
)
)
}

Add-PodeWebPage -Name Services_no_filters -Icon Settings `
                -ScriptBlock {
                   New-PodeWebForm -Name " " -SubmitText "DISPLAY" -AsCard `
                                   -Content @(New-PodeWebContainer `
                                   -Content @( New-PodeWebTable `
                                   -Name "Services_no_filters" -Compact  ) ) `
                                   -ScriptBlock { $a=get-process
                                                  update-PodeWebTable -name `
                                                 "Services_no_filters" -Data `
                                                 @( $a ) }
}
}


<#
    if adding -Filter and -Sort to the table, 
    all (big-data) data might not get processed
 #> 


