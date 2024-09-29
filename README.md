# Node Installer
I always found it annoying to install Node on Linux machines, hence why I made this.

Currently made to install Node if no version is found, otherwise remove old version.<br>
Must be ran with root.<br>
This script is **NOT** associated with the offical [NodeJS](https://nodejs.org/).

## Supported OS

| Operating System | Version               | Tested & Supported                 |
| ---------------- | ----------------------| ---------------------------------- |
| Debian           | from 11 to 12         | :white_check_mark:                 |
| Ubuntu           | from 18.04 to 22.04   | :grey_question:                    |

## Run
```bash
bash <(curl -s https://raw.githubusercontent.com/andreasclaesson/node-installer/main/install.sh)
```
