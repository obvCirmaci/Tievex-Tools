@echo off
cls
Title Tievex Upscaler Installer
:menu      
echo ----------------------------------------------------------------------
:::
:::
:::                        _______                    
:::                       /_  __(_)__ _   _____  _  __
:::                        / / / / _ \ | / / _ \| |/_/
:::                       / / / /  __/ |/ /  __/>  <  
:::                      /_/ /_/\___/|___/\___/_/|_|  
:::                             
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo ---------------------------------------------------------------------
echo.      	
echo     *************************************************************
echo     **** Enter "1" To install: Nvidia Upscaler (NVENC)       ****
echo     **** Enter "2" To install: AMD Upscaler (AMF)            ****
echo     **** Enter "3" To install: Intel Quicksync Upscaler      ****
echo     **** Enter "4" To Install: (ALL CPUs) CPU Upscaler       ****
echo     *************************************************************
echo.
:choice
set /P asw="Enter the corresponding number from the menu to start: "
if /i "%asw%"=="1" goto:nvidia
if /i "%asw%"=="2" goto:AMD
if /i "%asw%"=="3" goto:intel
if /i "%asw%"=="4" goto:cpu
if else goto:menu
echo.

:nvidia
cls
Title Installing Scoop
powershell "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell "irm get.scoop.sh | iex"
cls
Title Installing FFMPEG
powershell "scoop bucket add main"
powershell "scoop install ffmpeg"
cls 
Title Installing Tievex Upscaler (For NVIDIA GPUS)
powershell "(irm https://raw.githubusercontent.com/obvCirmaci/Tievex-Tools/main/Upscaler/TievexUpscalerNVIDIA.cmd) | Out-File (Join-Path ([Environment]::GetFolderPath('SendTo')) TievexUpscalerNvidia.cmd) -Encoding ASCII"
goto:end

:AMD
Title Installing Scoop
powershell "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell "irm get.scoop.sh | iex"
cls
Title Installing FFMPEG
powershell "scoop bucket add main"
powershell "scoop install ffmpeg"
cls 
Title Installing Tievex Upscaler (for AMD GPUS)
powershell "(irm https://raw.githubusercontent.com/obvCirmaci/Tievex-Tools/main/Upscaler/TievexUpscalerAMD.cmd) | Out-File (Join-Path ([Environment]::GetFolderPath('SendTo')) TievexUpscalerAMD.cmd) -Encoding ASCII"
goto:end

:intel
Title Installing Scoop
powershell "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell "irm get.scoop.sh | iex"
cls
Title Installing FFMPEG
powershell "scoop bucket add main"
powershell "scoop install ffmpeg"
cls 
Title Installing Tievex Upscaler (for Intel Quicksync)
powershell "(irm https://raw.githubusercontent.com/obvCirmaci/Tievex-Tools/main/Upscaler/TievexUpscalerIntelIGPU.cmd) | Out-File (Join-Path ([Environment]::GetFolderPath('SendTo')) TievexUpscalerINTEL.cmd) -Encoding ASCII"
goto:end

:CPU
Title Installing Scoop
powershell "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell "irm get.scoop.sh | iex"
cls
Title Installing FFMPEG
powershell "scoop bucket add main"
powershell "scoop install ffmpeg"
cls 
Title Installing Tievex Upscaler (for AMD GPUS)
powershell "(irm https://raw.githubusercontent.com/obvCirmaci/Tievex-Tools/main/Upscaler/TievexUpscalerCPU.cmd) | Out-File (Join-Path ([Environment]::GetFolderPath('SendTo')) TievexUpscalerCPU.cmd) -Encoding ASCII"
goto:end

:end
echo The Upscaler has been succesfully installed into the "Send To" folder, if it isn't there and / something went wrong, please install it manually or contact me.
pause
exit