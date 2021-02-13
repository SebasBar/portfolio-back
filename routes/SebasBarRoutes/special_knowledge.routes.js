const {
  createSpecialKnowledge,
  getSpecialKnowledge,
  deleteSpecialKnowledge,
  updateSpecialKnowledge,
} = require("../../controller/SebasBarController/special_knowledge.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createSpecialKnowledge);
router.get("/", getSpecialKnowledge);
router.delete(
  "/specialknowledge/:specialknowledgeId",
  authenticationMiddleware,
  deleteSpecialKnowledge
);
router.put(
  "/specialknowledge/:specialknowledgeId",
  authenticationMiddleware,
  updateSpecialKnowledge
);

module.exports = router;
