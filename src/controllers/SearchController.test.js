process.env.NODE_ENV = "test";

const request = require("supertest");
const app = require("../app");

describe("/api/search", () => {
  describe("POST search query", () => {
    let searchParams = {
      tempo: [100, 150],
      mode: [0, 1],
      keys: [0, 2, 5],
      happiness: 0.6,
      energy: 0.7,
      danceability: 0.8,
      acousticness: 0.1,
      instrumentalness: 0.1,
    };
    it("should return a status of 200", async (done) => {
      let response = await request(app).post("/api/search").send(searchParams);
      expect(response.status).toBe(200);
      done();
    });
    it("should have a length of 20 tracks", async (done) => {
      response = await request(app).post("/api/search").send(searchParams);
      expect(response.body.length).toBe(20);
      done();
    });
    it("should return 0 tracks if the key is C#/Db", async (done) => {
      searchParams.keys = [1];
      response = await request(app).post("/api/search").send(searchParams);
      expect(response.body.length).toBe(0);
      done();
    });
  });
});
