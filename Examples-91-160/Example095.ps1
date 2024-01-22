
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name TileColor -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebTile -Name 'CPU' -Icon 'chart-box' -ScriptBlock {
        $cpu = ((Get-Counter -Counter '\Processor(_Total)\% Processor Time' `
        -SampleInterval 1 -MaxSamples 2).CounterSamples.CookedValue |
         Measure-Object -Average).Average

        $colour = 'green'
        if ($cpu -gt 90) {
            $colour = 'red'
        }
        elseif ($cpu -gt 50) {
            $colour = 'yellow'
        }

        $cpu = [System.Math]::Round($cpu, 2)
        "$($cpu)%" | Update-PodeWebTile -ID $ElementData.ID -Colour $colour
    }
    )
   }
}