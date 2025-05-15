#############################################################################
# ps�鿴���̣�����������̣�˵�������������
# {ir_monitor.sh} /bin/sh /app/ir/scripts/ir_monitor.sh
#############################################################################

#############################################################################
# 1.���³���
��R2401-N1M-60W4C_R_FLASH_V1.00.012.txz�ļ�����/mnt/flash/upgrade����
֮��λ

# 2.����eeprom
�����ϵ���ɺ󣬼�����������EEPROM�ļ�
cd /app/metadata/eeprom/
./R2401_EEPROM_VGS_20250420.sh 
./R2401_EEPROM_normal_cfg_20250425.sh 
ִ����Ϻ�λ

# 3.ȡ���ž�����ȡ�긴λ ��ע��ѯ���Ƿ���������
������������110mA����20mA
ȡ�꾲����λ
#############################################################################

#############################################################################
# 4.���ڲ�Դ���������
# ���ڲ�Դ
write_fpgareg 0xda4 0
write_fpgareg 0xda5 0
write_fpgareg 0xda6 0
write_fpgareg 0xda7 0
write_fpgareg 0xd80 3
write_fpgareg 0xd85 3
write_fpgareg 0xd8a 3
write_fpgareg 0xd8f 3
write_fpgareg 0xda0 1
write_fpgareg 0xda1 1
write_fpgareg 0xda2 1
write_fpgareg 0xda3 1
set_axc_info_index 0 0 0 0
set_axc_dl_num 0 0 1 1
set_axc_info_index 1 0 0 0
set_axc_dl_num 1 0 1 2
set_axc_info_index 2 0 0 0
set_axc_dl_num 2 0 1 3
set_axc_info_index 3 0 0 0
set_axc_dl_num 3 0 1 4
write_fpgareg 0xda0 0
write_fpgareg 0xda1 0
write_fpgareg 0xda2 0
write_fpgareg 0xda3 0
write_fpgareg 0xda4 1
write_fpgareg 0xda5 1
write_fpgareg 0xda6 1
write_fpgareg 0xda7 1
write_fpgareg 0x105 1
write_fpgareg 0x110 0x0
write_fpgareg 0x570 3
write_fpgareg 0x573 3
write_fpgareg 0x576 3
write_fpgareg 0x579 3
write_fpgareg 0x1c0 3
write_fpgareg 0x1c3 3
write_fpgareg 0x1c6 3
write_fpgareg 0x1c9 3
write_fpgareg 0x100 0
msleep 1000
write_fpgareg 0x100 0xffff
write_fpgareg 0xd70  0
write_fpgareg 0x114 16
write_fpgareg 0x110 0x20
write_fpgareg 0x153 0xf

# �����ز�
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 0 0 3 10 0 2160 1970 47.8
carr_cfg 1 0 3 10 0 2160 1970 47.8
carr_cfg 2 0 3 10 0 2160 1970 47.8
carr_cfg 3 0 3 10 0 2160 1970 47.8
carr_activate 0
carr_activate 1
carr_activate 2
carr_activate 3

AdrvSetClgcEnable 0 1 0
AdrvSetClgcEnable 0 2 0
AdrvSetClgcEnable 0 4 0
AdrvSetClgcEnable 0 8 0
set_fb_att 0 0
set_fb_att 2 0
AdrvSetTrackCalsEnable 0 0xf00000 1
#############################################################################

#############################################################################
# procedure
######################################################
# ǰ����һ�㶼Ϊ-18dbfs
######################################################
# ͨ��0ǰ���� ������������clgcOrxRmsPower: -inf dBFS��
write_fpgareg 0x5c 0
AdrvSetTxToOrxMapping 0 0x10 1
AdrvGetClgcStatus 0 1   

# ͨ��1ǰ����
write_fpgareg 0x5c 1
AdrvSetTxToOrxMapping 0 0x10 2
AdrvGetClgcStatus 0 2   

