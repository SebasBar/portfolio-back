const {
  createPicture,
  getPictures,
  deletePicture,
  updatePicture,
} = require("../../controller/ProjectController/pictures.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/:projectId", authenticationMiddleware, createPicture);
router.get("/", getPictures);
router.delete("/picture/:pictureId", authenticationMiddleware, deletePicture);
router.put("/picture/:pictureId", authenticationMiddleware, updatePicture);

module.exports = router;
