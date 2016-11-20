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