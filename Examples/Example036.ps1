Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Chart -ScriptBlock {

    New-PodeWebContainer -Content @(
        New-PodeWebChart -Name 'Example Chart' -Type Line -ScriptBlock {
            return (1..10 | ForEach-Object {
              @{
                Key = $_ # x-axis value
                Values = @(
                    @{
                        Key = 'Group1'
                        Value = (Get-Random -Maximum 10) # y-axis value
                    }
                    @{
                        Key = 'Group2'
                        Value = (Get-Random -Maximum 10) # y-axis value
                    }
                )
               }
            })
        }
   )
  }
 }
