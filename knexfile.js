require("dotenv").config();

module.exports = {
  development: {
    client: "pg",
    connection: "postgres://localhost/tlatw",
    migrations: {
      directory: "./src/db/migrations",
    },
    seeds: {
      directory: "./src/db/seeds/dev",
    },
    useNullAsDefault: true,
  },

  test: {
    client: "pg",
    connection: "postgres://localhost/tlatw_test",
    migrations: {
      directory: "./src/db/migrations",
    },
    seeds: {
      directory: "./src/db/seeds/test",
    },
    useNullAsDefault: true,
  },

  production: {
    client: "pg",
    connection: process.env.DATABASE_URL + "?ssl=true",
    migrations: {
      directory: "./src/db/migrations",
    },
    seeds: {
      directory: "./src/db/seeds/production",
    },
    useNullAsDefault: true,
  },
};
