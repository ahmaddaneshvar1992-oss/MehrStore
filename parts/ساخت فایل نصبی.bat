@echo off
chcp 65001 >nul
title ساخت فایل نصبی فروشگاه مهر
cd /d "%~dp0"
echo ==============================================
echo    ساخت فایل نصبی فروشگاه مهر از 5 بخش دانلودی
echo ==============================================
echo.
if not exist "MehrStore-Setup.exe.part1" goto missing
if not exist "MehrStore-Setup.exe.part2" goto missing
if not exist "MehrStore-Setup.exe.part3" goto missing
if not exist "MehrStore-Setup.exe.part4" goto missing
if not exist "MehrStore-Setup.exe.part5" goto missing
copy /b "MehrStore-Setup.exe.part1"+"MehrStore-Setup.exe.part2"+"MehrStore-Setup.exe.part3"+"MehrStore-Setup.exe.part4"+"MehrStore-Setup.exe.part5" "MehrStore-Setup.exe" >nul
if errorlevel 1 goto error
for %%F in ("MehrStore-Setup.exe") do set SIZE=%%~zF
if not "%SIZE%"=="40224378" goto badsize
echo.
echo  [تایید] فایل نصبی با موفقیت ساخته شد: MehrStore-Setup.exe
echo.
echo  حالا روی فایل MehrStore-Setup.exe دوبار کلیک کنید تا نصب شود.
echo  اگر ویندوز پیام SmartScreen داد: More info و سپس Run anyway
echo.
del "MehrStore-Setup.exe.part1" "MehrStore-Setup.exe.part2" "MehrStore-Setup.exe.part3" "MehrStore-Setup.exe.part4" "MehrStore-Setup.exe.part5" >nul 2>&1
echo  بخش‌های دانلودی هم پاک شدند.
echo.
pause
exit /b 0

:missing
echo.
echo  [خطا] باید همه 5 بخش دانلود شده در همین پوشه کنار این فایل باشند.
echo  همه بخش‌ها را در یک پوشه بریزید و دوباره اجرا کنید.
echo.
pause
exit /b 1

:error
echo.
echo  [خطا] هنگام ساخت فایل مشکل پیش آمد. دوباره تلاش کنید.
echo.
pause
exit /b 1

:badsize
echo.
echo  [خطا] اندازه فایل ساخته شده درست نیست.
echo  احتمالاً یکی از بخش‌ها ناقص دانلود شده؛ لطفاً بخش‌ها را دوباره دانلود کنید.
echo.
pause
exit /b 1
