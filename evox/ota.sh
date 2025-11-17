#!/bin/bash

BRANCH=$(curl -fsSL https://api.github.com/repos/Rondeau79/EVOX-OTA-Releases | jq -r .default_branch)
API_URL="https://raw.githubusercontent.com/Rondeau79/EVOX-OTA-Releases/$BRANCH/builds/pstar.json"

json_response=$(curl -fsSL "$API_URL")

if [ $? -ne 0 ]; then
    echo "Error fetch $API_URL"
    exit 1
fi

#filename=$(echo "$json_response" | jq -r '.response[0].filename')
#download=$(echo "$json_response" | jq -r '.response[0].download')

# Workaround for broken json
filename=$(echo "$json_response" | grep -oP '"filename"\s*:\s*"\K[^"]+')
download=$(echo "$json_response" | grep -oP '"download"\s*:\s*"\K[^"]+')

if [ -z "$filename" ] || [ -z "$download" ]; then
    echo "Error: no filename or download"
    echo "Raw response：$json_response"
    exit 1
fi

wget -O "$filename" "$download"

if [ $? -eq 0 ]; then
    echo "Download : $filename"
else
    echo "Download failed"
    exit 1
fi

unzip -j "$filename" META-INF/com/android/otacert
custota-tool gen-csig --input "$filename" --key testkey.pk8 --cert testkey.x509.pem --cert-verify otacert --output "${filename%.zip}.csig"
custota-tool gen-update-info --file pstar.json --location "$download" --csig-location "https://raw.githubusercontent.com/KyonLi/action-test/master/evox/${filename%.zip}.csig"
