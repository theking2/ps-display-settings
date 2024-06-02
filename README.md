# Change Display Settings

## Installation

Copy both files to $env:PSModulePath/DisplaySettings

## Usage

- `Get-DisplayResolution` - gets the current display settings
- `Set-DisplayResolution` -Width int -Height int -RefreshRate int -Flags int
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
