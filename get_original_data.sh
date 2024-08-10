#!/bin/bash
echo This script may be removed or disabled later with discretion of google.

# Search directory for versions
HIGHESTVERSIONAPPARENTLY=$(find  "$HOME"/.config/google-chrome/PKIMetadata/ -maxdepth 1 -mindepth 1 -type d| head -n 1)

#Let the user know what version we are on
echo "$HIGHESTVERSIONAPPARENTLY"

# Prepare output directory (version is 2000 for now. Don't ask why)
mkdir -p original/PKIMetadata/2000

#Copy latest version as base (idk if this is reliable)
cp -rvf "$HIGHESTVERSIONAPPARENTLY"/. original/PKIMetadata/2000

#Remove metadata and fingerprint(just sha256 of manifest) to be accepted
rm -rvf original/PKIMetadata/2000/_metadata
rm -rvf original/PKIMetadata/2000/manifest.fingerprint

#end of script