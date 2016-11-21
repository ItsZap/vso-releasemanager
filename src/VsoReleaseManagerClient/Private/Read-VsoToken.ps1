<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

function Read-VsoToken{

param(
  [Parameter(Mandatory=$true)] 
  [String]$vstsAccount
  )

    $credPath = [Environment]::GetFolderPath("MyDocuments") + "\" + $vstsAccount + ".credential"
    if(Test-Path $credPath){
        $creds = Import-Clixml $credPath
        return (New-Object PSCredential $vstsAccount,$creds.Password).GetNetworkCredential().Password
    }

    return ""
}