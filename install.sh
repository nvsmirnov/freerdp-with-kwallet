#!/bin/bash

set -euo pipefail

REF="${REF:-main}"
BASE="https://raw.githubusercontent.com/nvsmirnov/freerdp-with-kwallet/$REF"
DESTDIR="${DESTDIR:-/usr/local/bin}"

files=(
    freerdp-with-kwallet
    freerdp-with-kwallet-write-helper
    freerdp-with-kwallet-host-sample.sh
)

for FILE in "${files[@]}"; do
    echo "Installing $FILE"
    : > "$DESTDIR/$FILE"  # for better error messages if there is no write permission, because curl is not very informative
    curl -fsSL "$BASE/$FILE" -o "$DESTDIR/$FILE" || (RV=$?; rm -f "$DESTDIR/$FILE"; exit $RV)
    chmod 755 "$DESTDIR/$FILE"
done

echo "Installed to $DESTDIR"
echo "Now, make a copy of $DESTDIR/freerdp-with-kwallet-host-sample.sh, edit and use it to start your RDP session"
