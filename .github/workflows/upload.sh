#!/bin/bash

SHAREPOINT_URL=$1
SHAREPOINT_USERNAME=$2
SHAREPOINT_PASSWORD=$3

curl -k -X POST \
  --url "${SHAREPOINT_URL}/_api/web/GetFolderByServerRelativeUrl('Path/To/TargetFolder')/Files/add(url='filename.txt', overwrite=true)" \
  --user "${SHAREPOINT_USERNAME}:${SHAREPOINT_PASSWORD}" \
  --data-binary "@path/to/local/filename.txt"
