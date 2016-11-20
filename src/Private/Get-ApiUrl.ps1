<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

function Get-ApiUrl {
    param(
        # Account
        [Parameter(Mandatory=$true)]
        [string]
        $account,
        # Project
        [Parameter(Mandatory=$false)]
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

   $vsoApiUrl = @()
   $vsoApiUrl += "https://{0}.visualstudio.com/DefaultCollection" -f $account
   if(-not [string]::IsNullOrEmpty($project)){
       $vsoApiUrl += $project
   }
   $vsoApiUrl += "_apis/{0}" -f $method

   $queryStr = @()
   $query.GetEnumerator() |% {
      $queryStr += "$($_.Name)=$($_.Value)"
   }

   return $($vsoApiUrl -join "/")+ "?" + $($queryStr -join "&")
}