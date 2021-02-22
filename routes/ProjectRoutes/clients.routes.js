const {
  createClient,
  getClients,
  getOneClient,
  deleteClient,
  updateClient,
} = require("../../controller/ProjectController/clients.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/:projectId", authenticationMiddleware, createClient);
router.get("/", getClients);
router.get("/:clientId", getOneClient);
router.delete("/client/:clientId", authenticationMiddleware, deleteClient);
router.put("/client/:clientId", authenticationMiddleware, updateClient);

module.exports = router;
