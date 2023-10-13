#!/bin/bash
# This script will run into container

MACHINE="imx8mpevk"
DISTRO="fsl-imx-xwayland"
IMAGES="imx-image-core"

REMOTE="https://github.com/nxp-imx/imx-manifest"
BRANCH="imx-linux-mickledore"
MANIFEST="imx-6.1.36-2.1.0.xml"

# Init

echo ${REMOTE}
repo init \
    -u ${REMOTE} \
    -b ${BRANCH} \
    -m ${MANIFEST}

repo sync -j`nproc`

# source the yocto env

EULA=1 MACHINE="${MACHINE}" DISTRO="${DISTRO}" source imx-setup-release.sh -b build_${DISTRO}

# Build

bitbake ${IMAGES}
bitbake fsl-image-mfgtool-initramfs