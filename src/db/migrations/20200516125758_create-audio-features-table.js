exports.up = function (knex, Promise) {
  return knex.schema.createTable("audio-features", (table) => {
    table.increments();
    table
      .integer("trackId")
      .unsigned()
      .references("id")
      .inTable("tracks")
      .notNullable();
    table.string("spotifyId", 255).notNullable();
    table.string("spotifyUrl").notNullable();
    table.float("danceability").notNullable();
    table.float("energy").notNullable();
    table.integer("key").notNullable();
    table.float("loudness").notNullable();
    table.integer("mode").notNullable();
    table.float("speechiness").notNullable();
    table.float("acousticness").notNullable();
    table.float("instrumentalness").notNullable();
    table.float("liveness").notNullable();
    table.float("valence").notNullable();
    table.float("tempo").notNullable();
    table.integer("timeSignature").notNullable();
    table.string("trackHref").notNullable();
    table.string("analysisUrl").notNullable();

    table.timestamps(true, true);
  });
};

exports.down = function (knex, Promise) {
  return knex.schema.dropTableIfExists("audio-features");
};
