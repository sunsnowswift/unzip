::循环脚本所在目录的所有一级子目录并将每个子目录的所有zip文件解压缩并删除

@echo off
::请先安装7-zip,设置7-zip的运行路径
set zpath=C:\Program Files\7-Zip\7z.exe
::当前路径
set srcdir=%cd%
for /d %%i in (*) do (
	::进入子目录
	cd /d "%srcdir%\%%i"
	::循环目录下的zip文件并解压,解压后删除zip文件
	for /f %%j in ('dir *.zip /s /b') do (
	::解压
    	start "" "%zpath%" x "%%j" -y -aos -o"%%~dpi"
    	::删除
    	del "%%j"
	)
	::退出子目录
	cd ".."
)
pause
