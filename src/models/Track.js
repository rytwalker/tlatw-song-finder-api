const BaseModel = require("./BaseModel");
const db = require("../db/config");

class Track extends BaseModel {
  static async find() {
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
