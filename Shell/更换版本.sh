## DTRU 更新版本
serverip@ 192.168.114.23
cd /app
dow dtru_flash_20241106.txz
rm -rf /mnt/flash/*
tar -xJvf dtru_flash_20241106.txz -C /
hwb

## B3N41 更新版本
ifconfig eth0 192.168.144.23

serverip@ 192.168.144.23
cd /mnt/flash/upgrade
dow R4C6-B3N41-M.flash.36b9b2.1205-V1-11-101.txz
hwb