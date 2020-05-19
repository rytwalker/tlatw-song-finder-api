const express = require("express");
const SearchController = require("../controllers/SearchController");

const router = express.Router();

router.post("/", SearchController.query);

module.exports = router;
