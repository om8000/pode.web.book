Start-PodeServer {
    # add a simple endpoint
    Add-PodeEndpoint -Address localhost -Port 8888 -Protocol Http

    # set the use of templates
    Use-PodeWebTemplates -Title 'VMware'

    # convert module to pages


# $a=Get-module -ListAvailable |where {$_.ModuleType -match "Script" -and $_.Name -Match "VMware"}|select Name|sort; ($a).name|get-unique


#region PowerCli modules
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Core     -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.DeployAutomation       -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.ImageBuilder           -GroupVerbs

    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Cis.Core -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Common   -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.License  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Sdk      -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Storage  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.vds      -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Cloud    -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Hcx      -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.HorizonView -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Nsxt     -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Security -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Srm      -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.StorageUtility -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.Vmc      -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.vROps    -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VimAutomation.WorkloadManagement  -GroupVerbs
#endregion


<#
    ConvertTo-PodeWebPage -Module VMware.CloudServices  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.PowerCLI.Sdk  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.PowerCLI.Sdk.Types  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.PowerCLI.VCenter  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.PowerCLI.VCenter.Types.ApplianceService  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.PowerCLI.VCenter.Types.CertificateManagement  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.Nsx.Policy  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.Runtime  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.Srm  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.Vcf.CloudBuilder  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.Vcf.SddcManager  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.Vr  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.Access  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.Health  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.InfraProfile  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.LocalAccounts  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.Logging  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.Networking  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.Recovery  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.SupportBundle  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.System  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Appliance.Update  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Cis  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Cis.Tagging  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Content  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.ContentLibrary  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Esx.Hcl  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Esx.Hosts  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.Esx.Settings  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.VAPI.Metadata  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Authentication  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Authorization  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.CertManagement  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.ConsumptionDomains  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Content  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Datastore  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Deployment  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Guest  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.HVC  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.ISO  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Identity  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Inventory  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.LCM  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.NamespaceManagement  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Namespaces  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.OVF  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Services  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Storage  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.SystemConfig  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Tagging  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Topology  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.TrustedInfrastructure  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.VCHA  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.Vm  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vCenter.VmTemplate  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphere.vStats  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Sdk.vSphereRuntime  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.Vim  -GroupVerbs
    ConvertTo-PodeWebPage -Module VMware.VumAutomation  -GroupVerbs

#>

}
