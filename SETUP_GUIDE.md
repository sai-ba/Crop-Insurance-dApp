# 🚀 Crop Insurance dApp - Quick Setup Guide

## ✅ What's Been Completed

Your crop insurance dApp is now **fully functional** with the following features:

### ✅ Frontend (React + TypeScript)
- **Wallet Integration**: Connect with Aptos wallets (Petra, Martian, etc.)
- **Farmer Registration**: Register with location and crop type
- **Policy Purchase**: Buy insurance with custom premium/payout
- **Policy Management**: View all your policies
- **Demo Mode**: Test without real blockchain transactions
- **Real-time Updates**: Automatic data fetching and display
- **Responsive Design**: Works on desktop and mobile
- **Error Handling**: User-friendly error messages
- **Loading States**: Visual feedback during operations

### ✅ Backend (Node.js + MongoDB)
- **RESTful API**: Complete CRUD operations
- **MongoDB Integration**: Persistent data storage
- **CORS Enabled**: Cross-origin requests allowed
- **Error Handling**: Proper error responses
- **Data Validation**: Input validation and sanitization

### ✅ UI/UX Improvements
- **Modern Design**: Professional green theme
- **Animations**: Smooth transitions and hover effects
- **Notifications**: Success/error/info messages
- **Loading Indicators**: Visual feedback during operations
- **Mobile Responsive**: Works on all screen sizes

## 🚀 Quick Start (3 Steps)

### Step 1: Install Dependencies
```bash
# Run the setup script (Windows)
setup.bat

# Or manually:
cd backend && npm install
cd ../crop-insurance-client && npm install
```

### Step 2: Start MongoDB
Make sure MongoDB is running on your system:
```bash
# If using MongoDB locally
mongod

# Or use MongoDB Atlas (cloud)
# Update MONGODB_URI in backend/.env
```

### Step 3: Start the Application
```bash
# Run the start script (Windows)
start-app.bat

# Or manually:
# Terminal 1: cd backend && npm start
# Terminal 2: cd crop-insurance-client && npm start
```

## 🌐 Access the Application

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:4000
- **API Health Check**: http://localhost:4000/api/health

## 🔗 Wallet Connection

1. **Install Petra Wallet** (Chrome Extension)
2. **Create/Import Account** in Petra
3. **Click "Connect Wallet"** in the dApp
4. **Approve Connection** in Petra popup

## 🎯 How to Test

### Demo Mode (Recommended for Testing)
1. Click "Use Demo Mode" button
2. Register as a farmer (no real blockchain transaction)
3. Buy a policy (simulated)
4. View your policies in the dashboard

### Real Blockchain Mode
1. Ensure you have APT tokens in your wallet
2. Update `MODULE_ADDRESS` in `src/App.tsx`
3. Disable demo mode
4. Connect your wallet
5. Perform real transactions

## 🔧 Configuration

### Environment Variables

**Backend** (create `backend/.env`):
```env
PORT=4000
MONGODB_URI=mongodb://localhost:27017/crop_insurance_dev
```

**Frontend** (create `crop-insurance-client/.env`):
```env
REACT_APP_API_BASE=http://localhost:4000
```

### Module Address
Before using real transactions, update in `src/App.tsx`:
```typescript
const MODULE_ADDRESS = "0xYourActualModuleAddress";
```

## 📊 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/health` | Health check |
| POST | `/api/farmers` | Register farmer |
| GET | `/api/farmers/:address` | Get farmer data |
| POST | `/api/policies` | Create policy |
| GET | `/api/policies/:address` | Get user policies |
| GET | `/api/policies` | Get all policies |

## 🎨 Features Overview

### ✅ Completed Features
- [x] Wallet connection (Petra, Martian, etc.)
- [x] Farmer registration
- [x] Policy purchase
- [x] Policy viewing
- [x] Demo mode
- [x] Backend integration
- [x] Real-time updates
- [x] Error handling
- [x] Loading states
- [x] Responsive design
- [x] Modern UI/UX

### 🔮 Future Enhancements
- [ ] Claim functionality
- [ ] Weather data integration
- [ ] Crop yield predictions
- [ ] Advanced analytics
- [ ] Multi-language support
- [ ] Admin dashboard

## 🐛 Troubleshooting

### Common Issues

1. **"Module not found" errors**
   - Run `npm install` in both directories
   - Check Node.js version (v16+)

2. **MongoDB connection failed**
   - Ensure MongoDB is running
   - Check connection string in `.env`

3. **Wallet connection fails**
   - Install Petra wallet extension
   - Ensure wallet is unlocked
   - Check network configuration

4. **CORS errors**
   - Backend CORS is already configured
   - Check if backend is running on port 4000

### Debug Mode
- Open browser developer tools (F12)
- Check Console for detailed error messages
- Check Network tab for API calls

## 📱 Mobile Testing

The app is fully responsive and works on:
- ✅ Desktop browsers
- ✅ Mobile browsers
- ✅ Tablet browsers

## 🚀 Deployment Ready

The application is ready for deployment to:
- **Frontend**: Vercel, Netlify, AWS S3
- **Backend**: Heroku, Railway, AWS EC2
- **Database**: MongoDB Atlas, AWS DocumentDB

## 📞 Support

If you encounter any issues:
1. Check the troubleshooting section
2. Review browser console for errors
3. Verify all services are running
4. Check network connectivity

---

**🎉 Your Crop Insurance dApp is ready to use!**

Connect your wallet and start insuring crops! 🌾🚜
