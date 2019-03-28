#!/usr/bin/env bash
mountpoint=../_mounted/dgx
mkdir -p $mountpoint
sshfs dgx:/home/$(ssh dgx whoami) $mountpoint
echo "Mounted at $mountpoint"
