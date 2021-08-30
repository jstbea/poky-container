#!/bin/bash

# If the workdir is empty, clone poky and initialize layers
if [ "$(ls -A $PWD)" ]; then
     echo "$PWD is not Empty, Ready!"
else
    echo "$PWD is Empty, cloning yocto"

    ##### CUSTOM SETUP GOES HERE #####
    
    # Dependencies
    mkdir /workdir/bin
    export PATH=/workdir/bin:$PATH
    curl https://commondatastorage.googleapis.com/git-repo-downloads/repo > /workdir/bin/repo
    chmod a+x /workdir/bin/repo

    # F115 Manifest
    repo init -u git@ssh.dev.azure.com:v3/BEA-RD-Firmware/F115-Camera_ToF/f115_manifest -b master -m tdxref/default.xml
    repo sync

    ##################################
fi

source export build
exec /bin/bash
