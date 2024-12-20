# login in
root
admin
ir_kill
cli
admin


# 网分测试
AdrvSetRxTxEnable 0 0x5f 0xf
write_fpgareg 0xd60 0x5
write_fpgareg 0xd61 0x5
write_fpgareg 0xd62 0x5
write_fpgareg 0xd5e 0x5
# 1 下行 2 上行
set_pa_mode 0 0 1
set_pa_mode 0 0 2
set_pa_mode 0 1 1
set_pa_mode 0 1 2
set_pa_mode 0 2 1
set_pa_mode 0 2 2
set_pa_mode 0 3 1
set_pa_mode 0 3 2


# 频谱测试
# 通道0配置
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 0 0 2 100 1 3550 3550 46 5 1 0.7 0.7 6 4 4
carr_activate 0
set_power_control_enable 1
set_tx_att 0 10000
AdrvSetTxTestTone 0 1 1 -60 1

# 通道1配置
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 1 0 2 100 1 3550 3550 46 5 1 0.7 0.7 6 4 4
carr_activate 1
set_power_control_enable 1
set_tx_att 1 10000
cli AdrvSetTxTestTone 0 2 1 -60 1

# 通道2配置
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 2 0 2 100 1 3550 3550 46 5 1 0.7 0.7 6 4 4
carr_activate 2
set_power_control_enable 1
set_tx_att 2 10000
cli AdrvSetTxTestTone 0 4 1 57.5 1

# 通道3配置
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 3 0 2 100 1 3550 3550 46 5 1 0.7 0.7 6 4 4
carr_activate 3
set_power_control_enable 1
set_tx_att 3 10000
cli AdrvSetTxTestTone 0 8 1 57.5 1


# 信号源测试
set_rx_att 0 10000
set_rx_att 1 10000
set_rx_att 2 10000
set_rx_att 3 10000

set_fb_att 0 10000
set_fb_att 2 10000


tx att 10 dig -18dbfs  -8dbm 正负1

tx att 8  dig -15dbfs  -3dbm
