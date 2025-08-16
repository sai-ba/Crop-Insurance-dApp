const express = require("express");
const router = express.Router();

// In-memory storage
const farmers = new Map();

// POST /api/farmers
router.post("/", async (req, res) => {
  try {
    const { address, location, cropType } = req.body;
    if (!address) return res.status(400).json({ error: "address required" });
    
    const farmer = {
      address,
      location,
      cropType,
      createdAt: new Date(),
      updatedAt: new Date()
    };
    
    farmers.set(address, farmer);
    res.json(farmer);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "internal" });
  }
});

// GET /api/farmers/:address
router.get("/:address", async (req, res) => {
  try {
    const farmer = farmers.get(req.params.address);
    if (!farmer) return res.status(404).json({ error: "not found" });
    res.json(farmer);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "internal" });
  }
});

// GET /api/farmers (get all farmers)
router.get("/", async (req, res) => {
  try {
    const allFarmers = Array.from(farmers.values());
    res.json(allFarmers);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "internal" });
  }
});

module.exports = router;
