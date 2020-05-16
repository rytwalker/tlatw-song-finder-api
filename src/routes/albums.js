const express = require("express");
const Album = require("../models/Album");

const router = express.Router();

router.get("/", async (_req, res) => {
  try {
    const albums = await Album.find();
    res.status(200).json(albums);
  } catch (error) {
    res.status(500).json({ message: "Server Error", error });
  }
});

// router.get("/delete", async (req, res) => {
//   try {
//     const albums = await Album.find();
//     albums.forEach(async (album) => {
//       if (album.id > 14) {
//         await Album.remove(album.id);
//       }
//     });
//     res.status(200).json({ message: "success" });
//   } catch (error) {
//     res.status(500).json({ message: "failed" }, error);
//   }
// });

module.exports = router;
