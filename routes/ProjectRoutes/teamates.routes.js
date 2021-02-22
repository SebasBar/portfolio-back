const {
  createTeamate,
  getTeamate,
  getOneTeamate,
  deleteTeamate,
  updateTeamate,
} = require("../../controller/ProjectController/teamates.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/:projectId", authenticationMiddleware, createTeamate);
router.get("/", getTeamate);
router.get("/:teamateId", getOneTeamate);
router.delete("/teamate/:teamateId", authenticationMiddleware, deleteTeamate);
router.put("/teamate/:teamateId", authenticationMiddleware, updateTeamate);

module.exports = router;
