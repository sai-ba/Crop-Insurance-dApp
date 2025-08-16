require("dotenv").config();
const express = require("express");
const cors = require("cors");
const farmerRoutes = require("./src/routes/farmerRoutes");
const policyRoutes = require("./src/routes/policyRoutes");

const app = express();
app.use(cors());
app.use(express.json());

// Routes
app.use("/api/farmers", farmerRoutes);
app.use("/api/policies", policyRoutes);

// health
app.get("/api/health", (req, res) => res.json({ ok: true, ts: Date.now() }));

// DB connect + start
const PORT = process.env.PORT || 4000;

// Start server without MongoDB dependency
const server = app.listen(PORT, '0.0.0.0', (err) => {
  if (err) {
    console.error("Failed to start server:", err);
    process.exit(1);
  }
  console.log(`Backend running on http://localhost:${PORT}`);
  console.log(`Health check: http://localhost:${PORT}/api/health`);
  console.log(`Farmers API: http://localhost:${PORT}/api/farmers`);
  console.log(`Policies API: http://localhost:${PORT}/api/policies`);
});

// Handle server errors
server.on('error', (err) => {
  console.error("Server error:", err);
  if (err.code === 'EADDRINUSE') {
    console.error(`Port ${PORT} is already in use`);
  }
});
