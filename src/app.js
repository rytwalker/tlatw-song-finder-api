const express = require("express");
const bodyParser = require("body-parser");
const router = require("./routes/index");
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use("/", router);
app.get("/", (_req, res) => {
  res.json({ message: "hello" });
});

module.exports = app;
