const { login } = require("../controller/auth.controller");

const router = require("express").Router();

router.post("/login/:credentialId", login);

module.exports = router;
