const {
  createDocument,
  getDocuments,
  deleteDocument,
  updateDocument,
} = require("../../controller/SebasBarController/documents.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createDocument);
router.get("/", getDocuments);
router.delete(
  "/document/:documentId",
  authenticationMiddleware,
  deleteDocument
);
router.put("/document/:documentId", authenticationMiddleware, updateDocument);

module.exports = router;
