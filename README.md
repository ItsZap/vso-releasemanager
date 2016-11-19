# VSO - Release Manager Client
## by ItsZap Inc.

Visual Studio Online provides REST API which allow devops to 
consume Release Artifact. 
The Release process in VSO requires build/release Agent to 
be deployed in the machine that has connection with the target server.
This in turns requires devops to install many Agent in order to deploye.

VSO - Release Manager Client is a tool to solve this issue.

Developer team will develop, prepare release and deploy to test machine.
Once the release is tested, change manager will create RFC containing
release number to be deployed.

Devops will use this Release Manager Client to start download
correct release and execute the deployment process.

## Prerequisites
1. VSO Project Name
2. Alternate access token
3. Release number

## Example
Get-VsoRelease -Project ItsZap -Release "v2 14.09" -AuthToken SECRETTOKEN



### Developers
1. Riwut Libinuko ([cakriwut@gmail.com](mailto://cakriwut@gmail.com))

