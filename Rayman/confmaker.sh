#!/bin/sh
file="$(find . -type f -name '*.cue' -print -quit)"

if [ -z "$file" ]
then
    echo 'Could not find file by extension!'
    echo 'Please enter manually your cue filename to be used in autoexec'
    printf '%s' 'Filename: '; IFS='' read -r file
fi

printf '%s\n' "$file"
echo 'Preparing autoexc'
cat >>Rayman.conf <<EOF

mount C .
imgmount D "$file" -t iso

@echo off
C:
IF NOT EXIST C:\RAYMAN.BAT GOTO INSTALL
RAYMAN
EXIT

:INSTALL
D:
IF NOT EXIST INSTALL.BAT CD RAYMAN
INSTALL
EXIT
EOF

echo 'Please install Rayman from image'
echo 'Be sure to use Sound autodetect for SFX'
echo 'Also keep default install path!'
./dosbox -noconsole -conf Rayman.conf