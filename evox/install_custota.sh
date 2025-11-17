#!/bin/bash

URL="https://github.com/chenxiaolong/Custota/releases/download/v5.18/custota-tool-5.18-x86_64-unknown-linux-gnu.zip"

wget "$URL"
unzip custota*.zip
mv custota-tool /bin/
chmod 755 /bin/custota-tool
