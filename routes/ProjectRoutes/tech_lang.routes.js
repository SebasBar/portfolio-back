const {
  createTechLang,
  getTechLang,
  getOneTechLang,
  deleteTechLang,
  updateTechLang,
} = require("../../controller/ProjectController/tech_lang.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/:projectId", authenticationMiddleware, createTechLang);
router.get("/", getTechLang);
router.get("/:techlangId", getOneTechLang);
router.delete(
  "/techlang/:techlangId",
  authenticationMiddleware,
  deleteTechLang
);
router.put("/techlang/:techlangId", authenticationMiddleware, updateTechLang);

module.exports = router;
