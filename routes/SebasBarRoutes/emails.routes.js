const {
  createEmail,
  getEmails,
  deleteEmail,
  updateEmail,
} = require("../../controller/SebasBarController/emails.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createEmail);
router.get("/", getEmails);
router.delete("/email/:emailId", authenticationMiddleware, deleteEmail);
router.put("/email/:emailId", authenticationMiddleware, updateEmail);

module.exports = router;
