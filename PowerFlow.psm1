# PowerFlow
#
# Copyright (c) 2011 Ian Davis
#
# Dual-licensed under the Apache License, Version 2.0, and the Microsoft Public License (Ms-PL).
# See the file LICENSE.txt for details.
#

#Requires -Version 2.0

#Ensure that only one instance of the PowerFlow module is loaded
remove-module PowerFlow -ErrorAction SilentlyContinue

#Import util scripts
#. (Join-Path $PSScriptRoot "PowerFlow.Common.ps1")
#. (Join-Path $PSScriptRoot "PowerFlow.Resources.ps1")

#-- Public Module Functions --#

function Initialize-GitFlow
{
    [CmdletBinding()]
    param(
        [switch][Parameter( Position = 0, Mandatory = 0 )]$force,
        [Parameter( Position = 1, Mandatory = 0 )]$useDefaults
    )
    
    if( Test-GitDir -eq $false )
    {
        Initialize-Git
    }
    else
    {
        if( Test-IsRepoHeadless -eq $false )
        {
            Assert-CleanWorkingTree
        }
    }
    # TODO: Initialize repo with proper branches.
}

Import-LocalizedData -BindingVariable Messages -ErrorAction SilentlyContinue

#Export-ModuleMember -function Initialize-GitFlow