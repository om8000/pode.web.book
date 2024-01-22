Start-PodeServer {
 Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
 New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging
 Use-PodeWebTemplates -Title ' ' -Theme Dark

 $navDropdown = New-PodeWebNavDropdown -Name 'Social' -Icon 'smile' -Items @(
    New-PodeWebNavLink -Name 'Twitter' -Url 'https://twitter.com' -Icon 'twitter'
    New-PodeWebNavLink -Name 'Facebook' -Url 'https://facebook.com' -Icon 'facebook'
    New-PodeWebNavDivider
    New-PodeWebNavLink -Name 'YouTube' -Url 'https://youtube.com' -Icon 'youtube'
    New-PodeWebNavLink -Name 'Twitch' -Url 'https://twitch.tv' -Icon 'twitch'
)

Set-PodeWebNavDefault -Items $navDropdown

Add-PodeWebPage -Name Example 

}