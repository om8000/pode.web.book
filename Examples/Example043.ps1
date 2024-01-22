Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Chart -ScriptBlock {

    New-PodeWebCard -Content @(
        New-PodeWebForm -Name 'Example' -ScriptBlock {
            $langs = $WebEvent.Data['Spoken Languages']
        } -Content @(
           New-PodeWebCheckbox -Name 'Spoken Languages' `
           -Options 'English', 'French', 'Japanese', 'Chinese', 'Other' -AsSwitch
        )
    )
  }
}

##################################################################################