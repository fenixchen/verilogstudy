::�رջ���
::@ECHO OFF
::�������·��
SET debussy=D:\Debussy\bin\Debussy.exe
SET vsim=D:\modeltech_10.0c\win32\vsim.exe
::ModelSim Command
%vsim% -c -do sim.do
::ɾ��ModelSim���ɵ�����ļ�
RD work /s /q
DEL transcript vsim.wlf /q
::Debussy Command
%debussy% -f rtl.f -ssf wave.fsdb -2001
::ɾ�������ļ�
DEL wave.fsdb /q
::ɾ��Debussy���ɵ�����ļ�
RD Debussy.exeLog  /s /q
DEL debussy.rc /q
::�˳�������
::EXIT