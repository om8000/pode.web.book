Start-PodeServer {
    # add a simple endpoint
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http

    # set the use of templates
    Use-PodeWebTemplates -Title 'ComputerManagementDsc' 

    Add-PodeWebPage -name Button -ScriptBlock {

        New-PodeWebButton -Name 'Repo_same_page' -Icon Link -Url 'https://github.com/Badgerati/Pode.Web'
        New-PodeWebButton -Name 'Repo_new_tab' -Icon Link -Url 'https://github.com/Badgerati/Pode.Web' -NewTab

        New-PodeWebButton -Name 'Outlined_design' -Colour Cyan -Outline -ScriptBlock {
            Show-PodeWebToast -Message 'Hello There!'
        }
    }
 }

