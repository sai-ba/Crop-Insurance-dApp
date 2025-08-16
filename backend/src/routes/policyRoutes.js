const express = require("express");
const router = express.Router();

// In-memory storage
const policies = new Map();
let policyIdCounter = 1;

// POST /api/policies
router.post("/", async (req, res) => {
  try {
    const { ownerAddress, premium, payout, txHash, module } = req.body;
    if (!ownerAddress || !premium || !payout) {
      return res.status(400).json({ error: "ownerAddress, premium and payout are required" });
    }
    
    const policy = {
      id: policyIdCounter++,
      ownerAddress,
      premium: premium.toString(),
      payout: payout.toString(),
      txHash,
      module,
      createdAt: new Date()
    };
    
    policies.set(policy.id, policy);
    res.json(policy);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "internal" });
  }
});

// GET /api/policies/:address
router.get("/:address", async (req, res) => {
  try {
    const userPolicies = Array.from(policies.values())
      .filter(policy => policy.ownerAddress === req.params.address)
      .sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));
    res.json(userPolicies);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "internal" });
  }
});

// GET /api/policies (admin)
router.get("/", async (req, res) => {
  try {
    const allPolicies = Array.from(policies.values())
      .sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt))
      .slice(0, 200);
    res.json(allPolicies);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "internal" });
  }
});

module.exports = router;
