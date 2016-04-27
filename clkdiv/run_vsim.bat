::关闭回显
::@ECHO OFF
::设置软件路径
SET debussy=D:\Debussy\bin\Debussy.exe
SET vsim=D:\modeltech_10.0c\win32\vsim.exe
::ModelSim Command
%vsim% -c -do sim.do
::删除ModelSim生成的相关文件
RD work /s /q
DEL transcript vsim.wlf /q
::Debussy Command
%debussy% -f rtl.f -ssf wave.fsdb -2001
::删除波形文件
DEL wave.fsdb /q
::删除Debussy生成的相关文件
RD Debussy.exeLog  /s /q
DEL debussy.rc /q
::退出命令行
::EXIT