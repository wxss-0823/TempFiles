+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+                                                                         +
+      nBCCP��PDT����ģʽ���س��򷽷����޸�ʱ��2017-11-3����骣�          +
+                                                                         +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ע�⣺
��1������1~10����������Ϊ����boot��vmlinux������vmlinux��flash�����ķ�����
��2��������������Ϊ��flash�����Ҳ���Ҫ����boot��vmlinux���ӵ�11����ʼ����
��3�������ϸ�λ�����൱����������λ��U4����������½ǡ�

=====================���������ӡ�ڴ��ڽ�����==================
1.���ô��ڣ�������Ϊ115200��ע����ת�Ӱ����������½����豸��BSR2������

2.CP���ϵ磬�������´�ӡʱ����ʱ��Ļ��ͣ���룩���Ͻ����س�
DTT0: Failed init!
DTT1: Failed init!
MMC: 

3.�������½��������Ҫ����С��IP������Exit cmd��Ӧ���֣���һ����������ʾΪ7����Ȼ�󰴻س�
###################### User Menu for NBCCP#####################
[1] Boot image form net
[2] Boot image form flash
[3] Boot image from SD
[4] Burn uboot form net
[5] Burn stage 1&2 uboot form net
[6] Burn image from net
[7] Exit cmd

4.���֡�Octeon sff7000(ram)# ����ӡʱ���������������벢�س�������serverip�Ǳ��ص���ip��ipaddr��CP��ip��
��������ͬһ���Ρ�
setenv ethact octeth17
setenv ethprime octeth1
setenv serverip 192.168.0.98
setenv ipaddr 192.168.0.100
ping 192.168.0.98 
saveenv
--ע������ping 192.168.0.98ʱ�����������´�ӡ����ʾ���ӿ�pingͨ����IP
Using octeth1 device
host 192.168.0.98 is alive
reset  //�����������������


5.�ظ���2��

6.�������½��������Ҫ����boot������Burn uboot form net��Ӧ���֣���һ����������ʾΪ4����Ȼ�󰴻س�
###################### User Menu for NBCCP#####################
[1] Boot image form net
[2] Boot image form flash
[3] Boot image from SD
[4] Burn uboot form net
[5] Burn stage 1&2 uboot form net
[6] Burn image from net
[7] Exit cmd

7.�������´�ӡ�����ֳ��ֵ�6������ʱ������Exit cmd��Ӧ���֣�Ȼ������reset��������
Enter your Selection:4
tftp u-boot-octeon_sff7000.bin
Using octeth1 device
TFTP from server 192.168.0.119; our IP address is 192.168.0.110
Filename 'u-boot-octeon_sff7000.bin'.
Load address: 0x20000000
Loading: octeth1: Unknown PHY compatibility
Up 1000 Mbps Full duplex (port 16) (SGMII)
##################################################
         2.5 MiB/s
done
Bytes transferred = 1536232 (1770e8 hex)
SF: Detected MX25L12805 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
SF: 1048576 bytes @ 0x100000 Erased: OK
1048576 bytes written, 487656 bytes skipped in 7.659s, speed 205285 B/s

8.�ظ���2��

9.�������½��������Ҫ��vmlinux
�µ�flash�У�����Burn image from net��Ӧ���֣���һ����������ʾΪ6����Ȼ�󰴻س�
###################### User Menu for NBCCP#####################
[1] Boot image form net
[2] Boot image form flash
[3] Boot image from SD
[4] Burn uboot form net
[5] Burn stage 1&2 uboot form net
[6] Burn image from net
[7] Exit cmd

10.������Ҫ�����ӣ����������´�ӡ�����ֻص���9���Ľ���ʱ������2��Boot image form flash��
Erased 560 sectors
Copy to Flash... done

11.���ӻ�����������ֱ���������´�ӡ
BusyBox v1.20.2 (2017-03-18 15:32:02 CST) built-in shell (ash)
Enter 'help' for a list of built-in commands.

