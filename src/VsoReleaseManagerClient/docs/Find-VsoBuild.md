---
external help file: VsoReleaseManagerClient-help.xml
online version: 
schema: 2.0.0
---

# Find-VsoBuild

## SYNOPSIS
Search Build Number in Visual Studio Online

## SYNTAX

```
Find-VsoBuild [-vstsAccount] <String> [-projectName] <String> [-buildNumber] <String> [-token] <String>
```

## DESCRIPTION
Search Build Number in Visual Studio Online

## EXAMPLES

### Example 1
```
PS C:\> Find-VsoBuild -vstsAccount MyAccount -projectName MyProject -buildNumber"v 123"
```

Search build number 123 from Visual Studio Online using stored token.

## PARAMETERS

### -buildNumber
Build Number to search

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

### -projectName
Project Name

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

### -token
Personal Access Token

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
Visual Studio Online account name

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

## INPUTS

### None


## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

