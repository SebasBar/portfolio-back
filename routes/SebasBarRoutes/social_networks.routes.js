const {
  createSocialNetwork,
  getSocialNetworks,
  deleteSocialNetwork,
  updateSocialNetwork,
} = require("../../controller/SebasBarController/social_networks.controller");

const router = require("express").Router();

const authenticationMiddleware = require("../../middleware/auth.middleware");

router.post("/", authenticationMiddleware, createSocialNetwork);
router.get("/", getSocialNetworks);
router.delete(
  "/socialnetwork/:socialNetworkId",
  authenticationMiddleware,
  deleteSocialNetwork
);
router.put(
  "/socialnetwork/:socialNetworkId",
  authenticationMiddleware,
  updateSocialNetwork
);

module.exports = router;
