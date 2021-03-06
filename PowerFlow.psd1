﻿# 
# Copyright (c) 2011, PowerFlow Project Contributors
# 
# Dual-licensed under the Apache License, Version 2.0, and the Microsoft Public License (Ms-PL).
# See the file LICENSE.txt for details.
# 

@{

# Script module or binary module file associated with this manifest
ModuleToProcess = "PowerFlow.psm1"

# Version number of this module.
ModuleVersion = '1.0'

# ID used to uniquely identify this module
GUID = '4a6e761c-0be9-45ff-b8d4-fa14a38bf315'

# Author of this module
Author = 'Ian Davis'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = 'Copyright (c) 2011 Ian Davis'

# Description of the functionality provided by this module
Description = 'PowerFlow Module'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '2.0'

# Name of the Windows PowerShell host required by this module
PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
PowerShellHostVersion = ''

# Minimum version of the .NET Framework required by this module
DotNetFrameworkVersion = '2.0'

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '2.0'

# Processor architecture (None, X86, Amd64, IA64) required by this module
ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module
ScriptsToProcess = @('PowerFlow.Resources.ps1','PowerFlow.Common.ps1')

# Type files (.ps1xml) to be loaded when importing this module
TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @()

# Modules to import as nested modules of the module specified in ModuleToProcess
NestedModules = @()

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# List of all modules packaged with this module
ModuleList = @("PowerFlow.psm1")

# List of all files packaged with this module
FileList = @("PowerFlow.psm1", "PowerFlow.Common.ps1", "install.ps1", "PowerFlow.Resources.ps1")

# Private data to pass to the module specified in ModuleToProcess
PrivateData = ''

}

