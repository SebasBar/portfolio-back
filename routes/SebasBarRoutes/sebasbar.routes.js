const {
  createSebasInfo,
  getSebasInfo,
  getCredentials,
  updateSebasInfo,
  deleteSebasInfo,
  connectProject,
  connectPhone,
  connectEmail,
  connectSocialNetwork,
  connectDocument,
  connectEducation,
  connectSpecialknowledge,
  connectWorkExperience,
} = require("../../controller/SebasBarController/sebasbar.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createSebasInfo);
router.put("/", authenticationMiddleware, updateSebasInfo);
router.get("/", getSebasInfo);
router.get("/credentials", authenticationMiddleware, getCredentials);
router.delete("/delete", authenticationMiddleware, deleteSebasInfo);
router.put("/project/:projectId", connectProject);
router.put("/phone/:phoneId", connectPhone);
router.put("/email/:emailId", connectEmail);
router.put("/socialnetwork/:socialNetworkId", connectSocialNetwork);
router.put("/document/:documentId", connectDocument);
router.put("/education/:educationId", connectEducation);
router.put("/specialknowledge/:specialknowledgeId", connectSpecialknowledge);
router.put("/workexperience/:workexperienceId", connectWorkExperience);

module.exports = router;
