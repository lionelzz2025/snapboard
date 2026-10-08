@echo off
setlocal
chcp 65001 >nul
title SnapBoard Dev Server
cd /d "%~dp0"

where npm >nul 2>nul
if errorlevel 1 (
  echo [SnapBoard] 未找到 npm，请先安装 Node.js 18 或更高版本。
  pause
  exit /b 1
)

if not exist "node_modules\vite\bin\vite.js" (
  echo [SnapBoard] 首次启动，正在安装依赖...
  call npm install
  if errorlevel 1 goto :error
)

echo [SnapBoard] 设计器地址：http://127.0.0.1:5173/design
echo [SnapBoard] 官网地址：  http://127.0.0.1:5173/
echo [SnapBoard] 按 Ctrl+C 可停止服务。
start "" "http://127.0.0.1:5173/design"
call npm run dev
exit /b 0

:error
echo.
echo [SnapBoard] 启动失败，请确认 Node.js 版本和网络连接。
pause
exit /b 1
