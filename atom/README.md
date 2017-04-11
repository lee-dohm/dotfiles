1. Manage Atom's packages, in `~/.atom/packages/`

	Export packages (only the names)
		
    ```
    apm list --installed --bare > package-list.txt
    ```
	
	Import packages:
	
    ```
    apm install --packages-file package-lsit.txt
    ```