~ # 
Ȼ������������������֡�
*********************** BSEY boot end. *************************��������ӡ��ֻ��Ҫ��������������
mount /dev/mtdblock2 /mnt

���MOUNTʧ�ܣ�

1.
cd /mnt/image/
insmod cpld.ko
insmod dm642.ko
/sbin/mdev -s
schedtool -a 0x02 -e ./LINUX_BSEYIMAGE
ifconfig eth1 192.168.0.112 up  //���ð���IP
ping 192.168.0.119              //��֤�Ƿ���pingͨ����


sync



++++++++++++++++++++++++++++++++++++++++++++
12.����Ϊ���س�������ڴ��ڽ��������룬�����CP��������ɺ����
��1����pingһ�µ���IP����ping��ͨ�����롰ifconfig eth1 192.168.0.110 up������pingһ�µ���IP
��2���ڴ������롰cd /mnt/image�����л���/mnt/imageĿ¼�����޴�Ŀ¼�����롰cd/mnt������/mntĿ¼�������롰mkdir image������image�ļ���
��3��������������������س���
tftp -gr cpld.ko 192.168.0.98
tftp -gr dm642.ko 192.168.0.98
tftp -gr PDT_DSPIMAGE.out 192.168.0.98
tftp -gr PDT_FPGA.rbf 192.168.0.98
tftp -gr LINUX_BSEYIMAGE 192.168.0.98 -b 20000
����������롰chmod 777 LINUX_BSEYIMAGE���޸�LINUX_BSEYIMAGE�������롰sync��ͬ��һ�¡�

��3�����롰cd /mnt���ص�/mntĿ¼��
tftp -gr etra.sh 192.168.0.98
����������롰chmod 777 etra.sh���������롰sync��ͬ��һ��
��4�����롰reboot������CP��

��5��������ɺ������ڲ�ͨ��������������
ifconfig eth1 192.168.0.112 up  //���ð���IP
ping 192.168.0.119

ע�⣬��CP���Ѿ�������ɣ�����LINUX_BSEYIMAGEʱ�����������²���
ps �����̣���LINUX_BSEYIMAGE�Ľ��̺�
kill -9 ��LINUX_BSEYIMAGE�Ľ��̺ţ�   //����LINUX_BSEYIMAGE����
++++++++++++++++++++++++++++++++++++++++++++


============================��������������������=========================
��¼���ӣ����롰show-runversion������TR��İ汾�����£�
VxWorks Image    : 1.0.0.0_test
FPGA Software    : 1.0.0.1
CPLD Software    : 0.0.0.1
BOOT Software    : 2.2.2.2
FPGA120 Software : 1.0.0.1
DSP Software     : 1.0.1.1

:SHOW-TASK-INFO;  //���ϲ�����
-------------------------------------

//���ز����ز���
:stop-test;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=22;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:sET-BBP-PARAM:regid=44,value=0x34a;
:set-bbp-param:regid=36,value=0x4ce;
:set-bbp-param:regid=127,value=0x100;
:start-count-error:sample=300,time=1;


//���ز����ز���
:stop-test;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=22;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:sET-BBP-PARAM:regid=44,value=0x34a;
:set-bbp-param:regid=36,value=0x4ce;   
:set-bbp-param:regid=127,value=0x100;
:start-count-error:sample=300,time=1;

//���ز����ز���
:stop-test;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=22;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:sET-BBP-PARAM:regid=44,value=0x34a;
:set-bbp-param:regid=36,value=0x4ce;   
:set-bbp-param:regid=127,value=0x100;  //LOOP��־λ
:start-count-error:sample=300,time=1;

//���ز����ز���
:stop-test;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=22;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:sET-BBP-PARAM:regid=44,value=0x34a;
:set-bbp-param:regid=36,value=0x4ce;   
:set-bbp-param:regid=127,value=0x100;  
:start-count-error:sample=300,time=1;



:stop-test;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=28;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:set-bbp-param:regid=36,value=0x4ce;   
:set-bbp-param:regid=127,value=0x100;  
:start-count-error:sample=300,time=1;
-------------------------------------

