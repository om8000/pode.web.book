Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Chart -ScriptBlock {

      #$size = (Get-Volume|where {$_.DriveLetter -eq 'c'}).size
      #$free = (Get-Volume|where {$_.DriveLetter -eq 'c'}).SizeRemaining
      #$used = $size - $free

      $Doughnut  = { @{ Key = 'Free' ; Values = @( @{ Value = (Get-Volume|where {$_.DriveLetter -eq 'c'}).SizeRemaining } ) }
	                 @{ Key = 'Used' ; Values = @( @{ Value = ((Get-Volume|where {$_.DriveLetter -eq 'c'}).size)-((Get-Volume|where {$_.DriveLetter -eq 'c'}).SizeRemaining) } ) } }

      New-PodeWebGrid -Cells @(
                   New-PodeWebCell -Content @( New-PodeWebChart -AutoRefresh -Name 'Disk Usage' -Type Doughnut -AsCard -ScriptBlock $Doughnut  )
      )
  }

}

##################################################################################