# bpi-r2-uboot

Build (needs gcc <5, e.g 4.8 from ubuntu 14.4)

```
./build.sh
```

Installation
```
sudo dd if=/dev/sdx of=bpi-r2-first10M.img bs=1M count=10 #Backup of first 10MB
sudo dd of=/dev/sdx if=u-boot-mt/u-boot.bin bs=1k seek=320
```
copy uEnv.txt to BPI-ROOT/bananapi/bpi-r2/linux and change to your needs
