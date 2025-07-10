# linuxBackupUtility

#### Compresses, Encrypts and stores a desired list of files in two locations. Written to acheive the simplest possible solution.

### Use by changing the following variables to your desired values:

	dir: Directory where the local encrypted backup will be stored.

	rDriv: Aditional backup location

	bList: Path to a text file listing files/directories to back up (one per line).

	key: GPG public key identifier (must exist in your local keyring) for encryption.

### Users may also wish to change the value of dBakName to their desired output file name