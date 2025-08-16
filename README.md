Crop Insurance dApp (Aptos + Move + React + Express)
Introduction
This project is a decentralized crop insurance application built using the Move programming language on the Aptos blockchain.
It allows farmers to register, buy crop insurance policies, and view policy status — all while interacting seamlessly with a backend service for data persistence and a React-based frontend for user interaction.
Key Features
•	Smart Contract: Written in Move, deployed on Aptos Testnet.
•	Frontend: React + TypeScript interface with Petra wallet integration.
•	Backend: Express.js API with MongoDB or PostgreSQL (configurable).
•	Wallet Integration: Supports Petra wallet for signing transactions.
•	Hybrid Mode: Demo mode to test without blockchain connection.
________________________________________
System Architecture
User (Browser) │ ├─► React Frontend (TypeScript, Wallet Adapter) │ │ │ ├─► Petra Wallet → Aptos Blockchain (Move Contract) │ │ │ └─► Express Backend → Database (MongoDB/Postgres) │ └─► REST API (Farmer data & policies off-chain)
•	On-chain operations (Aptos):
o	Register farmer (store location, crop type on blockchain)
o	Buy crop insurance policy (premium, payout stored on-chain)
o	Fetch policy status from Aptos node
•	Off-chain operations (Backend):
o	Save farmer profiles to DB
o	Save insurance policy data (with tx hash)
o	Provide REST endpoints to frontend
________________________________________
Project Structure
crop-insurance-dapp/ │ ├── move_contracts/ │ ├── sources/ │ │ └── Insurance.move # Move smart contract │ ├── Move.toml │ └── build/ # Compiled contract artifacts │ ├── crop-insurance-client/ # React Frontend │ ├── src/ │ │ ├── App.tsx │ │ ├── index.tsx │ │ └── ... │ └── package.json │ └── crop-insurance-server/ # Express Backend ├── src/ │ ├── index.js / app.js │ └── routes/ ├── package.json └── ...
________________________________________
Prerequisites
•	Node.js v18+ and npm or yarn
•	Aptos CLI: Install guide
•	Petra Wallet extension: Install Petra
•	MongoDB / PostgreSQL for backend persistence
•	Move / Aptos SDK: installed automatically via npm
________________________________________
Usage
1.	Open the frontend in browser (http://localhost:3000)
2.	Connect Petra Wallet using the "Connect Wallet" button.
3.	Register Farmer – enter your location and crop type → signs on-chain transaction.
4.	Buy Policy – enter premium and payout → signs on-chain transaction.
5.	View Policies – fetches both on-chain and off-chain data.
6.	Demo Mode – toggle to test without wallet or blockchain.
Integration Details
•	**Frontend–Wallet: Uses @aptos-labs/wallet-adapter-react to connect Petra wallet.
•	**Frontend–Blockchain: Uses @aptos-labs/ts-sdk to submit transactions.
•	**Frontend–Backend: Uses REST fetch calls to save and retrieve policy data.
•	**Backend–Database: Stores farmer/policy info and tx hashes for quick access.
Future Improvements
•	**Add premium calculation based on weather or yield data
•	**Integrate Chainlink oracles for real-world data
•	**Implement policy payout automation
•	**Add testing scripts for Move contract and backend API
Thank You
Team Name : Crypto Trio
Members : M N V V SAI BABU, K PUSHPA RAJU, P MALLIKHARJUN
