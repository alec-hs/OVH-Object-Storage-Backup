#!/bin/bash

src="/mnt/c/Users/Alec/Documents/GitHub"
dest="swift://backup-name"

export PASSPHRASE="MySecretPassPhrase"

export SWIFT_USERNAME="Username"
export SWIFT_PASSWORD="Password"
export SWIFT_AUTHURL="https://auth.cloud.ovh.net/v2.0/"
export SWIFT_AUTHVERSION="2"
export SWIFT_TENANTNAME="Tennant-Name"
export SWIFT_REGION_NAME="Region-Name"

/usr/bin/duplicity --verbosity notice --progress --asynchronous-upload --cf-backend swift --volsize 100 "$src" "$dest"

unset PASSPHRASE SWIFT_USERNAME SWIFT_PASSWORD SWIFT_AUTHURL SWIFT_AUTHVERSION SWIFT_TENANTNAME  SWIFT_REGIONNAME