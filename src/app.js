require("dotenv").config();
const express = require("express");
const Sentry = require("@sentry/node");
const bodyParser = require("body-parser");
const cors = require("cors");
const router = require("./routes/index");

const app = express();
Sentry.init({
  dsn:
    "https://59ceee01f1f445dd9af42f40161deb3c@o395901.ingest.sentry.io/5248539",
});

app.use(Sentry.Handlers.requestHandler());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());
app.use("/", router);
app.get("/", (_req, res) => {
  res.json({ message: "hello" });
});
app.get("/debug-sentry", function mainHandler(req, res) {
  throw new Error("My first Sentry error!");
});

// Sentry error handlers
app.use(Sentry.Handlers.errorHandler());

// Optional fallthrough error handler
app.use(function onError(err, req, res, next) {
  // The error id is attached to `res.sentry` to be returned
  // and optionally displayed to the user for support.
  res.statusCode = 500;
  res.end(res.sentry + "\n");
});

module.exports = app;
