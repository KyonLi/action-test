#/bin/bash

DIST=bookworm
BOOT_URL="https://github.com/KyonLi/ufi003-kernel/releases/download/6.6.43-1/boot.img"
BOOT_NO_MODEM_URL="https://github.com/KyonLi/ufi003-kernel/releases/download/6.6.43-1/boot-no-modem.img"
BOOT_NO_MODEM_OC_URL="https://github.com/KyonLi/ufi003-kernel/releases/download/6.6.43-1/boot-no-modem-oc.img"
K_IMAGE_DEB_URL="https://github.com/KyonLi/ufi003-kernel/releases/download/6.6.43-1/linux-image-6.6.43-msm8916-g1bb4207ba356_6.6.43-g1bb4207ba356-1_arm64.deb"
K_DEV_URL="https://github.com/KyonLi/ufi003-kernel/releases/tag/6.6.43-1"
UUID=62ae670d-01b7-4c7d-8e72-60bcd00410b7

if [ `id -u` -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo >> info.md
echo "🔗 [linux-headers & linux-libc-dev]($K_DEV_URL)" >> info.md
cat info.md
