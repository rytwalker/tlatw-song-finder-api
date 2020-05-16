const BaseModel = require("./BaseModel");
const db = require("../db/config");

class Artist extends BaseModel {
  static async find() {
    try {
      return await db("artists");
    } catch (error) {
      console.log(error);
    }
  }

  static async insert({ name, spotifyId, spotifyUrl, followers }) {
    try {
      const [id] = await db("artists").insert(
        {
          name,
          spotifyId,
          spotifyUrl,
          followers,
        },
        "spotifyId"
      );
      return id;
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = Artist;
