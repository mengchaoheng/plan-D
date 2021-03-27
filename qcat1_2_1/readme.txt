将qcat1_2_1的内核函数修改成各种不同用途的m代码，再进一步转c代码。
注意内存问题，内存不足会导致程序卡死。


-----------------修改记录--------------------------------
1.源码下载后打开提示mdl转slx格式，确认之后qcatlib.mdl转为qcatlib.slx，并产生qcatlib.mdl.r13 (sp1)，qcatlib.mdl.r2018a为中间文件
2.新增dir_alloc_.m。修改dir_alloc.m，增加判断exitflag~=1部分