<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

function Save-VsoToken{

param(
  [Parameter(Mandatory=$true)] 
  [String]$vstsAccount,
  [Parameter(Mandatory=$true)]
  [String]$token)

    $credPath = [Environment]::GetFolderPath("MyDocuments") + "\" + $vstsAccount + ".credential"
    $PWord = ConvertTo-SecureString -String $token -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential($vstsAccount, $PWord)
    $Credential | Export-CliXml $credPath

}