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
      [Parameter(Mandatory=$true, ParameterSetName="Container", Position=0)]
      [Parameter(Mandatory=$true, ParameterSetName="File", Position=0)]
      [string]$vstsAccount,

      [Parameter(Mandatory=$true, ParameterSetName="Container", Position=1)]
      [Parameter(Mandatory=$true, ParameterSetName="File", Position=1)]
      [string]$projectName,

      [Parameter(Mandatory=$true, ParameterSetName="Container", Position=2)]
      [Parameter(Mandatory=$true, ParameterSetName="File", Position=2)]
      [string]$buildNumber,

      [Parameter(Mandatory=$true, ParameterSetName="Container", Position=3)]
       [Parameter(Mandatory=$true, ParameterSetName="File", Position=3)]
      [string]$token,

      [Parameter(Mandatory=$true, ParameterSetName="File", Position=4)]
       [string]$searchFile,

      [Parameter(Mandatory=$false, ParameterSetName="Container", Position=6)]
      [Parameter(Mandatory=$false, ParameterSetName="File", Position=6)]
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

    if($PSCmdlet.ParameterSetName -eq "Container"){
        # Download Url
        $source= $result.value[0].resource.downloadURl
        $target = Join-Path $outputPath "$($buildNumber).zip"

        Invoke-DownloadFile -source $source -target $target -token $token
        Write-Host "Download completed!"
    } 

    if($PSCmdlet.ParameterSetName -eq "File"){
       if($result.value[0].resource.data -match "\#\/(\d+?)\/drop")
       {
           $containerId = $Matches[1]
        
           #Query container
           $queryContainer = @{}
           $queryContainer.Add("itemPath","drop")

           $method = "resources/Containers/{0}" -f $containerId

           $uri = Get-ApiUrl -account $vstsAccount -method $method -query $queryContainer
           write-host $uri

           $result = Invoke-RestGet -uri $uri -token $token

           if($result.count -eq 0){
               throw "Unable to find Build Artifacts content for Build Number $($buildNumber)"
           }

           $result.value |? { 
               $_.itemType -eq "file" -and 
                [System.Web.HttpUtility]::UrlDecode($_.contentLocation) -like "*$($searchFile)"
           } |%{
               $target = Join-Path $outputPath $(Split-Path $_.path -Leaf)
               $source = $_.contentLocation
               write-host $source
               Invoke-DownloadFile -source $source -target $target -token $token
               Write-Host "Download completed!"
           }
       }
    }
}