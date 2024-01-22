
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    New-PodeWebContainer -NoBackground -Content @(
    New-PodeWebText -Value 'I have a pet'
    New-PodeWebText -Value 'dog' -Id 'pet_type'

    New-PodeWebParagraph -value ' '

    New-PodeWebButton -Name 'Change Pet!' -ScriptBlock {
        $rand = Get-Random -Minimum 0 -Maximum 5
        $pet = (@('dog', 'cat', 'fish', 'bear'))[$rand]
        Update-PodeWebText -Id 'pet_type' -Value $pet
    }
    )

} }