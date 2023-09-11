#!/usr/bin/env bash

set -euo pipefail

VERSION=$1

# Empty string means get latest, leave it empty
if [[ -z "${VERSION}" ]]; then
  TAG=""
# The tag is the version prefixed with a 'v' (if not already provided)
elif [[ ! ${VERSION} =~ ^v.*  ]]; then
  TAG="v${VERSION}"
else
  TAG="${VERSION}"
fi

# Use the GitHub CLI to download

gh release download "${TAG}" --repo "knope-dev/knope" --pattern "*linux*"
TAR_FILE=$(ls knope-*.tgz)
tar -xvf "$TAR_FILE"
rm "$TAR_FILE"
# Move the binary out of the nested dir
mv knope*/knope knope
