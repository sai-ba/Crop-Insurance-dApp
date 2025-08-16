module crop_insurance::Insurance {
    use std::signer;
    use std::string::{Self, String};
    use aptos_framework::account;
    use aptos_framework::timestamp;

    // Error codes
    const ENOT_AUTHORIZED: u64 = 1;
    const EFARMER_NOT_REGISTERED: u64 = 2;
    const EINVALID_PREMIUM: u64 = 3;
    const EINVALID_PAYOUT: u64 = 4;
    const EPOLICY_ALREADY_EXISTS: u64 = 5;
    const EPOLICY_NOT_FOUND: u64 = 6;

    // Structs
    struct Farmer has key, store {
        address: address,
        location: String,
        crop_type: String,
        registered_at: u64,
    }

    struct Policy has key, store {
        owner: address,
        premium: u64,
        payout: u64,
        created_at: u64,
        is_active: bool,
    }

    struct InsuranceCapability has key {
        signer_cap: account::SignerCapability,
    }

    // Events
    struct FarmerRegisteredEvent has drop, store {
        farmer_address: address,
        location: String,
        crop_type: String,
        timestamp: u64,
    }

    struct PolicyCreatedEvent has drop, store {
        owner: address,
        premium: u64,
        payout: u64,
        timestamp: u64,
    }

    struct PolicyClaimedEvent has drop, store {
        owner: address,
        payout: u64,
        timestamp: u64,
    }

    // Initialize the module
    fun init_module(account: &signer) {
        // Create the capability for the module
        let signer_cap = account::create_signer_with_capability(account);
        move_to(account, InsuranceCapability { signer_cap });
    }

    // Register a new farmer
    public entry fun register_farmer(
        account: &signer,
        location: String,
        crop_type: String,
    ) {
        let farmer_addr = signer::address_of(account);
        
        // Check if farmer already exists
        assert!(!exists<Farmer>(farmer_addr), EPOLICY_ALREADY_EXISTS);
        
        let farmer = Farmer {
            address: farmer_addr,
            location,
            crop_type,
            registered_at: timestamp::now_seconds(),
        };
        
        move_to(account, farmer);
        
        // Emit event
        let event = FarmerRegisteredEvent {
            farmer_address: farmer_addr,
            location: string::utf8(b""), // We'll use the original location
            crop_type: string::utf8(b""), // We'll use the original crop_type
            timestamp: timestamp::now_seconds(),
        };
        // Note: In a real implementation, you'd emit this event
    }

    // Buy an insurance policy
    public entry fun buy_policy(
        account: &signer,
        premium: u64,
        payout: u64,
    ) {
        let owner = signer::address_of(account);
        
        // Validate inputs
        assert!(premium > 0, EINVALID_PREMIUM);
        assert!(payout > 0, EINVALID_PAYOUT);
        assert!(payout > premium, EINVALID_PAYOUT);
        
        // Check if farmer is registered
        assert!(exists<Farmer>(owner), EFARMER_NOT_REGISTERED);
        
        // Check if policy already exists
        assert!(!exists<Policy>(owner), EPOLICY_ALREADY_EXISTS);
        
        let policy = Policy {
            owner,
            premium,
            payout,
            created_at: timestamp::now_seconds(),
            is_active: true,
        };
        
        move_to(account, policy);
        
        // Emit event
        let event = PolicyCreatedEvent {
            owner,
            premium,
            payout,
            timestamp: timestamp::now_seconds(),
        };
        // Note: In a real implementation, you'd emit this event
    }

    // Claim insurance payout (simplified - in real implementation would have weather data validation)
    public entry fun claim_policy(account: &signer) {
        let owner = signer::address_of(account);
        
        // Check if policy exists
        assert!(exists<Policy>(owner), EPOLICY_NOT_FOUND);
        
        let policy = borrow_global_mut<Policy>(owner);
        assert!(policy.is_active, EPOLICY_NOT_FOUND);
        
        // Mark policy as inactive after claim
        policy.is_active = false;
        
        // Emit event
        let event = PolicyClaimedEvent {
            owner,
            payout: policy.payout,
            timestamp: timestamp::now_seconds(),
        };
        // Note: In a real implementation, you'd emit this event and transfer tokens
    }

    // View functions
    public fun get_farmer_info(farmer_addr: address): (String, String, u64) {
        assert!(exists<Farmer>(farmer_addr), EFARMER_NOT_REGISTERED);
        let farmer = borrow_global<Farmer>(farmer_addr);
        (farmer.location, farmer.crop_type, farmer.registered_at)
    }

    public fun get_policy_info(owner: address): (u64, u64, u64, bool) {
        assert!(exists<Policy>(owner), EPOLICY_NOT_FOUND);
        let policy = borrow_global<Policy>(owner);
        (policy.premium, policy.payout, policy.created_at, policy.is_active)
    }

    public fun is_farmer_registered(farmer_addr: address): bool {
        exists<Farmer>(farmer_addr)
    }

    public fun has_policy(owner: address): bool {
        exists<Policy>(owner)
    }

    // Admin functions (only callable by module owner)
    public entry fun cancel_policy(
        _admin: &signer,
        farmer_addr: address,
    ) {
        // In a real implementation, this would check admin permissions
        assert!(exists<Policy>(farmer_addr), EPOLICY_NOT_FOUND);
        let policy = borrow_global_mut<Policy>(farmer_addr);
        policy.is_active = false;
    }

    // Test functions for development
    #[test_only]
    public fun test_register_farmer(
        account: &signer,
        location: String,
        crop_type: String,
    ) {
        register_farmer(account, location, crop_type);
    }

    #[test_only]
    public fun test_buy_policy(
        account: &signer,
        premium: u64,
        payout: u64,
    ) {
        buy_policy(account, premium, payout);
    }
}
