exports.up = function (knex, Promise) {
  return knex.schema.createTable("tracks", (table) => {
    table.increments();
    table
      .integer("albumId")
      .unsigned()
      .references("id")
      .inTable("albums")
      .notNullable();
    table.string("spotifyId", 255).notNullable();
    table.string("spotifyUrl").notNullable();
    table.integer("trackNumber").notNullable();
    table.integer("durationMs").notNullable();
    table.string("name").notNullable();
    table.string("previewUrl").notNullable();

    table.timestamps(true, true);
  });
};

exports.down = function (knex, Promise) {
  return knex.schema.dropTableIfExists("tracks");
};
