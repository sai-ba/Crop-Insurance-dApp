# 🌾 Crop Insurance dApp

A decentralized application for crop insurance built on the Aptos blockchain with a modern React frontend and Node.js backend.

## 🚀 Features

- **Farmer Registration**: Register as a farmer with location and crop type
- **Insurance Policies**: Purchase crop insurance policies with premium and payout
- **Policy Management**: View and manage your insurance policies
- **Modern UI**: Beautiful, responsive interface with glass morphism design
- **Backend Integration**: RESTful API for data persistence
- **Blockchain Integration**: Smart contracts on Aptos blockchain

## 🏗️ Architecture

```
├── crop-insurance-client/     # React frontend
├── backend/                   # Node.js backend
│   ├── move/                  # Move smart contracts
│   ├── src/                   # Backend source code
│   └── server.js              # Express server
└── README.md                  # This file
```

## 🛠️ Tech Stack

### Frontend
- **React 19** with TypeScript
- **Aptos Wallet Adapter** for blockchain integration
- **Modern CSS** with glass morphism effects

### Backend
- **Node.js** with Express
- **In-memory storage** (can be replaced with MongoDB)
- **RESTful API** for data management

### Blockchain
- **Aptos** blockchain
- **Move** smart contracts
- **Devnet** for testing

## 📦 Installation

### Prerequisites
- Node.js (v16 or higher)
- npm or yarn
- Aptos CLI (for contract deployment)

### 1. Clone the Repository
```bash
git clone <repository-url>
cd Hackathon
```

### 2. Install Frontend Dependencies
```bash
cd crop-insurance-client
npm install
```

### 3. Install Backend Dependencies
```bash
cd ../backend
npm install
```

## 🚀 Quick Start

### 1. Deploy Smart Contract

#### Option A: Using Aptos CLI (Recommended)
```bash
# Install Aptos CLI
winget install AptosLabs.AptosCLI

# Navigate to move directory
cd backend/move

# Initialize Aptos project
aptos init

# Update Move.toml with your account address
# Replace "YOUR_ACCOUNT_ADDRESS" in the file

# Deploy contract
aptos move publish
```

#### Option B: Using Deployment Script
```bash
cd backend
node deploy.js YOUR_PRIVATE_KEY_HEX
```

### 2. Update Module Address
Copy your deployed account address and update `crop-insurance-client/src/App.tsx`:
```typescript
const MODULE_ADDRESS = "YOUR_ACCOUNT_ADDRESS";
```

### 3. Start Backend Server
```bash
cd backend
npm start
```

### 4. Start Frontend Application
```bash
cd crop-insurance-client
npm start
```

### 5. Connect Wallet
1. Open your browser to `http://localhost:3000`
2. Install Petra wallet extension
3. Connect your wallet
4. Switch to Devnet network

## 📋 Usage

### Register as Farmer
1. Connect your wallet
2. Enter your location and crop type
3. Click "Register"
4. Approve the transaction in your wallet

### Buy Insurance Policy
1. Enter premium amount (what you pay)
2. Enter payout amount (what you receive if claim)
3. Click "Buy Policy"
4. Approve the transaction in your wallet

### View Policy Status
1. Click "Fetch Policy Status"
2. Check the browser console for policy details

## 🔧 Smart Contract Functions

### Public Entry Functions
- `register_farmer(location, crop_type)` - Register a new farmer
- `buy_policy(premium, payout)` - Purchase insurance policy
- `claim_policy()` - Claim insurance payout

### View Functions
- `get_farmer_info(address)` - Get farmer details
- `get_policy_info(address)` - Get policy details
- `is_farmer_registered(address)` - Check if farmer is registered
- `has_policy(address)` - Check if address has a policy

## 🌐 API Endpoints

### Farmers
- `POST /api/farmers` - Register a farmer
- `GET /api/farmers/:address` - Get farmer by address
- `GET /api/farmers` - Get all farmers

### Policies
- `POST /api/policies` - Create a policy
- `GET /api/policies/:address` - Get policies by address
- `GET /api/policies` - Get all policies

### Health
- `GET /api/health` - Health check

## 🎨 UI Features

- **Glass Morphism**: Modern translucent design
- **Gradient Backgrounds**: Beautiful color schemes
- **Hover Effects**: Interactive animations
- **Responsive Design**: Works on all devices
- **Loading States**: Visual feedback during transactions

## 🔒 Security

- **Input Validation**: All inputs are validated
- **Error Handling**: Comprehensive error handling
- **Transaction Safety**: Secure blockchain transactions
- **Private Key Protection**: Never expose private keys

## 🐛 Troubleshooting

### Common Issues

1. **Wallet Not Connecting**
   - Ensure Petra wallet is installed
   - Switch to Devnet network
   - Check wallet permissions

2. **Transaction Fails**
   - Verify sufficient balance for gas fees
   - Check if module address is correct
   - Ensure contract is deployed

3. **Backend Not Starting**
   - Check if port 4000 is available
   - Verify all dependencies are installed
   - Check console for error messages

### Error Codes
- `ENOT_AUTHORIZED = 1` - Not authorized
- `EFARMER_NOT_REGISTERED = 2` - Farmer not registered
- `EINVALID_PREMIUM = 3` - Invalid premium amount
- `EINVALID_PAYOUT = 4` - Invalid payout amount
- `EPOLICY_ALREADY_EXISTS = 5` - Policy already exists
- `EPOLICY_NOT_FOUND = 6` - Policy not found

## 🔄 Development

### Adding New Features
1. Update Move contract in `backend/move/Insurance.move`
2. Deploy updated contract
3. Update frontend to use new functions
4. Test thoroughly

### Backend Development
1. Add new routes in `backend/src/routes/`
2. Update models if needed
3. Test API endpoints
4. Update frontend integration

## 📄 License

This project is licensed under the MIT License.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📞 Support

For support and questions:
- Check the troubleshooting section
- Review the deployment guide
- Open an issue on GitHub

---

**Happy Farming! 🌾🚀**