# ͨ��2ǰ����
write_fpgareg 0x5c 0
AdrvSetTxToOrxMapping 0 0x40 4
AdrvGetClgcStatus 0 4  

# ͨ��3ǰ����
write_fpgareg 0x5c 1
AdrvSetTxToOrxMapping 0 0x40 8
AdrvGetClgcStatus 0 8  
######################################################

######################################################
# ������һ���ǰ��С13dbfs����
######################################################
# ͨ��0������ ������������clgcOrxRmsPower: -inf dBFS��
write_fpgareg 0x5c 4
AdrvSetTxToOrxMapping 0 0x10 1
AdrvGetClgcStatus 0 1   

# ͨ��1������
write_fpgareg 0x5c 5
AdrvSetTxToOrxMapping 0 0x10 2
AdrvGetClgcStatus 0 2   

# ͨ��2������
write_fpgareg 0x5c 4
AdrvSetTxToOrxMapping 0 0x40 4
AdrvGetClgcStatus 0 4  

# ͨ��3������

write_fpgareg 0x5c 5
AdrvSetTxToOrxMapping 0 0x40 8
AdrvGetClgcStatus 0 8  

######################################################
# ǰ���ʲΪ����ȣ������Ӧ����50dB����
######################################################
# �۲����� CH0
write_fpgareg 0x140 0x1fff
write_fpgareg 0x143 0x1fff
write_fpgareg 0x146 0x1fff
write_fpgareg 0x149 0x1fff

write_fpgareg 0x140 0
write_fpgareg 0x5c 0
AdrvSetTxToOrxMapping 0 0x10 1
AdrvGetClgcStatus 0 1

# �۲����� CH1
write_fpgareg 0x140 0x1fff
write_fpgareg 0x143 0x1fff
write_fpgareg 0x146 0x1fff
write_fpgareg 0x149 0x1fff

write_fpgareg 0x143 0
write_fpgareg 0x5c 1
AdrvSetTxToOrxMapping 0 0x10 2
AdrvGetClgcStatus 0 2

# �۲����� CH2
write_fpgareg 0x140 0x1fff
write_fpgareg 0x143 0x1fff
write_fpgareg 0x146 0x1fff
write_fpgareg 0x149 0x1fff

write_fpgareg 0x146 0
write_fpgareg 0x5c 0
AdrvSetTxToOrxMapping 0 0x40 4
AdrvGetClgcStatus 0 4

# �۲����� CH3
write_fpgareg 0x140 0x1fff
write_fpgareg 0x143 0x1fff
write_fpgareg 0x146 0x1fff
write_fpgareg 0x149 0x1fff

write_fpgareg 0x149 0
write_fpgareg 0x5c 1
AdrvSetTxToOrxMapping 0 0x40 8
AdrvGetClgcStatus 0 8
######################################################


#############################################################################
# dpdStatus.dpdStatistics.dpdDirectEvm: 0.00 % 
# ��ע���������Ӧ��Ϊ 0 % ~ 1.2 % ���ţ�1.2 % ~ 2 % ������ 2 % ����˵��������������й¶
#############################################################################
# 5.���ڲ�Դ���� DPD ״̬
set_tx_gain_delta 0 5000
set_tx_gain_delta 1 5000
set_tx_gain_delta 2 5000
set_tx_gain_delta 3 5000
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 0 0 3 10 0 2160 1970 47.8
carr_cfg 1 0 3 10 0 2160 1970 47.8
carr_cfg 2 0 3 10 0 2160 1970 47.8
carr_cfg 3 0 3 10 0 2160 1970 47.8
carr_activate 0
carr_activate 1
carr_activate 2
carr_activate 3
set_power_control_enable 1

# ��ȡ 4 ��ͨ�� DPD ״̬
 AdrvGetDpdStatus 0 1
 AdrvGetDpdStatus 0 2
 AdrvGetDpdStatus 0 4
 AdrvGetDpdStatus 0 8
 #############################################################################