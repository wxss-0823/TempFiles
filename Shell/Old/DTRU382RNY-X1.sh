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
lmk_inchannelconfig 0
set_rx1freq 441000000
set_rx2freq 441000000
set_rx3freq 406500000
set_rx4freq 370000000
set_tx1freq 505100000

****RX��·****
lmk_inchannelconfig 1
set_multi_carr_mode 4 1
freq_config 0 384
freq_config 1 384
freq_config 2 384
freq_config 3 384

powercalc 10 1000000
powercalc 11 1000000
powercalc 12 1000000
powercalc 13 1000000

****TX��·****
set_testsource
dl_tetrasource 5120 0 0

set_multi_carr_mode 1 1
freq_config 0 384.5
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 12
write_fbdvga 10
powercalc 0 1000000
powercalctxfb 14 1000000







