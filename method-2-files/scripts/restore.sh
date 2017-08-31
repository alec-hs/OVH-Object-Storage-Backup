#!/bin/bash

dest="/mnt/c/path/to/restore/location"
src="swift://backup-name"

export PASSPHRASE="MySecretPassPhrase"

export SWIFT_USERNAME="Username"
export SWIFT_PASSWORD="Password"
export SWIFT_AUTHURL="https://auth.cloud.ovh.net/v2.0/"
export SWIFT_AUTHVERSION="2"
export SWIFT_TENANTNAME="Tennant-Name"
export SWIFT_REGION_NAME="Region-Name"

/usr/bin/duplicity "$src" "$dest"

unset PASSPHRASE SWIFT_USERNAME SWIFT_PASSWORD SWIFT_AUTHURL SWIFT_AUTHVERSION SWIFT_TENANTNAME  SWIFT_REGIONNAME