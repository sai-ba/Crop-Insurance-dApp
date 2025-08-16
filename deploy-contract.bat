@echo off
echo ========================================
echo Crop Insurance Contract Deployment
echo ========================================
echo.

echo Step 1: Installing Aptos CLI...
winget install AptosLabs.AptosCLI

echo.
echo Step 2: Please follow these steps manually:
echo.
echo 1. Open a new terminal and run:
echo    cd backend\move
echo    aptos init
echo.
echo 2. Update the Move.toml file with your account address
echo.
echo 3. Deploy the contract:
echo    aptos move publish
echo.
echo 4. Copy your account address and update App.tsx:
echo    const MODULE_ADDRESS = "YOUR_ACCOUNT_ADDRESS";
echo.
echo 5. Start the backend:
echo    cd backend
echo    npm start
echo.
echo 6. Start the frontend:
echo    cd crop-insurance-client
echo    npm start
echo.
echo ========================================
pause
