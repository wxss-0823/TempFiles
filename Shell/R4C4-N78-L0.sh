# login in
root
admin
ir_kill
cli
admin
write_clkreg 0xc73d 0x12 
write_clkreg 0xc7bd 0x12 

cd /tmp
dow R4C4-N78-L0-eeprom.sh
dos2unix R4C4-N78-L0-eeprom.sh
chmod 777 R4C4-N78-L0-eeprom.sh
./R4C4-N78-L0-eeprom.sh

# ���ֲ���

write_fpgareg 0x25 0
write_fpgareg 0x26 0
write_fpgareg 0x27 0
write_fpgareg 0x28 0
write_fpgareg 0x29 0


AdrvSetRxTxEnable 0 0x5f 0xf

# 1 ���� 2 ����
set_pa_mode 0 0 1
set_pa_mode 0 1 1
set_pa_mode 0 2 1
set_pa_mode 0 3 1

set_pa_mode 0 0 2
set_pa_mode 0 1 2
set_pa_mode 0 2 2
set_pa_mode 0 3 2


# Ƶ�ײ���
# ͨ�� 0 ����
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 0 0 2 100 1 3550 3550 46 5 1 0.7 0.7 6 4 4
carr_activate 0
set_power_control_enable 1
set_tx_att 0 10000
AdrvSetTxTestTone 0 1 1 -100 0
set_pa_mode 0 0 1

AdrvSetTxTestTone 0 1 1 -245 0
AdrvSetTxTestTone 0 1 1 -200 0
AdrvSetTxTestTone 0 1 1 -150 0
AdrvSetTxTestTone 0 1 1 -100 0
AdrvSetTxTestTone 0 1 1 -50 0
AdrvSetTxTestTone 0 1 1 1 0
AdrvSetTxTestTone 0 1 1 50 0

# ͨ�� 1 ����
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 1 0 2 100 1 3550 3550 46 5 1 0.7 0.7 6 4 4
carr_activate 1
set_power_control_enable 1
set_tx_att 1 10000
AdrvSetTxTestTone 0 2 1 -100 0
set_pa_mode 0 1 1

AdrvSetTxTestTone 0 2 1 -245 0
AdrvSetTxTestTone 0 2 1 -200 0
AdrvSetTxTestTone 0 2 1 -150 0
AdrvSetTxTestTone 0 2 1 -100 0
AdrvSetTxTestTone 0 2 1 -50 0
AdrvSetTxTestTone 0 2 1 1 0
AdrvSetTxTestTone 0 2 1 50 0

# ͨ�� 2 ����
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 2 0 2 100 1 3550 3550 46 5 1 0.7 0.7 6 4 4
carr_activate 2
set_power_control_enable 1
set_tx_att 2 10000
AdrvSetTxTestTone 0 4 1 -100 0
set_pa_mode 0 2 1

AdrvSetTxTestTone 0 4 1 -245 0
AdrvSetTxTestTone 0 4 1 -200 0
AdrvSetTxTestTone 0 4 1 -150 0
AdrvSetTxTestTone 0 4 1 -100 0
AdrvSetTxTestTone 0 4 1 -50 0
AdrvSetTxTestTone 0 4 1 1 0
AdrvSetTxTestTone 0 4 1 50 0

# ͨ�� 3 ����
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 3 0 2 100 1 3550 3550 46 5 1 0.7 0.7 6 4 4
carr_activate 3
set_power_control_enable 1
set_tx_att 3 10000
AdrvSetTxTestTone 0 8 1 -100 0
set_pa_mode 0 3 1

AdrvSetTxTestTone 0 8 1 -245 0
AdrvSetTxTestTone 0 8 1 -200 0
AdrvSetTxTestTone 0 8 1 -150 0
AdrvSetTxTestTone 0 8 1 -100 0
AdrvSetTxTestTone 0 8 1 -50 0
AdrvSetTxTestTone 0 8 1 1 0
AdrvSetTxTestTone 0 8 1 50 0


# �ź�Դ����
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 0 0 2 100 1 3550 3550 46 5 1 0.7 0.7 6 4 4
carr_activate 0
carr_activate 1
carr_activate 2
carr_activate 3
set_power_control_enable 1
set_tx_att 0 10000
set_rx_att 1 10000
set_rx_att 2 10000
set_rx_att 3 10000
set_pa_mode 0 0 1
set_pa_mode 0 1 2
set_pa_mode 0 2 2
set_pa_mode 0 3 2

AdrvSetTxTestTone 0 1 1 -50 0
rssi
AdrvSetTxTestTone 0 1 1 1 0
rssi
AdrvSetTxTestTone 0 1 1 50 0
rssi

set_fb_att 0 10000
set_fb_att 2 10000
AdrvSetRxTxEnable 0 0x10 0
AdrvGetRxDecPower 0 0x10
AdrvSetRxTxEnable 0 0x40 0
AdrvGetRxDecPower 0 0x40



tx att 10 dig -18dbfs  -7.5dbm ����0.5


# ��һ�������̶� 0
# �ڶ�������Ϊͨ�� 1248 ��ʾ 4 ��ͨ��
# ����������Ϊʹ�� 1 ʹ�� 0 �ر�
# ���ĸ�����Ϊƫ������Ƶ�㣬һ�� 1M
# �����������ʾ���䵥������ 0 ��ʾ -18 dbfs delta = 6 db

# ���������Ϣ
std_print_here
