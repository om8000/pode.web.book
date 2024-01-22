﻿
Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http
    Use-PodeWebTemplates -Title ' ' -Theme Dark 
    Add-PodeWebPage -name ' ' -ScriptBlock {

    Add-PodeWebComponentClass -Type 'Textbox' -Name 'SomeTextboxName' -Class 'my-custom-class'

    Add-PodeWebComponentClass -Id 'textbox_somename' -Class 'my-custom-class'


} }