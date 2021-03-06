const express = require("express");
const authSpotify = require("../middleware/authSpotify");
const baseRequest = require("../utils/spotify/baseRequest");
const Artist = require("../models/Artist");
const Album = require("../models/Album");
const Track = require("../models/Track");
const AudioFeature = require("../models/AudioFeature");

const router = express.Router();

const TLATW_SPOTIFY_ID = "6ls5A8Wys9Swixpz4v6kj3";

router.get("/", authSpotify, async (_req, res) => {
  if (!res.access_token) {
    return res.status(400).json({ message: "bad request" });
  }
  try {
    // Since we only have one artist at this point it just checks if there are any in the db
    const hasArtist = await Artist.find();
    if (hasArtist.length) {
      return res.status(400).json({ message: "Artist already exists in DB." });
    }

    // 1. Get Artist and save to DB
    const artistResponse = await baseRequest({
      slug: `artists/${TLATW_SPOTIFY_ID}`,
      access_token: res.access_token,
    });
    const jsonArtistRes = await artistResponse.json();

    await Artist.insert({
      name: jsonArtistRes.name,
      spotifyId: jsonArtistRes.id,
      spotifyUrl: jsonArtistRes.external_urls.spotify,
      followers: jsonArtistRes.followers.total,
    });

    // 2. Albums
    const albumResponse = await baseRequest({
      slug: `artists/${TLATW_SPOTIFY_ID}/albums`,
      access_token: res.access_token,
    });
    const jsonAlbumRes = await albumResponse.json();

    jsonAlbumRes.items.forEach(async (item) => {
      if (item.available_markets.find((market) => market === "US")) {
        await Album.insert({
          name: item.name,
          spotifyId: item.id,
          spotifyUrl: item.external_urls.spotify,
          artistId: 1,
          albumType: item.album_type,
          releaseDate: item.release_date,
          largeImageUrl: item.images[0].url,
          smallImageUrl: item.images[1].url,
          thumbnailUrl: item.images[2].url,
          totalTracks: item.total_tracks,
        });
        // returnIds.push(id);
      }
    });

    // 3. Tracks
    const albums = await Album.find();

    albums.forEach(async (album) => {
      const tracksResponse = await baseRequest({
        slug: `albums/${album.spotifyId}/tracks`,
        access_token: res.access_token,
      });

      const jsonTracksRes = await tracksResponse.json();
      jsonTracksRes.items.forEach(async (track) => {
        console.log("1");
        await Track.insert({
          name: track.name,
          spotifyId: track.id,
          spotifyUrl: track.external_urls.spotify,
          albumId: album.id,
          trackNumber: track.track_number,
          durationMs: track.duration_ms,
          previewUrl: track.preview_url,
        }).then(async () => {});
      });
    });

    res.status(200).json({ message: "success" });
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
});

router.get("/audio-data", authSpotify, async (req, res) => {
  // 4. get audio features for track
  try {
    const hasAudioFeatures = await AudioFeature.find();
    if (hasAudioFeatures.length) {
      return res
        .status(400)
        .json({ message: "Audio Features already exists in DB." });
    }
    const tracks = await Track.findRaw();
    tracks.forEach(async (track) => {
      const audioFeatureResponse = await baseRequest({
        slug: `audio-features/${track.spotifyId}`,
        access_token: res.access_token,
      });
      const jsonAudioFeatureRes = await audioFeatureResponse.json();
      await AudioFeature.insert({
        spotifyId: jsonAudioFeatureRes.id,
        spotifyUrl: jsonAudioFeatureRes.uri,
        trackId: track.id,
        danceability: jsonAudioFeatureRes.danceability,
        energy: jsonAudioFeatureRes.energy,
        key: jsonAudioFeatureRes.key,
        loudness: jsonAudioFeatureRes.loudness,
        mode: jsonAudioFeatureRes.mode,
        speechiness: jsonAudioFeatureRes.speechiness,
        acousticness: jsonAudioFeatureRes.acousticness,
        instrumentalness: jsonAudioFeatureRes.instrumentalness,
        liveness: jsonAudioFeatureRes.liveness,
        valence: jsonAudioFeatureRes.valence,
        tempo: jsonAudioFeatureRes.tempo,
        timeSignature: jsonAudioFeatureRes.time_signature,
        trackHref: jsonAudioFeatureRes.track_href,
        analysisUrl: jsonAudioFeatureRes.analysis_url,
      });
    });

    res.status(200).json({ message: "success" });
  } catch (error) {
    console.log(error);
  }
});

module.exports = router;
