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

`cfg/fileList.txt` defines which files are included in the Backup. Configure it with the following rules:
- One entry per line.
- No leading or trailing `/`
```
home/user
etc/crontab
path/to/file/3
path/to/file/4
```
## Usage

1.  **Configure `cfg/bak.cfg`:** Edit the file with your paths and public GPG key.
2.  **Configure `cfg/fileList.txt`:** Replace contents with desired files.
3.  **Run the Script:** Execute in shell
4.  **Automation:** Automate with cron or alternative program
