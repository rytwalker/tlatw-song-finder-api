const express = require("express");
const Artist = require("../models/Artist");

const router = express.Router();

router.get("/", async (_req, res) => {
  try {
    const artists = await Artist.find();
    res.status(200).json(artists);
  } catch (error) {
    res.status(500).json({ message: "Server Error", error });
  }
});

module.exports = router;
