@echo off
echo Testing Crop Insurance dApp Setup...
echo.

echo Checking Node.js version...
node --version
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed or not in PATH
    pause
    exit /b 1
)

echo.
echo Checking npm version...
npm --version
if %errorlevel% neq 0 (
    echo ERROR: npm is not installed or not in PATH
    pause
    exit /b 1
)

echo.
echo Testing Backend Dependencies...
cd backend
if not exist "node_modules" (
    echo Backend node_modules not found. Installing...
    npm install
    if %errorlevel% neq 0 (
        echo ERROR: Failed to install backend dependencies
        pause
        exit /b 1
    )
) else (
    echo Backend dependencies found.
)

echo.
echo Testing Frontend Dependencies...
cd ../crop-insurance-client
if not exist "node_modules" (
    echo Frontend node_modules not found. Installing...
    npm install
    if %errorlevel% neq 0 (
        echo ERROR: Failed to install frontend dependencies
        pause
        exit /b 1
    )
) else (
    echo Frontend dependencies found.
)

echo.
echo Testing Backend Server...
cd ../backend
echo Starting backend server for 5 seconds...
start /B npm start
timeout /t 5 /nobreak > nul
taskkill /F /IM node.exe > nul 2>&1

echo.
echo Testing Frontend Build...
cd ../crop-insurance-client
echo Building frontend...
npm run build
if %errorlevel% neq 0 (
    echo ERROR: Frontend build failed
    pause
    exit /b 1
)

echo.
echo ✅ All tests passed! Your setup is ready.
echo.
echo Next steps:
echo 1. Make sure MongoDB is running
echo 2. Run start-app.bat to start both servers
echo 3. Open http://localhost:3000 in your browser
echo.
pause
