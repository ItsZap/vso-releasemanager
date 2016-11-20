<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

$script:VSO_API_FORMAT = "https://{0}.visualstudio.com/DefaultCollection/{1}/_apis/{2}"


function Get-VsoBuild
{
   param(
      [Parameter(Mandatory=$true)]
      [string]$vstsAccount,

      [Parameter(Mandatory=$true)]
      [string]$projectName,

      [Parameter(Mandatory=$true)]
      [string]$buildNumber,

      [Parameter(Mandatory=$true)]
      [string]$token
   )

   $queryCmd = @{}
   $queryCmd.Add("api-version","2.0")
   $queryCmd.Add("statusFilter","completed")
   $queryCmd.Add("buildNumber",$buildNumber)

   $uri =  Get-ApiUrl -account $vstsAccount -project $projectName -method "builds" -query $queryCmd;
   Invoke-RestGet -uri $uri -token $token
   Write-Host $uri
}


function Get-VsoRelease
{
    param(
      [Parameter(Mandatory=$true)]
      [string]$vstsAccount,

      [Parameter(Mandatory=$true)]
      [string]$projectName,

      [Parameter(Mandatory=$true)]
      [string]$releaseNumber,

      [Parameter(Mandatory=$true)]
      [string]$token
   )
}

# Private function
function Get-ApiUrl {
    param(
        # Account
        [Parameter(Mandatory=$true)]
        [string]
        $account,
        # Project
        [Parameter(Mandatory=$true)]
        [string]
        $project,
        # Method
        [Parameter(Mandatory=$true)]
        [string]
        $method,
        # Query
        [Parameter(Mandatory=$true)]
        [HashTable]
        $query
    )

   $queryStr = @()
   $query.GetEnumerator() |% {
      $queryStr += "$($_.Name)=$($_.Value)"
   }

   return $script:VSO_API_FORMAT -f $account,$project,$method + "?" + $($queryStr -join "&")
}

function Invoke-RestGet
{
    param(
        # Uri
        [Parameter(Mandatory=$true)]
        [string]
        $uri,
        [Parameter(Mandatory=$false)]
        [string]
        $user,
        # token
        [Parameter(Mandatory=$true)]
        [string]
        $token
    )
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user,$token)))
    return Invoke-RestMethod -Uri $uri -Method Get -ContentType "application/json" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)}
}