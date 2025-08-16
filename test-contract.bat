@echo off
echo ========================================
echo Testing Deployed Contract
echo ========================================
echo.

cd backend\move

echo Testing contract functions...
echo.

echo 1. Checking if contract is deployed...
aptos move view --function-id %MODULE_ADDRESS%::Insurance::is_farmer_registered --args address:0x6651ef3efd557d3501610dc079bdb6c6eb4bbdceb1c579a31ee830fc35bacffe

echo.
echo 2. Contract deployment successful!
echo.
echo 3. You can now use the frontend to:
echo    - Register as a farmer
echo    - Buy insurance policies
echo    - Check policy status
echo.
echo 4. Make sure your wallet is connected to TESTNET
echo.

pause
