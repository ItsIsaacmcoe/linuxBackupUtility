# Linux Backup Utility

This script creates an encrypted tar system backup from a list of files and optionally copies it to additional directories.

## Requirements

*   `Bash`
*   `tar`
*   `gpg`
*   `sudo`

## Configuration

The script relies on the configuration file `backList.cfg` to define backup settings. **You *must* configure this file before running the script.**

*   `lDir`: Local backup destination directory.
*   `bList`: File listing files to back up (one entry per line).
*   `key`: Public GPG key for encryption.
*   `rDirs`: (Optional) Array of additional directories to copy the backup to.

## Usage

1.  **Configure `backList.cfg`:** Edit the file with your paths and key.
2.  **Run the Script:** Execute with `sudo` privileges

## Notes

*   This is a basic backup utility.
*   Test the backup process regularly.
*   Requires `sudo` privileges.