const express = require("express");
const authSpotify = require("../middleware/authSpotify");
const baseRequest = require("../utils/spotify/baseRequest");
const Artist = require("../models/Artist");
const Album = require("../models/Album");
const Track = require("../models/Track");
const AudioFeature = require("../models/AudioFeature");

const router = express.Router();

router.get("/", authSpotify, async (_req, res) => {
  if (!res.access_token) {
    return res.status(400).json({ message: "bad request" });
  }
  // 1. Get Artist and save to DB
  try {
    const tracks = await Track.find();
    tracks.forEach(async (track) => {
      const response = await baseRequest({
        slug: `audio-features/${track.spotifyId}`,
        access_token: res.access_token,
      });
      const jsonRes = await response.json();

      await AudioFeature.insert({
        spotifyId: jsonRes.id,
        spotifyUrl: jsonRes.uri,
        trackId: track.id,
        danceability: jsonRes.danceability,
        energy: jsonRes.energy,
        key: jsonRes.key,
        loudness: jsonRes.loudness,
        mode: jsonRes.mode,
        speechiness: jsonRes.speechiness,
        acousticness: jsonRes.acousticness,
        instrumentalness: jsonRes.instrumentalness,
        liveness: jsonRes.liveness,
        valence: jsonRes.valence,
        tempo: jsonRes.tempo,
        timeSignature: jsonRes.time_signature,
        trackHref: jsonRes.track_href,
        analysisUrl: jsonRes.analysis_url,
      });
    });
    // const albums = await Album.find();
    // albums.forEach(async (album) => {
    //   const response = await baseRequest({
    //     slug: `albums/${album.spotifyId}/tracks`,
    //     access_token: res.access_token,
    //   });
    //   const jsonRes = await response.json();
    //   jsonRes.items.forEach(async (track) => {
    //     await Track.insert({
    //       name: track.name,
    //       spotifyId: track.id,
    //       spotifyUrl: track.external_urls.spotify,
    //       albumId: album.id,
    //       trackNumber: track.track_number,
    //       durationMs: track.duration_ms,
    //       previewUrl: track.preview_url,
    //     });
    //   });
    // });
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
    // const response = await baseRequest({
    //   slug: `audio-features/3wvvtB5FeboO9piUEwLkCK`,
    //   access_token: res.access_token,
    // });
    // const jsonRes = await response.json();
    res.status(200).json({ message: "success" });
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
});

module.exports = router;
