# set mannual mode
set_pa_proto_debugmode 1

# reset gate voltage
set_pa_vgs 0 0 0 0
set_pa_vgs 0 0 1 0
set_pa_vgs 0 0 2 0
set_pa_vgs 0 0 3 0

set_pa_vgs 0 1 0 0
set_pa_vgs 0 1 1 0
set_pa_vgs 0 1 2 0
set_pa_vgs 0 1 3 0

set_pa_vgs 0 2 0 0
set_pa_vgs 0 2 1 0
set_pa_vgs 0 2 2 0
set_pa_vgs 0 2 3 0

set_pa_vgs 0 3 0 0
set_pa_vgs 0 3 1 0
set_pa_vgs 0 3 2 0
set_pa_vgs 0 3 3 0

# procedure
��һ��������3 ��������1.5V��ÿ������0.03��ȡ�����������ﵽ80mA��ÿ�����ӻ��߼���0.005����������110mA 
�ڶ���������2 Ϊ1.7 ÿ�����ӻ����0.005����������130mA
������������1 ��������1.5V��ÿ������0.03��ȡ�����������ﵽ900mA��ÿ�����ӻ��߼���0.005����������1130mA
���Ĳ�������0 Ϊ0.95

###################################
# CH0
set_pa_mode 0 0 1

# SET
set_pa_vgs 0 0 3 2.33
set_pa_vgs 0 0 2 1.9
set_pa_vgs 0 0 1 2.215
set_pa_vgs 0 0 0 0.95

# SAVE�����£����£����£�
save_pa_normal_vgs 0 0 3 30 2.33
save_pa_normal_vgs 0 0 2 30 1.9
save_pa_normal_vgs 0 0 1 30 2.215
save_pa_normal_vgs 0 0 0 30 0.95
set_pa_mode 0 0 0
###################################

###################################
# CH1
set_pa_mode 0 1 1

# SET
set_pa_vgs 0 1 3 2.34
set_pa_vgs 0 1 2 1.9
set_pa_vgs 0 1 1 2.204
set_pa_vgs 0 1 0 0.95

# SAVE�����£����£����£�
save_pa_normal_vgs 0 1 3 31 2.34
save_pa_normal_vgs 0 1 2 31 1.9
save_pa_normal_vgs 0 1 1 31 2.204
save_pa_normal_vgs 0 1 0 31 0.95
set_pa_mode 0 1 0
###################################

###################################
# CH2
set_pa_mode 0 2 1

# SET
set_pa_vgs 0 2 3 2.33
set_pa_vgs 0 2 2 1.89
set_pa_vgs 0 2 1 2.214
set_pa_vgs 0 2 0 0.95

# SAVE�����£����£����£�
save_pa_normal_vgs 0 2 3 31 2.33
save_pa_normal_vgs 0 2 2 31 1.89
save_pa_normal_vgs 0 2 1 31 2.214
save_pa_normal_vgs 0 2 0 31 0.95
set_pa_mode 0 2 0
###################################

###################################
# CH3
set_pa_mode 0 3 1

# SET
set_pa_vgs 0 3 3 2.33
set_pa_vgs 0 3 2 1.89
set_pa_vgs 0 3 1 2.204
set_pa_vgs 0 3 0 0.95

# SAVE�����£����£����£�
save_pa_normal_vgs 0 3 3 31 2.33
save_pa_normal_vgs 0 3 2 31 1.89
save_pa_normal_vgs 0 3 1 31 2.204
save_pa_normal_vgs 0 3 0 31 0.95
set_pa_mode 0 3 0
###################################
