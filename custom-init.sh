#!/bin/bash

# If the workdir is empty, clone poky and initialize layers
if [ "$(ls -A $PWD)" ]; then
     /bin/echo "$PWD is not Empty, Ready!"
else
    /bin/echo "$PWD is Empty, cloning yocto"
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/meta-yocto-bea.git . -b sigma

    ############### CUSTOM SETUP GOES HERE ###############

    /bin/echo "Cloning BEA's meta-layers"
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/meta-bea.git
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/meta-bea-bsp.git
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/meta-bea-peco.git
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/meta-freescale-bea.git
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/meta-mender-bea.git -b morty
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/meta-oe-bea.git
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/meta-qt5-bea.git
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/meta-security-bea.git -b morty
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/oe-meta-go-bea.git
    /usr/bin/git clone ssh://git@ssh.dev.azure.com/v3/BEA-RD-Firmware/E363_Sigma/openembedded-core-bea.git -b morty

    #####################################################
fi

source ./oe-init-build-env
exec /bin/bash
