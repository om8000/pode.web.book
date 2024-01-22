
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name Foreign -ScriptBlock {

    New-PodeWebText -Value '漢' -Pronunciation 'ㄏㄢˋ'

   }
}