const {
  createProject,
  getProjects,
} = require("../controller/projects.controller");

const router = require("express").Router();

router.post("/projects", createProject);
router.get("/projects", getProjects);

module.exports = router;
