const express = require("express");
const spotify = require("./spotify");
const artists = require("./artists");
const albums = require("./albums");
const tracks = require("./tracks");
const audioFeatures = require("./audio-features");

const router = express.Router();

router.use("/api/spotify", spotify);
router.use("/api/artists", artists);
router.use("/api/albums", albums);
router.use("/api/tracks", tracks);
router.use("/api/audio-features", audioFeatures);

module.exports = router;
