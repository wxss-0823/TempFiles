#################
����ǰ�ò���
cli AdrvSetTxRadioCtrlCfg 0 1 1
cli AdrvSetTxRadioCtrlCfg 0 2 1
cli AdrvSetTxRadioCtrlCfg 0 4 1
cli AdrvSetTxRadioCtrlCfg 0 8 1
cli AdrvSetRxRadioCtrlCfg 0 1 1
cli AdrvSetRxRadioCtrlCfg 0 2 1
cli AdrvSetRxRadioCtrlCfg 0 4 1
cli AdrvSetRxRadioCtrlCfg 0 8 1


R2401-N1M-60W4C
���м��������ԣ�CH0����

set_tx_pll 0 2100
AdrvSetTxTestTone 0 1 1 10 0
set_pa_mode 0 0 1
set_tx_att 0 6000


���м��������ԣ�CH1����

set_tx_pll 1 2100
AdrvSetTxTestTone 0 2 1 10 0
set_pa_mode 0 1 1
set_tx_att 1 6000


���в��ԣ�CH2����

set_tx_pll 2 2100
AdrvSetTxTestTone 0 4 1 10 0
set_pa_mode 0 2 1
set_tx_att 2 6000


���в��ԣ�CH3����

set_tx_pll 3 2100
AdrvSetTxTestTone 0 8 1 10 0
set_pa_mode 0 3 1
set_tx_att 3 6000


�������ԣ�CH0����

set_fb_att 0 15000
write_fpgareg 0x5C 0x0
AdrvSetTxToOrxMapping 0 0x10 1
AdrvSetRxTxEnable 0 0x10 0
AdrvGetRxDecPower 0 0x10


�������ԣ�CH1����

set_fb_att 1 15000
write_fpgareg 0x5C 0x0
AdrvSetTxToOrxMapping 0 0x10 2
AdrvSetRxTxEnable 0 0x10 0
AdrvGetRxDecPower 0 0x10


�������ԣ�CH2����

set_fb_att 2 15000
write_fpgareg 0x5C 0x0
AdrvSetTxToOrxMapping 0 0x40 4
AdrvSetRxTxEnable 0 0x40 0
AdrvGetRxDecPower 0 0x40


�������ԣ�CH3����

set_fb_att 3 15000
write_fpgareg 0x5C 0x0
AdrvSetTxToOrxMapping 0 0x40 8
AdrvSetRxTxEnable 0 0x40 0
AdrvGetRxDecPower 0 0x40


���в��ԣ�CH0����

set_tx_pll 0 1910
set_pa_mode 0 0 2
AdrvSetRxTxEnable 0 0x1 0
set_rx_att 0 10000
AdrvGetRxDecPower 0 1


���в��ԣ�CH1����

set_tx_pll 1 1910
set_pa_mode 0 1 2
AdrvSetRxTxEnable 0 0x2 0
set_rx_att 1 10000
AdrvGetRxDecPower 0 2


���в��ԣ�CH2����

set_tx_pll 2 1910
set_pa_mode 0 2 2
AdrvSetRxTxEnable 0 0x4 0
set_rx_att 2 10000
AdrvGetRxDecPower 0 4


���в��ԣ�CH3����

set_tx_pll 3 1910
set_pa_mode 0 3 2
AdrvSetRxTxEnable 0 0x8 0
set_rx_att 3 10000
AdrvGetRxDecPower 0 8