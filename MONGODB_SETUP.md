# 🗄️ MongoDB Setup Guide for Crop Insurance dApp

## Option 1: MongoDB Atlas (Cloud - Recommended)

### Step 1: Create MongoDB Atlas Account
1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Sign up for a free account
3. Create a new project

### Step 2: Create a Cluster
1. Click "Build a Database"
2. Choose "FREE" tier (M0)
3. Select your preferred cloud provider and region
4. Click "Create"

### Step 3: Set Up Database Access
1. Go to "Database Access" in the left sidebar
2. Click "Add New Database User"
3. Choose "Password" authentication
4. Create a username and password (save these!)
5. Select "Read and write to any database"
6. Click "Add User"

### Step 4: Set Up Network Access
1. Go to "Network Access" in the left sidebar
2. Click "Add IP Address"
3. Click "Allow Access from Anywhere" (for development)
4. Click "Confirm"

### Step 5: Get Connection String
1. Go to "Database" in the left sidebar
2. Click "Connect"
3. Choose "Connect your application"
4. Copy the connection string
5. Replace `<password>` with your actual password

### Step 6: Update Environment Variables
Create `backend/.env` file:
```env
PORT=4000
MONGODB_URI=mongodb+srv://yourusername:yourpassword@cluster0.xxxxx.mongodb.net/crop_insurance_dev?retryWrites=true&w=majority
```

## Option 2: Local MongoDB Installation

### Windows Installation

#### Method 1: MongoDB Community Server
1. Download from [MongoDB Download Center](https://www.mongodb.com/try/download/community)
2. Run the installer
3. Choose "Complete" installation
4. Install MongoDB Compass (GUI tool) if prompted
5. MongoDB will be installed as a Windows service

#### Method 2: Using Chocolatey
```bash
choco install mongodb
```

#### Method 3: Using Docker
```bash
docker run -d -p 27017:27017 --name mongodb mongo:latest
```

### macOS Installation

#### Method 1: Using Homebrew
```bash
brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb/brew/mongodb-community
```

#### Method 2: Using Docker
```bash
docker run -d -p 27017:27017 --name mongodb mongo:latest
```

### Linux Installation (Ubuntu/Debian)

#### Method 1: Using Package Manager
```bash
# Import MongoDB public GPG key
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

# Create list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Update package database
sudo apt-get update

# Install MongoDB
sudo apt-get install -y mongodb-org

# Start MongoDB
sudo systemctl start mongod

# Enable MongoDB to start on boot
sudo systemctl enable mongod
```

#### Method 2: Using Docker
```bash
docker run -d -p 27017:27017 --name mongodb mongo:latest
```

## Testing MongoDB Connection

### Method 1: Using MongoDB Compass
1. Download [MongoDB Compass](https://www.mongodb.com/try/download/compass)
2. Connect to your MongoDB instance
3. Create a database called `crop_insurance_dev`

### Method 2: Using Command Line
```bash
# Connect to MongoDB
mongosh

# Create and use database
use crop_insurance_dev

# Test with a simple query
db.farmers.find()
```

### Method 3: Test from Backend
1. Start the backend server
2. Check the console for connection messages
3. Visit `http://localhost:4000/api/health`

## Environment Variables

### For Local MongoDB
Create `backend/.env`:
```env
PORT=4000
MONGODB_URI=mongodb://localhost:27017/crop_insurance_dev
```

### For MongoDB Atlas
Create `backend/.env`:
```env
PORT=4000
MONGODB_URI=mongodb+srv://username:password@cluster.xxxxx.mongodb.net/crop_insurance_dev?retryWrites=true&w=majority
```

## Troubleshooting

### Common Issues

1. **Connection Refused**
   - Ensure MongoDB is running
   - Check if port 27017 is available
   - Verify firewall settings

2. **Authentication Failed**
   - Check username/password in connection string
   - Ensure user has proper permissions
   - Verify network access settings (for Atlas)

3. **Network Timeout**
   - Check internet connection (for Atlas)
   - Verify IP whitelist (for Atlas)
   - Check DNS resolution

### Useful Commands

```bash
# Check if MongoDB is running (Windows)
sc query MongoDB

# Check if MongoDB is running (Linux/macOS)
sudo systemctl status mongod

# Start MongoDB (Windows)
net start MongoDB

# Start MongoDB (Linux/macOS)
sudo systemctl start mongod

# Stop MongoDB (Windows)
net stop MongoDB

# Stop MongoDB (Linux/macOS)
sudo systemctl stop mongod
```

## Database Structure

The application will automatically create these collections:

- `farmers` - Stores farmer registration data
- `policies` - Stores insurance policy data

### Sample Data Structure

```javascript
// Farmers collection
{
  "_id": ObjectId("..."),
  "address": "0x1234...",
  "location": "California, USA",
  "cropType": "Corn",
  "createdAt": ISODate("2024-01-01T00:00:00Z")
}

// Policies collection
{
  "_id": ObjectId("..."),
  "ownerAddress": "0x1234...",
  "premium": "100",
  "payout": "1000",
  "txHash": "0xabcd...",
  "createdAt": ISODate("2024-01-01T00:00:00Z")
}
```

## Security Best Practices

1. **Use Strong Passwords** for database users
2. **Enable Network Security** (IP whitelist for Atlas)
3. **Use Environment Variables** for sensitive data
4. **Regular Backups** of your database
5. **Monitor Access** and set up alerts
6. **Use SSL/TLS** connections in production

---

**🎉 Your MongoDB is ready!**

Now you can start your crop insurance dApp with persistent data storage! 🗄️
