#!/usr/bin/env bash

set -ETeuo pipefail

KERNEL_VERSION=5.11.0-051100rc3-generic

mokfn_priv=/var/lib/shim-signed/mok/MOK.priv
mokfn_der=/var/lib/shim-signed/mok/MOK.der
mokfn_pem=/root/MOK.pem

if [ ! -e $mokfn_pem ]; then
  sudo openssl x509 -in $mokfn_der -inform DER -outform PEM -out $mokfn_pem
fi

kernelfn_unsigned=/boot/vmlinuz-${KERNEL_VERSION}
kernelfn_signed=${kernelfn_unsigned}.signed

[   -e "${kernelfn_unsigned}" ] || { printf "kernel version \"%s\" not found\n" "${KERNEL_VERSION}"; exit 1; }
[ ! -e "${kernelfn_signed}"   ] || { printf "kernel version \"%s\" already signed\n" "${KERNEL_VERSION}"; exit 1; }

sudo sbsign --key $mokfn_priv --cert $mokfn_pem $kernelfn_unsigned --output $kernelfn_signed


sudo cp /boot/initrd.img-${KERNEL_VERSION}{,.signed}

sudo update-grub
