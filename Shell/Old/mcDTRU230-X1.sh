### ������Ƶ�ʵ����� ###
show_status
### ���Զ����� ###
cli write_fpgareg 0x7d 0
### ʱ���� ###
alm
### �ز��ּ������ļ� ###
cd /mnt/flash/metadata/z/pdt
### ����汾 ###
v
### ���� FPGA ###
cd /tmp
# tftp �������ð�
tftp 192.168.114.23 -gr app_start.sh
# tftp �ϴ����ð�
tftp 192.168.114.23 -pr app_start.sh
upl app_start.sh
# ɾ��������
rm -rf /mnt/flash/*
# ��ѹ
tar -xvJf zg60_240914.txz -C /


****�����****
cli
admin
lmk_inchannelconfig 0
set_rx1freq 255000000
set_rx2freq 255000000
set_rx3freq 255000000
set_rx4freq 253000000
set_tx1freq 310000000


****RX��·****
cli
admin
lmk_inchannelconfig 0
# RX on
write_fpgareg 0x259 2
# TX on
write_fpgareg 0x259 1

set_multi_carr_mode 3 2
freq_config 0 230
freq_config 1 230
freq_config 2 230

powercalc 10 10000000
powercalc 11 10000000
powercalc 12 10000000
powercalc 13 10000000
powercalc 18 10000000
powercalc 19 10000000


****TX��·****
lmk_inchannelconfig 0
set_testsource
dl_tetrasource 5120 0 0

set_multi_carr_mode 1 1
freq_config 0 231
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 2
powercalc 0 1000000
write_fbdvga 7
powercalctxfb 14 1000000