# Linux Backup Utility

This script creates an encrypted tar system backup from a list of files and optionally copies it to additional directories.

## Requirements

*   `Bash`
*   `tar`
*   `gpg`

## Configuration

The script relies on the configuration file `cfg/bak.cfg` to define backup settings. **You *must* configure this file before running the script.**

*   `lDir`: Local backup destination directory.
*   `key`: Public GPG key for encryption.
*   `rDirs`: (Optional) Array of additional directories to copy the backup to.

The default list of files to backup can be found at cfg/fileList.txt


## Usage

1.  **Configure `bak.cfg`:** Edit the file with your paths and key.
2.  **Run the Script:** Execute in shell
3.  **Automation:** Automate with crontab or simaler program
