---
external help file: VsoReleaseManagerClient-help.xml
online version: 
schema: 2.0.0
---

# Get-VsoBuildArtifact

## SYNOPSIS
Get-VsoBuildArtifact will search and download build artifact from 
Visual Studio Online. In order to use this Command, you will need to use Personal Access Token (PAT).
PAT allows user to assign permission to a credential without exposing login password
to the application. User can revoke permission given to PAT at anytime.

## SYNTAX

### File
```
Get-VsoBuildArtifact [-vstsAccount] <String> [-projectName] <String> [-buildNumber] <String> [-token] <String>
 [-searchFile] <String> [[-outputPath] <String>] [<CommonParameters>]
```

### Container
```
Get-VsoBuildArtifact [-vstsAccount] <String> [-projectName] <String> [-buildNumber] <String> [-token] <String>
 [[-outputPath] <String>] [<CommonParameters>]
```

## DESCRIPTION
You can download one or more files according to search pattern from build drop folder in VSO.
You can also download drop folder as a zip file from VSO. 

In order to download one or more files, you have to specify the search pattern. 

## EXAMPLES

### Example 1
```
PS C:\> Get-VsoBuildArtifact -vstsAccount "MyAccount" -projectName "MyProject" -buildNumber "v1 20161011" -token "PATTOKEN" -searchFile "*.zip" -outputPath C:\temp
```

Download all *.zip files from drop folder of the build "v1 20161011" drop folder.

### Example 2
```
PS C:\> Get-VsoBuildArtifact -vstsAccount "MyAccount" -projectName "MyProject" -buildNumber "v1 20161011" -token "PATTOKEN"  -outputPath C:\temp
```

Download drop folder of the build "v1 20161011" drop folder as a zip file.

## PARAMETERS

### -buildNumber
Build Number to download. If you don't specify the build number, the command will return
latest build. If the Build Number return more than 1 results, the command will return only
the latest build of the results.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -outputPath
Output Path location of the files.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -projectName
Name of the Visual Studio Online project. 

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -searchFile
Build artifact to search. For example, *.zip will search all zip file in the build artifact.

```yaml
Type: String
Parameter Sets: File
Aliases: 

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -token
Personal Access Token (PAT) from Visual Studio Online.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -vstsAccount
Visual Studio Online account name. This is reflected in the domain of your visual studio.
For example https://**myaccount**.visualstudio.com. **myaccount** is the account name.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES

## RELATED LINKS

