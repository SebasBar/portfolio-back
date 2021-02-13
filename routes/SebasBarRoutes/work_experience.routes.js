const {
  createWorkExperience,
  getWorkExperience,
  deleteWorkExperience,
  updateWorkexperience,
} = require("../../controller/SebasBarController/work_experience.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createWorkExperience);
router.get("/", getWorkExperience);
router.delete(
  "/workexperience/:workexperienceId",
  authenticationMiddleware,
  deleteWorkExperience
);
router.put(
  "/workexperience/:workexperienceId",
  authenticationMiddleware,
  updateWorkexperience
);

module.exports = router;
