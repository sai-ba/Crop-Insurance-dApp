@echo off
echo Starting Crop Insurance dApp...
echo.

echo Starting Backend Server...
cd backend
start "Backend Server" cmd /k "npm start"

echo.
echo Starting Frontend Server...
cd ../crop-insurance-client
start "Frontend Server" cmd /k "npm start"

echo.
echo Both servers are starting...
echo Backend will be available at: http://localhost:4000
echo Frontend will be available at: http://localhost:3000
echo.
echo Press any key to exit this script...
pause > nul
