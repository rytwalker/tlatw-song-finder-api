const BaseModel = require("./BaseModel");
const db = require("../db/config");

class AudioFeature extends BaseModel {
  static async find() {
    try {
      return await db("audio-features");
    } catch (error) {
      console.log(error);
    }
  }

  static async insert({
    spotifyId,
    spotifyUrl,
    trackId,
    danceability,
    energy,
    key,
    loudness,
    mode,
    speechiness,
    acousticness,
    instrumentalness,
    liveness,
    valence,
    tempo,
    timeSignature,
    trackHref,
    analysisUrl,
  }) {
    try {
      const [id] = await db("audio-features").insert(
        {
          spotifyId,
          spotifyUrl,
          trackId,
          danceability,
          energy,
          key,
          loudness,
          mode,
          speechiness,
          acousticness,
          instrumentalness,
          liveness,
          valence,
          tempo,
          timeSignature,
          trackHref,
          analysisUrl,
        },
        "spotifyId"
      );
      return id;
    } catch (error) {
      console.log(error);
    }
  }

  static async remove(id) {
    try {
      await db("audio-features").where({ id }).del();
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = AudioFeature;
