# kernel_sign

Steps to sign the linux kernel for secure boot. Used on Ubuntu 20.04

https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11-rc3/

```
sudo dpkg -i \
linux-headers-5.11.0-051100rc3-generic_5.11.0-051100rc3.202101102331_amd64.deb \ linux-image-unsigned-5.11.0-051100rc3-generic_5.11.0-051100rc3.202101102331_amd64.deb \
linux-modules-5.11.0-051100rc3-generic_5.11.0-051100rc3.202101102331_amd64.deb \
linux-headers-5.11.0-051100rc3_5.11.0-051100rc3.202101102331_all.deb
```S