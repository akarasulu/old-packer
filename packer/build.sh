#!/bin/bash

version_now=`grep version variables.jsonnet | \
               awk '{print $2}' | sed -e 's/"//g' -e 's/,//'`

# Base and tmp directory setup
# -----------------------------------------------------------------------------

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BOXNAME="$(cat variables.jsonnet | grep vm_name | awk -F ':' '{print $2}' | sed -e 's/["|,| ]//g')"

# clean up output directories and boxes
rm -rf *.box;
for bt in virtualbox-iso parallels-iso vmware-iso; do
  echo box output directory = "output-$BOXNAME-$bt";
  if [ -d "output-$BOXNAME-$bt" ]; then
    rm -rf "output-$BOXNAME-$bt";
  fi
done

echo "==> Generating template.json ..."
jsonnet template.jsonnet > template.json
jsonnet variables.jsonnet > variables.json

echo "==> Validating template.json ..."
packer validate template.json

if [ "$?" -ne 0 ]; then
  exit 1
fi

echo "==> Running packer build on template.json ..."
# time packer build -except=null -on-error=ask template.json
date
time packer build -on-error=ask -except=null -var-file variables.json template.json
date
