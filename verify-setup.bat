@echo off
echo ========================================
echo   Crop Insurance dApp - Setup Verification
echo ========================================
echo.

echo [1/6] Checking Node.js and npm...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo    Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
) else (
    echo ✅ Node.js is installed
)

npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed or not in PATH
    pause
    exit /b 1
) else (
    echo ✅ npm is installed
)

echo.
echo [2/6] Checking dependencies...
if not exist "backend\node_modules" (
    echo ❌ Backend dependencies not installed
    echo    Run: setup.bat
    pause
    exit /b 1
) else (
    echo ✅ Backend dependencies found
)

if not exist "crop-insurance-client\node_modules" (
    echo ❌ Frontend dependencies not installed
    echo    Run: setup.bat
    pause
    exit /b 1
) else (
    echo ✅ Frontend dependencies found
)

echo.
echo [3/6] Testing backend server...
cd backend
start /B npm start >nul 2>&1
timeout /t 3 /nobreak >nul

curl -s http://localhost:4000/api/health >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Backend server is not responding
    echo    Check if MongoDB is running
    taskkill /F /IM node.exe >nul 2>&1
    pause
    exit /b 1
) else (
    echo ✅ Backend server is running
)

taskkill /F /IM node.exe >nul 2>&1
cd ..

echo.
echo [4/6] Testing frontend build...
cd crop-insurance-client
npm run build >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Frontend build failed
    cd ..
    pause
    exit /b 1
) else (
    echo ✅ Frontend builds successfully
)
cd ..

echo.
echo [5/6] Checking environment files...
if not exist "backend\.env" (
    echo ⚠️  Backend .env file not found
    echo    Create backend\.env with:
    echo    PORT=4000
    echo    MONGODB_URI=mongodb://localhost:27017/crop_insurance_dev
) else (
    echo ✅ Backend .env file found
)

if not exist "crop-insurance-client\.env" (
    echo ⚠️  Frontend .env file not found
    echo    Create crop-insurance-client\.env with:
    echo    REACT_APP_API_BASE=http://localhost:4000
) else (
    echo ✅ Frontend .env file found
)

echo.
echo [6/6] Checking MongoDB connection...
cd backend
node -e "
const mongoose = require('mongoose');
require('dotenv').config();

const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/crop_insurance_dev';

mongoose.connect(MONGODB_URI, { 
    useNewUrlParser: true, 
    useUnifiedTopology: true,
    serverSelectionTimeoutMS: 5000
}).then(() => {
    console.log('✅ MongoDB connection successful');
    process.exit(0);
}).catch((err) => {
    console.log('❌ MongoDB connection failed:', err.message);
    process.exit(1);
});
" 2>nul
if %errorlevel% neq 0 (
    echo ❌ MongoDB connection failed
    echo    Please check MongoDB_SETUP.md for setup instructions
    cd ..
    pause
    exit /b 1
)
cd ..

echo.
echo ========================================
echo           VERIFICATION COMPLETE
echo ========================================
echo.
echo ✅ All checks passed! Your dApp is ready to run.
echo.
echo Next steps:
echo 1. Run start-app.bat to start both servers
echo 2. Open http://localhost:3000 in your browser
echo 3. Install Petra wallet extension
echo 4. Connect your wallet and test the dApp
echo.
echo For detailed instructions, see GETTING_STARTED.md
echo.
pause
