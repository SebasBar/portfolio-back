const client = require("../config/prisma-config");

exports.createProject = async (req, res, next) => {
  try {
    const { name, description, github_link, deployed_link } = req.body;
    const newProject = await client.projects.create({
      data: {
        name,
        description,
        github_link,
        deployed_link,
      },
    });
    res.status(200).json(newProject);
  } catch (err) {
    next(err);
  }
};

exports.getProjects = async (req, res, next) => {
  try {
    const projectInfo = await client.projects.findMany({
      include: {
        pictures: true,
        tech_lang: true,
        clients: true,
        teamates: true,
      },
    });
    if (!projectInfo) {
      throw createError(404, "information not found");
    }
    res.status(200).json(projectInfo);
  } catch (err) {
    next(err);
  }
};
