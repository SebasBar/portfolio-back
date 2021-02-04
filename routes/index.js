const router = require("express").Router();
const sebasRoutes = require("./sebasbar.routes");
const projectRoutes = require("./projects.routes");
const { projects } = require("../config/prisma-config");

router.get("/", (req, res, next) => {
  res.json({
    ok: "thanks to the 1000 gods I commend my prays that it is working:)",
  });
});

router.use("/sebasbar", sebasRoutes);
router.use("/sebasbar", projectRoutes);

module.exports = router;
