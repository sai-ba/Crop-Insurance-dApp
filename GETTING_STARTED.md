# 🚀 Getting Started with Your Crop Insurance dApp

## 🎯 Quick Overview

Your crop insurance dApp is a complete decentralized application that allows farmers to:
- Connect their Aptos wallet
- Register as a farmer with location and crop type
- Purchase insurance policies
- View and manage their policies
- Test everything in demo mode

## 📋 Prerequisites Checklist

Before starting, ensure you have:

- [ ] **Node.js** (v16 or higher) - [Download here](https://nodejs.org/)
- [ ] **npm** (comes with Node.js)
- [ ] **MongoDB** (local or cloud) - See `MONGODB_SETUP.md`
- [ ] **Aptos Wallet** (Petra recommended) - [Chrome Extension](https://petra.app/)

## 🚀 Step-by-Step Setup

### Step 1: Verify Your Environment

Run the test script to check everything:
```bash
# Windows
test-setup.bat

# Or manually check:
node --version  # Should be v16+
npm --version   # Should be v8+
```

### Step 2: Install Dependencies

```bash
# Windows (recommended)
setup.bat

# Or manually:
cd backend && npm install
cd ../crop-insurance-client && npm install
```

### Step 3: Set Up MongoDB

Choose one option:

#### Option A: MongoDB Atlas (Cloud - Recommended)
1. Follow the guide in `MONGODB_SETUP.md`
2. Create a free MongoDB Atlas account
3. Get your connection string
4. Create `backend/.env` file:
```env
PORT=4000
MONGODB_URI=mongodb+srv://yourusername:yourpassword@cluster.xxxxx.mongodb.net/crop_insurance_dev?retryWrites=true&w=majority
```

#### Option B: Local MongoDB
1. Install MongoDB locally (see `MONGODB_SETUP.md`)
2. Start MongoDB service
3. Create `backend/.env` file:
```env
PORT=4000
MONGODB_URI=mongodb://localhost:27017/crop_insurance_dev
```

### Step 4: Start the Application

```bash
# Windows (recommended)
start-app.bat

# Or manually in two terminals:
# Terminal 1:
cd backend && npm start

# Terminal 2:
cd crop-insurance-client && npm start
```

### Step 5: Access Your Application

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:4000
- **Health Check**: http://localhost:4000/api/health

## 🎮 How to Use Your dApp

### 1. Connect Your Wallet
1. Install [Petra Wallet](https://petra.app/) (Chrome extension)
2. Create or import an account
3. Click "Connect Wallet" in the dApp
4. Approve the connection

### 2. Test in Demo Mode (Recommended First)
1. Click "Use Demo Mode" button
2. Register as a farmer:
   - Location: "California, USA"
   - Crop Type: "Corn"
3. Buy a policy:
   - Premium: 100 APT
   - Payout: 1000 APT
4. View your policies in the dashboard

### 3. Use Real Blockchain Mode
1. Ensure you have APT tokens in your wallet
2. Update `MODULE_ADDRESS` in `src/App.tsx` with your smart contract address
3. Disable demo mode
4. Connect your wallet
5. Perform real transactions

## 🔧 Configuration Options

### Environment Variables

**Frontend** (`crop-insurance-client/.env`):
```env
REACT_APP_API_BASE=http://localhost:4000
```

**Backend** (`backend/.env`):
```env
PORT=4000
MONGODB_URI=your_mongodb_connection_string
```

### Smart Contract Configuration

Before using real transactions, update in `src/App.tsx`:
```typescript
const MODULE_ADDRESS = "0xYourActualModuleAddress";
```

### Network Configuration

The dApp is configured for Aptos Testnet by default. To change:
```typescript
// In src/App.tsx
const aptosConfig = new AptosConfig({ network: Network.MAINNET });
```

## 📊 API Endpoints

Your backend provides these endpoints:

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/health` | Health check |
| POST | `/api/farmers` | Register farmer |
| GET | `/api/farmers/:address` | Get farmer data |
| POST | `/api/policies` | Create policy |
| GET | `/api/policies/:address` | Get user policies |
| GET | `/api/policies` | Get all policies |

## 🎨 Features You Can Test

### ✅ Available Features
- [x] **Wallet Connection** - Connect with Petra, Martian, etc.
- [x] **Farmer Registration** - Register with location and crop type
- [x] **Policy Purchase** - Buy insurance with custom amounts
- [x] **Policy Management** - View all your policies
- [x] **Demo Mode** - Test without real transactions
- [x] **Real-time Updates** - Automatic data refresh
- [x] **Error Handling** - User-friendly error messages
- [x] **Loading States** - Visual feedback during operations
- [x] **Responsive Design** - Works on mobile and desktop

### 🔮 Future Enhancements
- [ ] Claim functionality
- [ ] Weather data integration
- [ ] Crop yield predictions
- [ ] Advanced analytics dashboard

## 🐛 Troubleshooting

### Common Issues and Solutions

#### 1. "Module not found" errors
```bash
# Solution: Reinstall dependencies
cd backend && npm install
cd ../crop-insurance-client && npm install
```

#### 2. MongoDB connection failed
```bash
# Check if MongoDB is running
# Windows:
sc query MongoDB

# Linux/macOS:
sudo systemctl status mongod
```

#### 3. Wallet connection fails
- Install Petra wallet extension
- Ensure wallet is unlocked
- Check network configuration
- Try refreshing the page

#### 4. CORS errors
- Backend CORS is already configured
- Check if backend is running on port 4000
- Verify frontend is calling correct API URL

#### 5. Build errors
```bash
# Clear cache and rebuild
cd crop-insurance-client
rm -rf node_modules package-lock.json
npm install
npm run build
```

### Debug Mode
- Open browser developer tools (F12)
- Check Console for detailed error messages
- Check Network tab for API calls
- Check Application tab for wallet connection status

## 📱 Mobile Testing

Your dApp is fully responsive and works on:
- ✅ Desktop browsers (Chrome, Firefox, Safari, Edge)
- ✅ Mobile browsers (iOS Safari, Chrome Mobile)
- ✅ Tablet browsers

## 🚀 Deployment

### Frontend Deployment (Vercel/Netlify)
```bash
cd crop-insurance-client
npm run build
# Deploy the build folder
```

### Backend Deployment (Heroku/Railway)
```bash
cd backend
# Set environment variables
# Deploy using your preferred platform
```

### Database Deployment
- Use MongoDB Atlas for production
- Set up proper security and backups
- Configure environment variables

## 📞 Support

If you encounter issues:

1. **Check the troubleshooting section above**
2. **Review browser console for errors**
3. **Verify all services are running**
4. **Check network connectivity**
5. **Review the detailed guides:**
   - `SETUP_GUIDE.md` - Complete setup guide
   - `MONGODB_SETUP.md` - Database setup
   - `README.md` - Technical documentation

## 🎉 Success Checklist

You've successfully set up your crop insurance dApp when:

- [ ] Frontend loads at http://localhost:3000
- [ ] Backend responds at http://localhost:4000/api/health
- [ ] MongoDB is connected and running
- [ ] Wallet connects successfully
- [ ] Demo mode works (register farmer, buy policy)
- [ ] Policies display in the dashboard
- [ ] No console errors in browser

---

**🎊 Congratulations! Your Crop Insurance dApp is ready!**

Connect your wallet and start insuring crops! 🌾🚜

For more detailed information, check out the other documentation files in this project.
