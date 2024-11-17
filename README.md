# Change Display Refresh rate

In PowerShell (core, not the Windows Powershell). And with hotkeys

## Installation

0. Install [Powershell (core)](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)
1. Create a folder `DisplaySettings` in your Powershell Modules folder (`%USerProfile\Documets\Powershell\Modules` or `%UserProfile%\OneDrive\Documents\Powershell\Modules` if you sync with OneDrive)
2. Copy all files to this folder

## Usage

- `Get-DisplayRefreshRate` - gets the current display settings
- `Set-DisplayRefreshRate` -RefreshRate int -Flags int

### Flags

Name|value
-|-
CDS_UPDATEREGISTRY |          0x00000001
CDS_TEST           |          0x00000002
CDS_FULLSCREEN     |          0x00000004
CDS_GLOBAL         |          0x00000008
CDS_SET_PRIMARY    |          0x00000010
CDS_RESET          |          0x40000000
CDS_NORESET        |          0x10000000

### Results

- "The settings change was successful.";
- "The computer must be restarted for the graphics mode to work.";
- "The display driver failed the specified graphics mode.";
- "The graphics mode is not supported.";
- "Unable to write settings to the registry.";
- "An invalid set of flags was passed in.";
- "An invalid parameter was passed in. This can include an invalid flag or combination of flags.";
- "The settings change was unsuccessful because the system is DualView capable.";

## Auto Hotkey

The [AutoHotkey](https://www.autohotkey.com/) script can be used to switch refreshrates with simple keyboard shortcuts:

Shortcut | Refresh rate
--|--
<kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>7</kbd>|23.976
<kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>4</kbd>|24
<kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>2</kbd>|25
<kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>9</kbd>|29.970
<kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>3</kbd>|30
<kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>5</kbd>|50
<kbd>Win</kbd>+<kbd>Alt</kbd>+<kbd>6</kbd>|60
