exports.up = function (knex, Promise) {
  return knex.schema.createTable("albums", (table) => {
    table.increments();
    table
      .integer("artistId")
      .unsigned()
      .references("id")
      .inTable("artists")
      .notNullable();
    table.string("spotifyId", 255).notNullable();
    table.string("spotifyUrl").notNullable();
    table.string("albumType");
    table.string("name").notNullable();
    table.string("releaseDate").notNullable();
    table.string("largeImageUrl").notNullable();
    table.string("smallImageUrl").notNullable();
    table.string("thumbnailUrl").notNullable();
    table.integer("totalTracks").notNullable();

    table.timestamps(true, true);
  });
};

exports.down = function (knex, Promise) {
  return knex.schema.dropTableIfExists("albums");
};
