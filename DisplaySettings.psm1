[Flags()] enum CDSFlags {
    Dynamically = 0
    UpdateRegistry = 0x01
    Test = 0x02
    FullScreen = 0x04
    Global = 0x08
    SetPrimary = 0x10
    Reset = 0x40000000
    NoReset = 0x10000000
}

<#
.LINK
https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-changedisplaysettingsa#parameters
#>
function Set-DisplayResolution {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [int]
        $Width,

        [Parameter(Mandatory = $true, Position = 1)]
        [int]
        $Height,

        [Parameter(Mandatory = $true, Position = 2)]
        [int]
        $RefreshRate,

        [CDSFlags]
        $Flag = [CDSFlags]::Dynamically
    )
    if ($PSCmdlet.ShouldProcess("Set Display Resolution", "Set Display Resolution to $Width x $Height with $RefreshRate refresh rate")) {
        [cds.Helper]::setDisplayResolution($width, $height, $refreshRate, $flag)
    }
}

function Set-DisplayRefreshRate {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [int]
        $RefreshRate,

        [CDSFlags]
        $Flag = [CDSFlags]::Dynamically
    )
    if ($PSCmdlet.ShouldProcess("Set Display Refresh Rate", "Set Display Refresh Rate to $RefreshRate")) {
        [cds.Helper]::setDisplayRefreshRate($refreshRate, $flag)
    }
}

function Get-DisplayResolution {
    [cds.Helper]::getDisplaySettings()
}

# Path to the C# file
$cdsPath = "$PSScriptRoot/CDS.cs"

if (Test-Path $cdsPath) {
    $cds = Get-Content $cdsPath -Raw
    try {
        Add-Type -TypeDefinition $cds -Language CSharp
    }
    catch {
        Write-Output "Failed to load C# type: $_"
    }
}
else {
    Write-Information "CDS.cs file not found at $cdsPath"
}

# Verify if the type is available
if ( null -eq "cds.Helper".GetType()) {
    Write-Output "cds.Helper type is not available."
}