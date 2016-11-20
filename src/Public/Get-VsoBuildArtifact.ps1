<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

function Get-VsoBuildArtifact {
    param(
      [Parameter(Mandatory=$true)]
      [string]$vstsAccount,

      [Parameter(Mandatory=$true)]
      [string]$projectName,

      [Parameter(Mandatory=$true)]
      [string]$buildNumber,

      [Parameter(Mandatory=$true)]
      [string]$token,

      [Parameter(Mandatory=$false)]
      [string]$outputPath
   )

   $result = Get-VsoBuildId -vstsAccount $vstsAccount -projectName $projectName -buildNumber $buildNumber -token $token
   
   $buildId = 0
   if($result.count -gt 1){
       Write-Output "Found multiple builds. Assume latest build!"
       $buildId = ($result.value | Measure-Object -Property id -Maximum).Maximum
   } elseif($result.count -eq 1){
       $buildId = $result.value[0].id
   } else {
       throw "Unable to locate Build ID for Build Number $($buildNumber)"
   }

   # Start Query
   $queryCmd = @{}
   $queryCmd.Add("api-version","2.0")

   $method = "build/builds/{0}/artifacts" -f $buildId
   $uri =  Get-ApiUrl -account $vstsAccount -project $projectName -method $method -query $queryCmd;
   $result = Invoke-RestGet -uri $uri -token $token
   if ($result.count -eq 0)
   {
      throw "Unable to locate Build Artifacts for Build Number $($buildNumber)"
   }
   
   # Download Url
   $source= $result.value[0].resource.downloadURl
   $target = Join-Path $outputPath "$($buildNumber).zip"

    # $job = Start-Job {
    #     $wc = New-Object net.webclient
    #     $wc.Headers.Add('Authorization', ("Basic {0}" -f $using:base64AuthInfo))
    #     $wc.Downloadfile($using:source, $using:target)
    # }

    # $i = 0
    # while ((get-job $job.Id).State -eq "Running") {        
    #     Write-Host "Downloading $($i*2) (seconds)" -NoNewline
    #     set-ConsolePosition -x 0
    #     $i += 1
    #     Start-Sleep -Seconds 2
    # }

    # set-ConsolePosition -x 0
    Write-Host "Download completed!"
}