const express = require("express");
const AudioFeature = require("../models/AudioFeature");

const router = express.Router();

router.get("/", async (_req, res) => {
  try {
    const audioFeatures = await AudioFeature.find();
    res.status(200).json({ audioFeatures, length: audioFeatures.length });
  } catch (error) {
    res.status(500).json({ message: "Server Error", error });
  }
});

module.exports = router;
