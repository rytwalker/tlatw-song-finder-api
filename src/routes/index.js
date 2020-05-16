const express = require("express");
const spotify = require("./spotify");
const artists = require("./artists");
const albums = require("./albums");

const router = express.Router();

router.use("/api/spotify", spotify);
router.use("/api/artists", artists);
router.use("/api/albums", albums);

module.exports = router;
