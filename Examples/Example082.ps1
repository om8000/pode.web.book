
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name CSV -ScriptBlock {

    New-PodeWebContainer -Content @(
    New-PodeWebTable -Name 'Users' -DataColumn UserId -CsvFilePath './users.csv'
    )

   }
}

<#

put a csv file into same directory with  the script
a file should be of the following form:

NAME, AGE,  STATUS, JOB
 Tom,  30, married, cleaner
 Tim,  20,  single, officer
Tina,  40, widowed, director

#>