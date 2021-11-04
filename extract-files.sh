#!/bin/bash
#
# Copyright (C) 2018 The MoKee Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=osborn
export DEVICE_COMMON=sdm660-common
export VENDOR=smartisan


"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi
ANDROID_ROOT="${MY_DIR}"/../../.."

BLOB_ROOT="${ANDROID_ROOT}"/vendor/"$VENDOR"/"$DEVICE"/proprietary

sed -i 's|\x00goodixfingerprint\x00|\x00fingerprint\x00\x00\x00\x00\x00\x00\x00|' ${BLOB_ROOT}/vendor/lib64/hw/fingerprint.goodix.so
