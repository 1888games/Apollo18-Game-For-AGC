
@echo off

taskkill /F /IM yaAGC.exe 2>nul
taskkill /F /IM yaDSKY2.exe 2>nul

rem === Paths ===
set "SRC=C:\Github\AGC\Mastermoon"
set "OUT=%SRC%\bin"
set "AGC_BIN=%SRC%\..\bin"

rem === Copy sources ===
copy "%SRC%\Main.agc" "%OUT%\" >nul

rem === flatten all .agc files from all subfolders ===
for /r "%SRC%\Scripts" %%F in (*.agc) do (
    copy "%%F" "%OUT%\" >nul
)

rem === Build inside build folder ===
cd /d "%OUT%"

@echo
"%AGC_BIN%\yaYUL.exe" --html "Main.agc" > "Main.lst"
@echo off

move "Main.agc.bin" "Main.bin"
move "Main.agc.symtab" "Main.bin.symtab"

pushd "..\..\Resources"
call simulate_master2.bat
popd

