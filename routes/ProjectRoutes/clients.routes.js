const {
  createClient,
  getClient,
  deleteClient,
  updateClient,
} = require("../../controller/ProjectController/clients.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/:projectId", authenticationMiddleware, createClient);
router.get("/", getClient);
router.delete("/client/:clientId", authenticationMiddleware, deleteClient);
router.put("/client/:clientId", authenticationMiddleware, updateClient);

module.exports = router;
