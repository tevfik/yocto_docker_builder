#!/bin/bash
# This script will run into container

MACHINE="imx8mminvsom"
DISTRO="fsl-imx-xwayland"
IMAGES="inv-som-imx-image"

REMOTE="https://bitbucket.org/inventronsom/invsom"
BRANCH="zeus"
MANIFEST="invsom-bsp.xml"

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