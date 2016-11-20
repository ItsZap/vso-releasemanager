<############################################
    Module  : VsoReleaseManagerClient
    Company : ItsZap Inc.
    Author  : Riwut Libinuko 
    Blog    : http://blog.libinuko.com
    Licence : GNU GENERAL PUBLIC LICENSE
    Copyright © 2016, ItsZap Inc, Riwut Libinuko (cakriwut@gmail.com). All Rights Reserved
#############################################>

function Invoke-DownloadFile{
    param(
        # Uri
        [Parameter(Mandatory=$true)]
        [string]
        $source,
        [Parameter(Mandatory=$true)]
        [string]
        $target,
        [Parameter(Mandatory=$false)]
        [string]
        $user,
        # token
        [Parameter(Mandatory=$true)]
        [string]
        $token
    )
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user,$token)))

    $job = Start-Job {
        $wc = New-Object net.webclient
        $wc.Headers.Add('Authorization', ("Basic {0}" -f $using:base64AuthInfo))
        $wc.Downloadfile($using:source, $using:target)
    }

    $i = 0
    while ((get-job $job.Id).State -eq "Running") {       
        Write-Progress -Activity "Downloading" -PercentComplete -1 -CurrentOperation " time spent $($i*2) (seconds)"        
        #set-ConsolePosition -x 0
        $i += 1
        Start-Sleep -Seconds 2
    }
}