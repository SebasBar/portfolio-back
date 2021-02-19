const router = require("express").Router();
const express = require("express");
const app = express();
const path = require("path");
const sebasRoutes = require("./SebasBarRoutes/sebasbar.routes");
const projectRoutes = require("./ProjectRoutes/projects.routes");
const authRoutes = require("./SecurityRoutes/auth.routes");
const socialNetworkRoutes = require("./SebasBarRoutes/social_networks.routes");
const emailsRoutes = require("./SebasBarRoutes/emails.routes");
const phonesRoutes = require("./SebasBarRoutes/phones.routes");
const educationRoutes = require("./SebasBarRoutes/education.routes");
const specialKnowledgeRoutes = require("./SebasBarRoutes/special_knowledge.routes");
const workExperienceRoutes = require("./SebasBarRoutes/work_experience.routes");
const techLangRoutes = require("./ProjectRoutes/tech_lang.routes");
const clientRoutes = require("./ProjectRoutes/clients.routes");
const teamatesRoutes = require("./ProjectRoutes/teamates.routes");
const picturesRoutes = require("./ProjectRoutes/pictures.routes");

// router.get("/", (req, res, next) => {
//   res.json({
//     ok: "thanks to the 10000 gods I commend my prays that this is working:)",
//   });
// });

router.use("/sebasbar", sebasRoutes);
router.use("/projects", projectRoutes);
router.use("/auth", authRoutes);
router.use("/socialnetworks", socialNetworkRoutes);
router.use("/emails", emailsRoutes);
router.use("/phones", phonesRoutes);
router.use("/education", educationRoutes);
router.use("/specialknowledge", specialKnowledgeRoutes);
router.use("/workexperience", workExperienceRoutes);
router.use("/techlang", techLangRoutes);
router.use("/client", clientRoutes);
router.use("/teamates", teamatesRoutes);
router.use("/pictures", picturesRoutes);

module.exports = router;
