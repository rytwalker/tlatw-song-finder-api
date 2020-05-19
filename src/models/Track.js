const BaseModel = require("./BaseModel");
const db = require("../db/config");

class Track extends BaseModel {
  static async find() {
    try {
      const tracks = await db("tracks as t").join(
        "audio-features as af",
        "t.id",
        "af.trackId"
      );
      const albums = await db("albums").where((builder) =>
        builder.whereIn("id", [1, 2, 3, 4, 5, 6, 9, 10])
      );
      const useableAlbums = new Set([1, 2, 3, 4, 5, 6, 9, 10]);
      const filtered = tracks.filter((track) =>
        useableAlbums.has(track.albumId)
      );
      return filtered.map((t) => ({
        ...t,
        album: albums.find((a) => a.id === t.albumId),
      }));
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
