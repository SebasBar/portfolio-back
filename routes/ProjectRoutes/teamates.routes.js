const {
  createTeamate,
  getTeamates,
  getOneTeamate,
  deleteTeamate,
  updateTeamate,
} = require("../../controller/ProjectController/teamates.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createTeamate);
router.get("/", getTeamates);
router.get("/:teamateId", getOneTeamate);
router.delete("/teamate/:teamateId", authenticationMiddleware, deleteTeamate);
router.put("/teamate/:teamateId", authenticationMiddleware, updateTeamate);

module.exports = router;
