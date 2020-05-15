const express = require("express");
const router = require("./routes/index");
const app = express();

app.use("/", router);
app.get("/", (_req, res) => {
  res.json({ message: "hello" });
});

module.exports = app;
