const {
  createTechLang,
  getTechLang,
  deleteTechLang,
  updateTechLang,
} = require("../../controller/ProjectController/tech_lang.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/:projectId", authenticationMiddleware, createTechLang);
router.get("/", getTechLang);
router.delete(
  "/techlang/:techlangId",
  authenticationMiddleware,
  deleteTechLang
);
router.put("/techlang/:techlangId", authenticationMiddleware, updateTechLang);

module.exports = router;
