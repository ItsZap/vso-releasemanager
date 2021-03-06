<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

function Find-VsoBuild
{
   param(
      [Parameter(Mandatory=$true)]
      [string]$vstsAccount,

      [Parameter(Mandatory=$true)]
      [string]$projectName,

      [Parameter(Mandatory=$true)]
      [string]$buildNumber,

      [Parameter(Mandatory=$false)]
      [string]$token
   )   

   if([string]::IsNullOrEmpty($token)){
       $token = Read-VsoToken -vstsAccount $vstsAccount 
   }

   # Start query
   $queryCmd = @{}
   $queryCmd.Add("api-version","2.0")
   $queryCmd.Add("statusFilter","completed")
   $queryCmd.Add("buildNumber",$buildNumber)
   
   $method = "build/builds"

   $uri =  Get-ApiUrl -account $vstsAccount -project $projectName -method $method -query $queryCmd;
   $result = Invoke-RestGet -uri $uri -token $token
   if ($result.count -eq 0)
   {
      throw "Unable to locate Build Number $($buildNumber)"
   }
 
   return $result
}