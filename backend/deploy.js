const { AptosClient, AptosAccount, TxnBuilderTypes, BCS } = require("aptos");
const fs = require("fs");
const path = require("path");

// Configuration
const NODE_URL = "https://fullnode.devnet.aptoslabs.com";
const client = new AptosClient(NODE_URL);

// Function to compile and deploy the Move module
async function deployContract(privateKeyHex) {
    try {
        // Create account from private key
        const privateKeyBytes = new Uint8Array(Buffer.from(privateKeyHex, 'hex'));
        const account = new AptosAccount(privateKeyBytes);
        
        console.log("Account address:", account.address().toString());
        
        // Read the Move module
        const modulePath = path.join(__dirname, "move", "Insurance.move");
        const moduleCode = fs.readFileSync(modulePath, "utf8");
        
        console.log("Module code loaded successfully");
        
        // Create module payload
        const modulePayload = new TxnBuilderTypes.TransactionPayloadModuleBundle(
            new TxnBuilderTypes.ModuleBundle([
                new TxnBuilderTypes.Module(
                    new Uint8Array(Buffer.from(moduleCode, "utf8"))
                )
            ])
        );
        
        // Get account sequence number
        const sequenceNumber = await client.getSequenceNumber(account.address());
        
        // Create transaction
        const transaction = new TxnBuilderTypes.Transaction(
            account.address(),
            BigInt(sequenceNumber),
            modulePayload,
            BigInt(2000), // max gas amount
            BigInt(100), // gas unit price
            BigInt(Math.floor(Date.now() / 1000) + 10), // expiration timestamp
            new TxnBuilderTypes.ChainId(1) // devnet chain ID
        );
        
        // Sign and submit transaction
        const signature = account.sign(transaction);
        const authenticator = new TxnBuilderTypes.AccountAuthenticatorEd25519(
            account.publicKey(),
            signature
        );
        
        const signedTransaction = new TxnBuilderTypes.SignedTransaction(
            transaction,
            authenticator
        );
        
        console.log("Submitting transaction...");
        const transactionHash = await client.submitTransaction(signedTransaction);
        console.log("Transaction submitted:", transactionHash);
        
        // Wait for transaction to be confirmed
        await client.waitForTransaction(transactionHash);
        console.log("Transaction confirmed!");
        
        // Get the deployed module address
        const moduleAddress = account.address().toString();
        console.log("Module deployed at address:", moduleAddress);
        console.log("Module name: crop_insurance::Insurance");
        
        return {
            moduleAddress,
            transactionHash
        };
        
    } catch (error) {
        console.error("Deployment failed:", error);
        throw error;
    }
}

// Alternative: Use Aptos CLI for deployment
async function deployWithAptosCLI() {
    console.log("To deploy using Aptos CLI:");
    console.log("1. Install Aptos CLI: https://aptos.dev/tools/aptos-cli/");
    console.log("2. Initialize project: aptos init");
    console.log("3. Deploy: aptos move publish");
    console.log("4. Update the MODULE_ADDRESS in App.tsx with your deployed address");
}

// Main execution
if (require.main === module) {
    const privateKey = process.argv[2];
    
    if (!privateKey) {
        console.log("Usage: node deploy.js <private_key_hex>");
        console.log("Or use Aptos CLI method:");
        deployWithAptosCLI();
        return;
    }
    
    deployContract(privateKey)
        .then(({ moduleAddress, transactionHash }) => {
            console.log("\n=== DEPLOYMENT SUCCESSFUL ===");
            console.log("Module Address:", moduleAddress);
            console.log("Transaction Hash:", transactionHash);
            console.log("\nUpdate your App.tsx with:");
            console.log(`const MODULE_ADDRESS = "${moduleAddress}";`);
        })
        .catch(console.error);
}

module.exports = { deployContract };
