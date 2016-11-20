<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

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

   $method = "Release/releases"
}