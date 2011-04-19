# 
# Copyright (c) 2011, PowerFlow Project Contributors
# 
# Dual-licensed under the Apache License, Version 2.0, and the Microsoft Public License (Ms-PL).
# See the file LICENSE.txt for details.
# 

#Requires -Version 2.0

#-- Private Module Functions --#

function Assert
{
    param(
        [Parameter( Position = 0, Mandatory = 1 )]$condition,
        [Parameter( Position = 1, Mandatory = 1 )]$message
    )
    if ( !$condition ) { 
        throw ( "Assert: " + $message )
    }
}

function Initialize-Git
{
    & git init
}

function Get-GitDir
{
    & git rev-parse --git-dir 2>&1
}

function Get-LocalBranches
{
    # Get list of branches, remove "* " from current branch
    & git branch --no-color | % { $_ -replace "\* ","" }
}

function Get-CurrentBranch
{
    # Get list of branches, find "* " in the beginning
    # to mark the current branch, $null if there is none
	$branch = & git branch --no-color | ? { ( ( [regex] "^\*" ).Match($_).Value ) -eq "*" }
    if ( $branch -eq $null ) { $null } else { $branch.SubString(2) }
}

function Get-RemoteBranches()
{
    & git branch -r --no-color | % { $_ -replace "\* ","" }
}

function Get-AllTags()
{
    & git tag
}

function Test-CleanWorkingTree
{
    # It exits with 1 if there were differences and 0 means no differences.
    & git diff --no-ext-diff --ignore-submodules --quiet --exit-code
    if( $LastExitCode -ne 0 ) { return 1 }
	& git diff-index --cached --quiet --ignore-submodules HEAD --
	if( $LastExitCode -ne 0 ) { return 2 }
	return 0
}

function Assert-CleanWorkingTree
{
    $treeStatus = Test-CleanWorkingTree
    if( $treeStatus -eq 1 ) { Assert ( $false ) ($Messages.unstaged_changes_exist) }
    if( $treeStatus -eq 2 ) { Assert ( $false ) ($Messages.uncommitted_changes_exist) }
}

function Test-IsRepoHeadless
{
    $head = & git rev-parse --quiet --verify HEAD 2>&1
    return $head -eq $null
}

function Test-LocalBranchExists
{
	Get-LocalBranches.Length > 0
}

function Test-BranchExists
{
	Get-AllBranches.Length > 0
}

function Test-TagExists
{
	Get-AllTags.Length > 0
}

function Test-GitDir
{
    $gitDir = Get-GitDir
    return ! ( [System.String]::IsNullOrEmpty( $gitDir ) )
}