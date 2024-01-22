
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Table -ScriptBlock {

    New-PodeWebTable -Name 'Example' -ArgumentList 'Nina', '33', 'working' -ScriptBlock {
    param($value1, $value2, $value3)

          # $value1 = 'Value1'
          # $value2 = 2
          # $value3 = $false

          function statuses { 
                   [pscustomobject]@{ name='Tony' ;age='20'   ;status='working'  }
                   [pscustomobject]@{ name='Tina' ;age='40'   ;status='Vacation' }
                   [pscustomobject]@{ name='Timmy';age='30'   ;status='Sick Day' }
                   [pscustomobject]@{ name=$value1;age=$value2;status=$value3    }
          }

          foreach ($hash in statuses ) {
          [ordered]@{
                     Name   = $hash.Name
                     Age    = $hash.Age
                     Status = $hash.Status
                    }
          }
   }
   }
}






