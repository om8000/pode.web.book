﻿
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    Set-PodeWebBreadcrumb -Items @(
    New-PodeWebBreadcrumbItem -Name 'Main' -Url '/pages/PageName'
    New-PodeWebBreadcrumbItem -Name 'SubPage1' -Url '/pages/PageName?value=stuff1'
    New-PodeWebBreadcrumbItem -Name 'SubPage2' -Url '/pages/PageName?value=stuff2' -Active
    )

} }