//���ز�����
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384.5;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=45;




:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=366.2;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=47;



:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=361;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;




:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=366;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

//���ز�����
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384;
:set-trpa-freq:carrierid=2,freq=384.5;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;



:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384;
:set-trpa-freq:carrierid=2,freq=384.5;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363;
:set-trpa-freq:carrierid=2,freq=363.15;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;


:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=364.9875;
:set-trpa-freq:carrierid=2,freq=365.9875;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

//���ز�����

:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384;
:set-trpa-freq:carrierid=2,freq=384.5;
:set-trpa-freq:carrierid=3,freq=385;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;




:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:set-trpa-freq:carrierid=1,freq=365.4875;
:set-trpa-freq:carrierid=2,freq=365.7375;
:set-trpa-freq:carrierid=3,freq=365.9875;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;



:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:set-trpa-freq:carrierid=1,freq=361.0125;
:set-trpa-freq:carrierid=2,freq=361.2625;
:set-trpa-freq:carrierid=3,freq=361.5125;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

//���ز�����
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=382.0125;
:set-trpa-freq:carrierid=2,freq=382.0125;
:set-trpa-freq:carrierid=3,freq=382.0125;
:set-trpa-freq:carrierid=4,freq=382.0125;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=45;

:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=382;
:set-trpa-freq:carrierid=2,freq=382.25;
:set-trpa-freq:carrierid=3,freq=382.5;
:set-trpa-freq:carrierid=4,freq=382.75;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

-------------------------------------

//���ز�����
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=360.8125;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;


:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363.5;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;


:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=366.1875;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;

//���ز�����
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363.5125;
:set-trpa-freq:carrierid=2,freq=364.5125;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;

//���ز�����
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363.5125;
:set-trpa-freq:carrierid=2,freq=364.5125;
:set-trpa-freq:carrierid=3,freq=365.5125;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;

//���ز�����
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=386.9875;
:set-trpa-freq:carrierid=2,freq=386.9875;
:set-trpa-freq:carrierid=3,freq=386.9875;
:set-trpa-freq:carrierid=4,freq=386.9875;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;


:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=382.5;
:set-trpa-freq:carrierid=2,freq=383.5;
:set-trpa-freq:carrierid=3,freq=384.5;
:set-trpa-freq:carrierid=4,freq=385.5;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;

SOUR:POW:LEV:IMM:AMPL -110 dBm
SOUR:FREQ 355.5MHz


:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384.5;
:set-trpa-freq:carrierid=2,freq=384.5;
:set-trpa-freq:carrierid=3,freq=384.5;
:set-trpa-freq:carrierid=4,freq=384.5;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;


-------------------------------------

//��������ô���������������ϴδ���ʲô״̬��
:stop-test;
:set-trpa-paswitch:value=0;
:SET-trpa-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363.5;
:START-tx-t1;
-------------------------------------

:get-bbp-param:regid=66;                 
:get-bbp-param:regid=127;              //����������0��Ĭ�ϣ������ز�����1
:get-bbp-param:regid=95;               //����������1��Ĭ�ϣ������ز�����0
:GET-BBP-PARAM:regid=44;                            
:watch-debug:level=1,fid=20;           //��MAC��ӡ
:watch-debug:level=1,fid=56;           //DSP��ӡ
============================================================================


TR�崮�����
��������źŷ���
[root@zynq /]# cli
cli V1.0 built on Oct 14 2016,02:56:22
dtru> powercalc 0 100000

PA��ѹ��ѯ
dtru> get_pavds
get_pavds(0) = 47.394 ok !

cd  /mnt/flash/patch/bin
tftp 192.168.0.190  -gr  sw_app

cd /mnt/flash/conf
tftp 192.168.0.119  -gr .info.db





:SENS:ACP:OFFS:LIST:FREQ 12.5KHz,25KHz
:SENSe:BANDwidth:RESolution 300Hz
:SENSe:BANDwidth:VIDeo 1KHz




