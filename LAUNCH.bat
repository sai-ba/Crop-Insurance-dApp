@echo off
title Crop Insurance dApp - One-Click Launcher
color 0A

echo.
echo ========================================
echo    🌾 Crop Insurance dApp Launcher
echo ========================================
echo.

echo 🚀 Starting setup process...
echo.

:: Check if Node.js is installed
echo [1/5] Checking Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed!
    echo    Please install Node.js from https://nodejs.org/
    echo    Then run this script again.
    pause
    exit /b 1
) else (
    echo ✅ Node.js found
)

:: Install dependencies if needed
echo.
echo [2/5] Checking dependencies...
if not exist "backend\node_modules" (
    echo 📦 Installing backend dependencies...
    cd backend
    npm install --silent
    if %errorlevel% neq 0 (
        echo ❌ Failed to install backend dependencies
        pause
        exit /b 1
    )
    cd ..
) else (
    echo ✅ Backend dependencies found
)

if not exist "crop-insurance-client\node_modules" (
    echo 📦 Installing frontend dependencies...
    cd crop-insurance-client
    npm install --silent
    if %errorlevel% neq 0 (
        echo ❌ Failed to install frontend dependencies
        pause
        exit /b 1
    )
    cd ..
) else (
    echo ✅ Frontend dependencies found
)

:: Check environment files
echo.
echo [3/5] Checking environment files...
if not exist "backend\.env" (
    echo ⚠️  Backend .env file not found
    echo    Creating default backend .env file...
    echo PORT=4000> backend\.env
    echo MONGODB_URI=mongodb://localhost:27017/crop_insurance_dev>> backend\.env
    echo ✅ Created backend .env file
) else (
    echo ✅ Backend .env file found
)

if not exist "crop-insurance-client\.env" (
    echo ⚠️  Frontend .env file not found
    echo    Creating default frontend .env file...
    echo REACT_APP_API_BASE=http://localhost:4000> crop-insurance-client\.env
    echo ✅ Created frontend .env file
) else (
    echo ✅ Frontend .env file found
)

:: Test backend
echo.
echo [4/5] Testing backend...
cd backend
start /B npm start >nul 2>&1
timeout /t 5 /nobreak >nul

curl -s http://localhost:4000/api/health >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Backend not responding (MongoDB may not be running)
    echo    This is okay for demo mode testing
) else (
    echo ✅ Backend is running
)

taskkill /F /IM node.exe >nul 2>&1
cd ..

:: Start the application
echo.
echo [5/5] Starting Crop Insurance dApp...
echo.

echo 🎉 Launching your dApp!
echo.
echo 📱 Frontend: http://localhost:3000
echo 🔧 Backend:  http://localhost:4000
echo.
echo 💡 Tips:
echo    - Install Petra wallet for real transactions
echo    - Use Demo Mode for testing
echo    - Check browser console (F12) for any issues
echo.

:: Start both servers
echo Starting servers...
start "Backend Server" cmd /k "cd backend && npm start"
timeout /t 3 /nobreak >nul
start "Frontend Server" cmd /k "cd crop-insurance-client && npm start"

echo.
echo ✅ Your Crop Insurance dApp is starting!
echo.
echo 🌐 Opening browser...
timeout /t 5 /nobreak >nul
start http://localhost:3000

echo.
echo 🎊 Enjoy your dApp!
echo.
echo Press any key to exit this launcher...
pause >nul
