#!/bin/bash
set -euo pipefail

echo "copying templates to ~/.groceries"
mkdir ~/.groceries
cp -r templates ~/.groceries

echo "copying `groceries` command to /usr/local/bin"
cp scripts/groceries.sh /usr/local/bin/groceries

echo "all done!"
