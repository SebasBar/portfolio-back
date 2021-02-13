const {
  createPhone,
  getPhones,
  deletePhone,
  updatePhone,
} = require("../../controller/SebasBarController/phones.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createPhone);
router.get("/", getPhones);
router.delete("/phone/:phoneId", authenticationMiddleware, deletePhone);
router.put("/phone/:phoneId", authenticationMiddleware, updatePhone);

module.exports = router;
