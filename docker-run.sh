#!/bin/sh

docker run --pull --rm -it -v $1:/workdir -v ~/.ssh:/home/pokyuser/.ssh tlangohr/yoctodev:sigma --workdir=/workdir