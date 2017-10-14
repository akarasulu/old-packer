#!/bin/bash

version_now=`grep version variables.jsonnet | \
               awk '{print $2}' | sed -e 's/"//g' -e 's/,//'`

# Base and tmp directory setup
# -----------------------------------------------------------------------------

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BOXNAME="$(cat variables.jsonnet | grep vm_name | awk -F ':' '{print $2}' | sed -e 's/["|,| ]//g')"

# clean up output directories and boxes
rm -rf *.box;
rm -rf *.log;
for bt in virtualbox-iso parallels-iso vmware-iso; do
  echo box output directory = "output-$BOXNAME-$bt";
  if [ -d "output-$BOXNAME-$bt" ]; then
    rm -rf "output-$BOXNAME-$bt";
  fi
done

# Check to see if we have a proxy running
if [ -n "$APT_PROXY_URL" ]; then
  echo Checking defined proxy URL = $APT_PROXY_URL
  PROXY_ON=$(wget -t 1 --timeout=2 -qO- $APT_PROXY_URL/acng-report.html | grep "Transfer statistics");
  if [ -n "$PROXY_ON" ]; then
    echo Proxy is on
    export PROXY_ON="true"
    ## TODO: Extract password from the variables.jsonnet
    PROXY_ON="true"
    PASSWORD="ubuntai"
    source ./preseeds/stretch-template.cfg
  else
    echo WARNING: Proxy is off
    PASSWORD="ubuntai"
    source ./preseeds/stretch-template.cfg
  fi
fi

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
# time packer build -on-error=ask -except=null template.json
time packer build -on-error=ask -only=qemu -except=null template.json
date
