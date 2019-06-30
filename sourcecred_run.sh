#!/bin/sh

set -eu

DEMO_DIR="/Users/sben/Documents/coins/sourcecred_time/wasabi-sourcecred-demo"
SOURCECRED_DIR="/Users/sben/Documents/coins/sourcecred_time/sourcecred"
SOURCECRED_CLI="/Users/sben/Documents/coins/sourcecred_time/sourcecred/bin/sourcecred.js"
export SOURCECRED_DIRECTORY="$DEMO_DIR/sourcecred_data"
SITE_DIR="$DEMO_DIR/site"

node "$SOURCECRED_CLI" load zkSNACKs/WalletWasabi

(cd "$SOURCECRED_DIR" && yarn build --output-path "$SITE_DIR")
mkdir -p "$SITE_DIR/api/v1"
cp -r "$SOURCECRED_DIRECTORY" "$SITE_DIR/api/v1/data"
rm -rf "$SITE_DIR/api/v1/data/cache"