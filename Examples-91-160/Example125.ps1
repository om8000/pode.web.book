
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebAccordion -Bellows @(
    New-PodeWebBellow -Name 'Item 1' -Content @(
        New-PodeWebButton -Name 'Next' -Id 'next_1' -ScriptBlock {
            Move-PodeWebAccordion -Name 'Item 2'
        }
    )
    New-PodeWebBellow -Name 'Item 2' -Content @(
        New-PodeWebButton -Name 'Next' -Id 'next_2' -ScriptBlock {
            Move-PodeWebAccordion -Name 'Item 3'
        }
    )
    New-PodeWebBellow -Name 'Item 3' -Content @(
        New-PodeWebButton -Name 'Next' -Id 'next_3' -ScriptBlock {
            Move-PodeWebAccordion -Name 'Item 1'
        }
    )
    )

} }