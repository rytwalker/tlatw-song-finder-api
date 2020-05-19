const BaseModel = require("./BaseModel");
const db = require("../db/config");

class Album extends BaseModel {
  static async find(field = null) {
    try {
      if (field && field.id) {
        return await db("albums").where({ id: field.id }).first();
      } else {
        return await db("albums");
      }
    } catch (error) {
      console.log(error);
    }
  }

  static async insert({
    name,
    spotifyId,
    spotifyUrl,
    artistId,
    albumType,
    releaseDate,
    largeImageUrl,
    smallImageUrl,
    thumbnailUrl,
    totalTracks,
  }) {
    try {
      const [id] = await db("albums").insert(
        {
          name,
          spotifyId,
          spotifyUrl,
          artistId,
          albumType,
          releaseDate,
          largeImageUrl,
          smallImageUrl,
          thumbnailUrl,
          totalTracks,
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
      await db("albums").where({ id }).del();
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = Album;
