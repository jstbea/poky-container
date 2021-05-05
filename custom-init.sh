#!/bin/bash

# If the workdir is empty, clone poky and initialize layers
if [ "$(ls -A $PWD)" ]; then
     echo "$PWD is not Empty, Ready!"
else
    echo "$PWD is Empty, cloning yocto"
    /usr/bin/git clone git://git.yoctoproject.org/poky .

    ##### CUSTOM SETUP GOES HERE #####
    echo "Checking out morty-16.0.4"
    /usr/bin/git checkout tags/morty-16.0.4 -b bea-morty
    echo "Cloning BEA's meta-layers"
    /usr/bin/git clone git@github.com:bea-sensors/meta-bea.git
    /usr/bin/git clone git@github.com:bea-sensors/meta-bea-bsp.git
    /usr/bin/git clone git@github.com:bea-sensors/meta-bea-peco.git
    /usr/bin/git clone git@github.com:bea-sensors/meta-freescale-bea.git
    /usr/bin/git clone git@github.com:bea-sensors/meta-mender-bea.git
    /usr/bin/git clone git@github.com:bea-sensors/meta-oe-bea.git
    /usr/bin/git clone git@github.com:bea-sensors/meta-qt5-bea.git
    /usr/bin/git clone git@github.com:bea-sensors/meta-security-bea.git
    /usr/bin/git clone git@github.com:bea-sensors/oe-meta-go-bea.git
    /usr/bin/git clone git@github.com:bea-sensors/openembedded-core-bea.git
    ##################################
fi

source ./oe-init-build-env
exec /bin/bash
