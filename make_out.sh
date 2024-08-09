#!/bin/bash
mkdir -p out/PKIMetadata/2000
SCRIPT_DIR=$(dirname $0)
if [ $# -lt 1 ]
then
    echo "Usage: <root certificates...>"
    exit 1
fi
# Copy all directories, and will be modified by future calls
rm -rvf "${SCRIPT_DIR}"/out
mkdir "${SCRIPT_DIR}"/out
mkdir -p "${SCRIPT_DIR}"/out/PKIMetadata/2000/.
cp -rvf "${SCRIPT_DIR}"/original/PKIMetadata/2000/. "${SCRIPT_DIR}"/out/PKIMetadata/2000
rm -rvf "${SCRIPT_DIR}"out/PKIMetadata/2000/_metadata # verified contents not necessary
python3 ./src/root_store_gen/generate_new_pbs.py "${SCRIPT_DIR}/original/PKIMetadata/2000/crs.pb" "$@" "${SCRIPT_DIR}/out/PKIMetadata/2000/crs.pb"
# Modify version in manifest

python3 <<EOF
import json
from pathlib import Path
mjs = '${SCRIPT_DIR}/original/PKIMetadata/2000/manifest.json'
mjs = Path(mjs)
dat = Path.read_text(mjs)
x = json.loads(dat)
x['version'] = "2000"
mjs.write_text(json.dumps(x))
EOF