const {
  createEducation,
  getEducation,
  deleteEducation,
  updateEducation,
} = require("../../controller/SebasBarController/education.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createEducation);
router.get("/", getEducation);
router.delete(
  "/education/:educationId",
  authenticationMiddleware,
  deleteEducation
);
router.put(
  "/education/:educationId",
  authenticationMiddleware,
  updateEducation
);

module.exports = router;
