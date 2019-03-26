#!/usr/bin/env bash
folder=../_mounted/dgx
mkdir -p $folder
sshfs dgx:/home/a.lukyanov1 $folder
