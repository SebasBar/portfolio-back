const {
  createProject,
  getProjects,
  deleteProject,
  updateProject,
} = require("../controller/projects.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createProject);
router.get("/", getProjects);
router.delete("/project/:projectId", authenticationMiddleware, deleteProject);
router.put("/project/:projectId", updateProject);

module.exports = router;
