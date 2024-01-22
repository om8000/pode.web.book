
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Headers -ScriptBlock {

    New-PodeWebCard -Content @(
    New-PodeWebHeader -Value 'The Header' -Size 1 `
                      -Secondary 'This is some Size1 header text'
    New-PodeWebLine
    New-PodeWebHeader -Value 'The Header' -Size 2 `
                      -Secondary 'This is some Size2 header text'
    New-PodeWebLine
    New-PodeWebHeader -Value 'The Header' -Size 3 `
                      -Secondary 'This is some Size3 header text'
) } }