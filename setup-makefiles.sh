#!/bin/bash
#
# Copyright (C) 2018 The MoKee Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=osborn
export DEVICE_COMMON=sdm660-common
export VENDOR=smartisan

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"
