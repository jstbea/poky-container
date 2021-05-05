#!/bin/bash

# If the workdir is empty, clone poky and initialize layers
if [ "$(ls -A $PWD)" ]; then
     echo "$PWD is not Empty, Ready!"
else
    echo "$PWD is Empty, cloning yocto"
    /usr/bin/git clone git://git.yoctoproject.org/poky .

    ##### CUSTOM SETUP GOES HERE #####
    
    ##################################
fi

source ./oe-init-build-env
exec /bin/bash
