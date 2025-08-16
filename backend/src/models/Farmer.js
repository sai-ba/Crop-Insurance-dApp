const mongoose = require("mongoose");

const FarmerSchema = new mongoose.Schema({
  address: { type: String, required: true, index: true },
  location: { type: String },
  cropType: { type: String },
  createdAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model("Farmer", FarmerSchema);
