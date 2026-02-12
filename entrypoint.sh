#!/usr/bin/env bash

set -euo pipefail

VERSION=$1

# If a version was set, do some massaging
if [[ -n "${VERSION}" ]]; then
  # The tag is the version prefixed with a 'v' (if not already provided)
  if [[ ! ${VERSION} =~ ^v.*  ]]; then
    TAG="v${VERSION}"
  else
    TAG="${VERSION}"
  fi

  # If the version is 0.16.2 or greater, the tag is prefixed with knope/
  if [[ ${TAG} == "v0.16.2" || ${TAG} > "v0.16.2" ]]; then
    TAG="knope/${TAG}"
  fi
else # If the tag is empty, get the latest release
  TAG=$(gh release list --json tagName --jq '.[].tagName' --repo "knope-dev/knope"  | grep knope | head -n 1)
fi

# Use the GitHub CLI to download
echo "Downloading ${TAG}"
gh release download "${TAG}" --repo "knope-dev/knope" --pattern "*x86_64*linux*"
TAR_FILE=$(ls knope-*.tgz)
tar -xvf "$TAR_FILE"
rm "$TAR_FILE"
# Move the binary out of the nested dir
mv knope*/knope knope
