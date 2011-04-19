﻿# PowerFlow
#
# Copyright (c) 2011 Ian Davis
#
# Dual-licensed under the Apache License, Version 2.0, and the Microsoft Public License (Ms-PL).
# See the file LICENSE.txt for details.
#

param([switch]$WhatIf = $false)

# based on posh-git installation

if(!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Warning 'Could not find git command. Please create a git alias or add %ProgramFiles%\Git\cmd to PATH.'
    return
}

$gitVersion = git --version 2> $null
if($gitVersion -notlike 'git version 1.7.*.msysgit.*') {
    Write-Warning "posh-git requires msysgit version 1.7. You have $version."
    return
}

if(!(Test-Path $PROFILE)) {
    Write-Host "Creating PowerShell profile...`n$PROFILE"
    New-Item $PROFILE -Force -Type File -ErrorAction Stop -WhatIf:$WhatIf > $null
}

if(!(Test-Path $PROFILE)) {
    Write-Host "Creating PowerShell profile...`n$PROFILE"
    New-Item $PROFILE -Force -Type File -ErrorAction Stop -WhatIf:$WhatIf > $null
}

# Adapted from http://www.west-wind.com/Weblog/posts/197245.aspx
function Get-FileEncoding($Path) {
    $bytes = [byte[]](Get-Content $Path -Encoding byte -ReadCount 4 -TotalCount 4)

    if(!$bytes) { return 'utf8' }

    switch -regex ('{0:x2}{1:x2}{2:x2}{3:x2}' -f $bytes[0],$bytes[1],$bytes[2],$bytes[3]) {
        '^efbbbf'   { return 'utf8' }
        '^2b2f76'   { return 'utf7' }
        '^fffe'     { return 'unicode' }
        '^feff'     { return 'bigendianunicode' }
        '^0000feff' { return 'utf32' }
        default     { return 'ascii' }
    }
}

$installDir = Split-Path $MyInvocation.MyCommand.Path -Parent
$profileLine = "Import-Module `"${installDir}\PowerFlow.psd1`""
if(Select-String -Path $PROFILE -Pattern $profileLine -Quiet -SimpleMatch) {
    Write-Host "It seems PowerFlow is already installed..."
    return
}

Write-Host "Adding PowerFlow to profile..."
@"

# Load PowerFlow
$profileLine

"@ | Out-File $PROFILE -Append -WhatIf:$WhatIf -Encoding (Get-FileEncoding $PROFILE)

Write-Host 'PowerFlow sucessfully installed!'
Write-Host 'Please reload your profile for the changes to take effect:'
Write-Host '    . $PROFILE'
