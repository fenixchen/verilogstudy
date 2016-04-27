SET debussy=D:\Debussy\bin\Debussy.exe
SET iverlog=iverilog.exe
SET vvp=vvp.exe
set rtl_f=rtl.iverlog.f
%iverlog% -o a.out -f %rtl_f%
%vvp% a.out
%debussy% -f %rtl_f% -2001