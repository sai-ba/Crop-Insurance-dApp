@echo off
echo Installing Crop Insurance dApp Dependencies...
echo.

echo Installing Backend Dependencies...
cd backend
npm install
if %errorlevel% neq 0 (
    echo Error installing backend dependencies!
    pause
    exit /b 1
)

echo.
echo Installing Frontend Dependencies...
cd ../crop-insurance-client
npm install
if %errorlevel% neq 0 (
    echo Error installing frontend dependencies!
    pause
    exit /b 1
)

echo.
echo All dependencies installed successfully!
echo.
echo Next steps:
echo 1. Make sure MongoDB is running
echo 2. Run start-app.bat to start both servers
echo 3. Open http://localhost:3000 in your browser
echo.
pause
