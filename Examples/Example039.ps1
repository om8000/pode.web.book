Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Chart -ScriptBlock {

    New-PodeWebChart -Name 'CPU Usage' `
                     -Type Line -AutoRefresh -Append `
                     -TimeLabels -MaxItems 15 -AsCard `
                     -ScriptBlock {
                            return @{
                              Values = ((Get-Counter -Counter `
                                       '\Processor(_Total)\% Processor Time' `
                                       -SampleInterval 1 -MaxSamples `
                                       2).CounterSamples.CookedValue | `
                                       Measure-Object -Average).Average
                                    }
                                  }
  }
 }