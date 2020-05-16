const express = require("express");
const authSpotify = require("../middleware/authSpotify");
const baseRequest = require("../utils/spotify/baseRequest");
const Artist = require("../models/Artist");
const Album = require("../models/Album");

const router = express.Router();

router.get("/", authSpotify, async (_req, res) => {
  if (!res.access_token) {
    return res.status(400).json({ message: "bad request" });
  }
  // 1. Get Artist and save to DB
  try {
    const response = await baseRequest({
      slug: "albums/7DQVIBQzh3Jef1EeK3Fb1W/tracks",
      access_token: res.access_token,
    });
    const jsonRes = await response.json();
    // jsonRes.items.forEach(async (item) => {
    //   if (item.available_markets.find((market) => market === "US")) {
    //     const id = await Album.insert({
    //       name: item.name,
    //       spotifyId: item.id,
    //       spotifyUrl: item.external_urls.spotify,
    //       artistId: 1,
    //       albumType: item.album_type,
    //       releaseDate: item.release_date,
    //       largeImageUrl: item.images[0].url,
    //       smallImageUrl: item.images[1].url,
    //       thumbnailUrl: item.images[2].url,
    //       totalTracks: item.total_tracks,
    //     });
    //     returnIds.push(id);
    //   }
    // });
    // const returnId = await Artist.insert({
    //   name: jsonRes.name,
    //   spotifyId: jsonRes.id,
    //   spotifyUrl: jsonRes.external_urls.spotify,
    //   followers: jsonRes.followers.total,
    // });

    res.status(200).json(jsonRes);
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
});

module.exports = router;
