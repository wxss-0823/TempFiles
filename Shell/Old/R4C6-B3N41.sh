### 1���ճ���


### 2��дeeprom
root
root
ir_kill
./R4C6-B8N28_eeprom_data.sh
д������롰hwb������


### 3�����ֲ���
cli carr_inactivate 0
cli carr_inactivate 1
cli carr_inactivate 2
cli carr_inactivate 3
cli write_fpgareg 0x25 0x0
cli write_fpgareg 0x26 0x0
cli write_fpgareg 0x27 0x0
cli write_fpgareg 0x28 0x0
cli write_fpgareg 0x29 0x0
cli write_fpgareg 0xd5f 0x5
cli write_fpgareg 0xd60 0x5
cli write_fpgareg 0xd61 0x5
cli write_fpgareg 0xd62 0x5
cli write_fpgareg 0xd5e 0xf
cli AdrvSetRxTxEnable 0 0xf 0
cli AdrvSetRxTxEnable 0 0x10 0
cli AdrvSetRxTxEnable 0 0x40 0


### 4��Ƶ���ǲ���
root
root
cli carr_inactivate 0
cli carr_inactivate 1
cli carr_inactivate 2
cli carr_inactivate 3
cli carr_cfg 0 0 2 100 1 2595 2595 46 5 1 0.7 0.7 6 4 4
cli carr_cfg 1 0 2 100 1 2595 2595 46 5 1 0.7 0.7 6 4 4
cli carr_cfg 2 0 1 20 0 1815 1725 46
cli carr_cfg 3 0 1 20 0 1815 1725 46
cli carr_activate 0
cli carr_activate 1
cli carr_activate 2
cli carr_activate 3
cli set_tx_att 0 10000
cli set_tx_att 1 10000
cli set_tx_att 2 10000
cli set_tx_att 3 10000
cli AdrvSetTxTestTone 0 1 1 -60 1
cli AdrvSetTxTestTone 0 2 1 -60 1
cli AdrvSetTxTestTone 0 4 1 57.5 1
cli AdrvSetTxTestTone 0 8 1 57.5 1
cli write_fpgareg 0xd5e 0xf

## trx1 ��Ƶ
cli AdrvSetTxTestTone 0 1 1 -85 1
cli AdrvSetTxTestTone 0 1 1 -65 1
cli AdrvSetTxTestTone 0 1 1 -45 1
cli AdrvSetTxTestTone 0 1 1 -25 1
cli AdrvSetTxTestTone 0 1 1 -5 1
cli AdrvSetTxTestTone 0 1 1 15 1
cli AdrvSetTxTestTone 0 1 1 35 1
cli AdrvSetTxTestTone 0 1 1 55 1
cli AdrvSetTxTestTone 0 1 1 75 1

## trx2 ��Ƶ
cli AdrvSetTxTestTone 0 2 1 -85 1
cli AdrvSetTxTestTone 0 2 1 -65 1
cli AdrvSetTxTestTone 0 2 1 -45 1
cli AdrvSetTxTestTone 0 2 1 -25 1
cli AdrvSetTxTestTone 0 2 1 -5 1
cli AdrvSetTxTestTone 0 2 1 15 1
cli AdrvSetTxTestTone 0 2 1 35 1
cli AdrvSetTxTestTone 0 2 1 55 1
cli AdrvSetTxTestTone 0 2 1 75 1

## trx3 ��Ƶ
cli AdrvSetTxTestTone 0 4 1 53 1
cli AdrvSetTxTestTone 0 4 1 58 1
cli AdrvSetTxTestTone 0 4 1 63 1
cli AdrvSetTxTestTone 0 4 1 68 1
cli AdrvSetTxTestTone 0 4 1 73 1
cli AdrvSetTxTestTone 0 4 1 78 1

## trx4 ��Ƶ
cli AdrvSetTxTestTone 0 8 1 53 1
cli AdrvSetTxTestTone 0 8 1 58 1
cli AdrvSetTxTestTone 0 8 1 63 1
cli AdrvSetTxTestTone 0 8 1 68 1
cli AdrvSetTxTestTone 0 8 1 73 1
cli AdrvSetTxTestTone 0 8 1 78 1


### 5���ź�Դ����
cli carr_inactivate 0
cli carr_inactivate 1
cli carr_inactivate 2
cli carr_inactivate 3
cli carr_cfg 0 0 2 100 1 2595 2595 46 5 1 0.7 0.7 6 4 4
cli carr_cfg 1 0 2 100 1 2595 2595 46 5 1 0.7 0.7 6 4 4
cli carr_cfg 2 0 1 20 0 1815 1720 46
cli carr_cfg 3 0 1 20 0 1815 1720 46
cli carr_activate 0
cli carr_activate 1
cli carr_activate 2
cli carr_activate 3
cli AdrvSetRxGainCtrlMode 0 15 0
cli AdrvSetRxGain 0 1 255
cli AdrvSetRxGain 0 2 255
cli AdrvSetRxGain 0 4 255
cli AdrvSetRxGain 0 8 255
## ���ö˿�����ģʽ 1��tx 2��rx
cli set_pa_mode 0 0 2
cli set_pa_mode 0 1 2
cli set_pa_mode 0 2 3
cli set_pa_mode 0 3 3
cli rssi
## ���� FB0 ģʽ
cli AdrvSetRxGain 0 0x10 255
cli AdrvSetRxTxEnable 0 0x10 0s
cli AdrvGetRxDecPower 0 0x10
## ���� FB1 ģʽ
cli AdrvSetRxGain 0 0x40 255
cli AdrvSetRxTxEnable 0 0x40 0
cli AdrvGetRxDecPower 0 0x40


## ��ӡ������Ϣ
std_print_here 
## ��������
CFR_Pulse_LTE_20MHz_15kHz_245.76MSPS_2x.txt