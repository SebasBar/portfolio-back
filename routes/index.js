const router = require("express").Router();
const sebasRoutes = require("./sebasbar.routes");
const projectRoutes = require("./projects.routes");
const authRoutes = require("./auth.routes");
const socialNetworkRoutes = require("./social_networks.routes");
const emailsRoutes = require("./emails.routes");
const { emails } = require("../config/prisma-config");

router.get("/", (req, res, next) => {
  res.json({
    ok: "thanks to the 10000 gods I commend my prays that this is working:)",
  });
});

router.use("/sebasbar", sebasRoutes);
router.use("/projects", projectRoutes);
router.use("/auth", authRoutes);
router.use("/socialnetworks", socialNetworkRoutes);
router.use("/emails", emailsRoutes);

module.exports = router;
