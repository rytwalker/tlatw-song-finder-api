const express = require("express");
const fetch = require("node-fetch");
const { URLSearchParams } = require("url");
const SpotifyWebApi = require("spotify-web-api-node");
const btoa = require("btoa");
const router = express.Router();

router.get("/", async (_req, res) => {
  const clientId = "52f003f8b2e543b3bec5cc38f3bb3f54";
  const clientSecret = "34f406ea24f44102a04411f922361984";
  const headerToken = btoa(clientId + ":" + clientSecret);
  const params = new URLSearchParams("grant_type=client_credentials");
  try {
    const authResponse = await fetch("https://accounts.spotify.com/api/token", {
      method: "post",
      body: params.toString(),
      headers: {
        Authorization: `Basic ${headerToken}`,
        "Content-Type": "application/x-www-form-urlencoded",
      },
    });
    const { access_token } = await authResponse.json();
    const response = await fetch(
      "https://api.spotify.com/v1/artists/6ls5A8Wys9Swixpz4v6kj3/albums",
      {
        method: "get",
        headers: {
          Authorization: `Bearer ${access_token}`,
        },
      }
    );
    const jsonRes = await response.json();
    res.status(200).json(jsonRes);
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
});

module.exports = router;
