const router = require("express").Router();
const sebasRoutes = require("./sebasbar.routes");
const projectRoutes = require("./projects.routes");
const authRoutes = require("./auth.routes");

router.get("/", (req, res, next) => {
  res.json({
    ok: "thanks to the 1000 gods I commend my prays that it is working:)",
  });
});

router.use("/sebasbar", sebasRoutes);
router.use("/projects", projectRoutes);
router.use("/auth", authRoutes);

module.exports = router;
