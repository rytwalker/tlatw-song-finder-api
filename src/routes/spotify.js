const express = require("express");
const fetch = require("node-fetch");
const authSpotify = require("../middleware/authSpotify");
const baseRequest = require("../utils/spotify/baseRequest");

const router = express.Router();

router.get("/", authSpotify, async (_req, res) => {
  if (!res.access_token) {
    return res.status(400).json({ message: "bad request" });
  }
  try {
    const response = await baseRequest({
      slug: "artists/6ls5A8Wys9Swixpz4v6kj3/albums",
      access_token: res.access_token,
    });
    // const response = await fetch(
    //   "https://api.spotify.com/v1/artists/6ls5A8Wys9Swixpz4v6kj3/albums",
    //   {
    //     method: "get",
    //     headers: {
    //       Authorization: `Bearer ${res.access_token}`,
    //     },
    //   }
    // );
    const jsonRes = await response.json();
    res.status(200).json(jsonRes);
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
});

module.exports = router;
