#!/bin/bash
set -euo pipefail

echo "copying templates to ~/.groceries"
mkdir ~/.groceries
cp templates ~/.groceries

echo "copying `groceries` command to /usr/local/bin"
cp groceries.sh /usr/local/bin/groceries

echo "all done!"
