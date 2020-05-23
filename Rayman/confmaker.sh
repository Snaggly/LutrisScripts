#!/bin/bash
file=$(find . -type f -name "*.cue")

if [ ! -f $file ]
then
    echo "Could not find file by extension!"
    echo "Please enter manually your cue filename to be used in autoexec"
    read file
fi

echo $file
echo "Preparing autoexc"
echo "">>Rayman.conf
echo "mount C .">>Rayman.conf
echo "imgmount D \"$file\" -t iso">>Rayman.conf
echo "">>Rayman.conf
echo "@echo off">>Rayman.conf
echo "C:">>Rayman.conf
echo "IF NOT EXIST "C:\\RAYMAN.BAT" GOTO INSTALL">>Rayman.conf
echo "RAYMAN">>Rayman.conf
echo "EXIT">>Rayman.conf
echo "">>Rayman.conf
echo ":INSTALL">>Rayman.conf
echo "D:">>Rayman.conf
echo "IF NOT EXIST INSTALL.BAT CD RAYMAN">>Rayman.conf
echo "INSTALL">>Rayman.conf
echo "EXIT">>Rayman.conf

echo "Please install Rayman from image"
echo "Be sure to use Sound autodetect for SFX"
echo "Also keep default install path!"
./dosbox -noconsole -conf Rayman.conf
