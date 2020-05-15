const express = require("express");
const spotify = require("./spotify");

const router = express.Router();

router.use("/api/spotify", spotify);

module.exports = router;
