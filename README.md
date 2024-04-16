# Kodi Scripts

This repository contains Bash scripts to help manage TV show files: `nfo_files.sh` and `rename.sh`. These scripts are designed to simplify the process of organising and renaming files for a TV show. I usually pull these down when I reimage my machine.

## rename.sh

### Usage
`./rename.sh 'Show Name' SeasonNo`

### Example
`./rename.sh 'Breaking Bad' 2`

## nfo_files.sh

### Usage
`./nfo_files.sh 'Show Name' SeasonNo NoEpisodes 'Season Name'`

### Example
`./nfo_files.sh 'Game of Thrones' 1 10 'Winter is Coming'`

### Permissions
Ensure that you have the necessary permissions to execute these scripts:
`chmod +x rename.sh nfo_files.sh`
