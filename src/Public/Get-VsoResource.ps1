<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

function Get-VsoResource
{
      param(
      [Parameter(Mandatory=$true)]
      [string]$resourceUrl,

      [Parameter(Mandatory=$true)]
      [string]$token,

      [Parameter(Mandatory=$false)]
      [string]$outputPath
   )

}