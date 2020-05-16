exports.up = function (knex, Promise) {
  return knex.schema.createTable("artists", (table) => {
    table.increments();
    table.string("spotifyId", 255).notNullable();
    table.string("name").notNullable();
    table.string("spotifyUrl").notNullable();
    table.integer("followers").notNullable();
    table.timestamps(true, true);
  });
};

exports.down = function (knex, Promise) {
  return knex.schema.dropTableIfExists("artists");
};
