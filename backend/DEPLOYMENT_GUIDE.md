# Crop Insurance Smart Contract Deployment Guide

## Prerequisites

1. **Aptos CLI** (Recommended method)
   - Install from: https://aptos.dev/tools/aptos-cli/
   - Or use Node.js deployment script

2. **Node.js** (For alternative deployment)
   - Install Node.js and npm

## Method 1: Deploy using Aptos CLI (Recommended)

### Step 1: Install Aptos CLI
```bash
# Windows (using PowerShell)
winget install AptosLabs.AptosCLI

# Or download from: https://github.com/aptos-labs/aptos-core/releases
```

### Step 2: Initialize Aptos Project
```bash
cd backend/move
aptos init
```

### Step 3: Configure Move.toml
Update the `Move.toml` file with your account address:
```toml
[addresses]
crop_insurance = "YOUR_ACCOUNT_ADDRESS"
```

### Step 4: Deploy the Contract
```bash
aptos move publish
```

### Step 5: Update Frontend
Copy your account address and update `App.tsx`:
```typescript
const MODULE_ADDRESS = "YOUR_ACCOUNT_ADDRESS";
```

## Method 2: Deploy using Node.js Script

### Step 1: Install Dependencies
```bash
cd backend
npm install
```

### Step 2: Get Your Private Key
1. Open your wallet (Petra, etc.)
2. Export your private key
3. Copy the hex string

### Step 3: Deploy
```bash
node deploy.js YOUR_PRIVATE_KEY_HEX
```

### Step 4: Update Frontend
Use the provided module address in `App.tsx`.

## Testing the Deployment

### 1. Start the Backend
```bash
cd backend
npm start
```

### 2. Start the Frontend
```bash
cd crop-insurance-client
npm start
```

### 3. Test the Application
1. Connect your wallet
2. Register as a farmer
3. Buy an insurance policy
4. Check policy status

## Contract Functions

### Public Functions
- `register_farmer(location, crop_type)` - Register a new farmer
- `buy_policy(premium, payout)` - Purchase insurance policy
- `claim_policy()` - Claim insurance payout

### View Functions
- `get_farmer_info(address)` - Get farmer details
- `get_policy_info(address)` - Get policy details
- `is_farmer_registered(address)` - Check if farmer is registered
- `has_policy(address)` - Check if address has a policy

## Error Codes
- `ENOT_AUTHORIZED = 1` - Not authorized
- `EFARMER_NOT_REGISTERED = 2` - Farmer not registered
- `EINVALID_PREMIUM = 3` - Invalid premium amount
- `EINVALID_PAYOUT = 4` - Invalid payout amount
- `EPOLICY_ALREADY_EXISTS = 5` - Policy already exists
- `EPOLICY_NOT_FOUND = 6` - Policy not found

## Troubleshooting

### Common Issues
1. **Module not found**: Ensure correct module address in App.tsx
2. **Transaction failed**: Check gas fees and account balance
3. **Wallet not responding**: Verify wallet connection and network

### Network Configuration
- **Devnet**: https://fullnode.devnet.aptoslabs.com
- **Testnet**: https://fullnode.testnet.aptoslabs.com
- **Mainnet**: https://fullnode.mainnet.aptoslabs.com

## Security Notes
- Never share your private key
- Use test accounts for development
- Verify contract code before mainnet deployment
