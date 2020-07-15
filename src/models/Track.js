const BaseModel = require("./BaseModel");
const db = require("../db/config");

const USEABLE_ALBUMS = [1, 2, 3, 4, 5, 6, 9, 10];

class Track extends BaseModel {
  static async find() {
    try {
      const tracks = await db("tracks as t").join(
        "audio-features as af",
        "t.id",
        "af.trackId"
      );
      // console.log(tracks);
      const albums = await db("albums").where((builder) =>
        builder.whereIn("id", USEABLE_ALBUMS)
      );
      const useableAlbums = new Set(USEABLE_ALBUMS);
      return tracks
        .filter((track) => useableAlbums.has(track.albumId))
        .map((t) => ({
          ...t,
          album: albums.find((a) => a.id === t.albumId),
        }));
    } catch (error) {
      console.log(error);
    }
  }

  static async findRaw() {
    try {
      return await db("tracks");
    } catch (error) {
      console.log(error);
    }
  }

  static async insert({
    name,
    spotifyId,
    spotifyUrl,
    albumId,
    trackNumber,
    durationMs,
    previewUrl,
  }) {
    try {
      const [id] = await db("tracks").insert(
        {
          name,
          spotifyId,
          spotifyUrl,
          albumId,
          trackNumber,
          durationMs,
          previewUrl,
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
      await db("tracks").where({ id }).del();
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = Track;
