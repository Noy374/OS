@echo off

echo Enter directory name:
set /p directoryName=

echo Processing directory %directoryName%

for /R %directoryName% %%f in (*) do (
  if %%~zf LEQ 1024 (
    echo File Name: %%f
    echo File Size: %%~zf bytes
    echo ---------------
  )
)
pause