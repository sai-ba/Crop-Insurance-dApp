const mongoose = require("mongoose");

const PolicySchema = new mongoose.Schema({
  ownerAddress: { type: String, required: true, index: true },
  premium: { type: String, required: true }, // store as string for big numbers or if you used u64
  payout: { type: String, required: true },
  txHash: { type: String },
  module: { type: String }, // optional: which move module
  createdAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model("Policy", PolicySchema);
