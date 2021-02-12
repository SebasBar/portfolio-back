const {
  createEmail,
  getEmails,
  deleteEmail,
  updateEmail,
} = require("../controller/emails.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createEmail);
router.get("/", getEmails);
router.delete("/emails/:emailId", authenticationMiddleware, deleteEmail);
router.put("/emails/:emailId", updateEmail);

module.exports = router;
