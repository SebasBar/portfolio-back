const {
  createProject,
  getProjects,
  deleteProject,
  updateProject,
  createProjectNoConnected,
  connectTechLang,
  connectClient,
  connectTeamate,
  connectPicture,
} = require("../../controller/ProjectController/projects.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createProject);
router.post(
  "/projectnoconnected",
  authenticationMiddleware,
  createProjectNoConnected
);
router.get("/", getProjects);
router.delete("/project/:projectId", authenticationMiddleware, deleteProject);
router.put("/project/:projectId", authenticationMiddleware, updateProject);
router.put("/techlang/:projectId", connectTechLang);
router.put("/client/:projectId", connectClient);
router.put("/teamate/:projectId", connectTeamate);
router.put("/picture/:projectId", connectPicture);

module.exports = router;
