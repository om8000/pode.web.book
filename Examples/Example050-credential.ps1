
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name 'Credentials' -ScriptBlock {

# both (this is the default)
New-PodeWebCredential -Name 'Example' -Type Username, Password

# just username
New-PodeWebCredential -Name 'Example' -Type Username

# just password
New-PodeWebCredential -Name 'Example' -Type Password

} }