Start-PodeServer -StatusPageExceptions Show {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
    Use-PodeWebTemplates -Title 'ServicesTable'  -Theme Dark

    $table = New-PodeWebTable -Name 'Static' `
                              -DataColumn Name `
                              -AsCard -Filter -SimpleSort -Click -Paginate `
                              -ScriptBlock {
        $stopBtn = New-PodeWebButton -Name 'Stop' `
                                     -Icon 'stop-circle-outline' `
                                     -IconOnly `
                                     -ScriptBlock {
            Stop-Service -Name $WebEvent.Data.Value -Force | Out-Null
            Show-PodeWebToast -Message "$($WebEvent.Data.Value) stopped"
            Sync-PodeWebTable -Id $ElementData.Parent.ID
        }

        $startBtn = New-PodeWebButton -Name 'Start' `
                                      -Icon 'play-circle-outline' `
                                      -IconOnly `
                                      -ScriptBlock {
            Start-Service -Name $WebEvent.Data.Value | Out-Null
            Show-PodeWebToast -Message "$($WebEvent.Data.Value) started"
            Sync-PodeWebTable -Id $ElementData.Parent.ID
        }

        $filter = "*$($WebEvent.Data.Filter)*"

        foreach ($svc in (Get-Service)) {
            if ($svc.Name -inotlike $filter) {
                continue
            }
			$btns = @{}
            if ($svc.Status -ieq 'running') {
                $btns += $stopBtn
            }
            else {
                $btns += $startBtn
            }

            [ordered]@{
                Name = $svc.Name
                Status = "$($svc.Status)"
                Actions = $btns
            }
        }
    }
    Add-PodeWebPage -Name Services -Icon 'cogs' -Layouts $table  -ScriptBlock {
        $name = $WebEvent.Query['value']
        if ([string]::IsNullOrWhiteSpace($name)) {
            return
        }
        $svc = Get-Service -Name $name | Out-String

        New-PodeWebCard -Name "$($name) Details" -Content @(
            New-PodeWebCodeBlock -Value $svc -NoHighlight
        )
    }
    $form = New-PodeWebForm -Name 'Search' -AsCard -ScriptBlock {
        if ($WebEvent.Data.Name.Length -le 3) {
            Out-PodeWebValidation -Name 'Name' `
                                  -Message 'Name must be greater than 3 characters'
            return
        }
        Get-Process -Name $WebEvent.Data.Name -ErrorAction Ignore |
            Select-Object Name, ID, WorkingSet, CPU |
            New-PodeWebTextbox -Name 'Output' -Multiline -Preformat -ReadOnly |
            Out-PodeWebElement
    } -Content @(
        New-PodeWebTextbox -Name 'Name'
    )
}
