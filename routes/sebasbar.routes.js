const {
  createSebasInfo,
  getSebasInfo,
} = require("../controller/sebasbar.controller");

const router = require("express").Router();

router.post("/", createSebasInfo);
router.get("/", getSebasInfo);

module.exports = router;
