const express = require("express");
const Track = require("../models/Track");

const router = express.Router();

router.get("/", async (_req, res) => {
  try {
    const tracks = await Track.find();
    res.status(200).json({ tracks, length: tracks.length });
  } catch (error) {
    res.status(500).json({ message: "Server Error", error });
  }
});

module.exports = router;
