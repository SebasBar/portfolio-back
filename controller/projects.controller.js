const { projects } = require("../config/prisma-config");
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

exports.deleteProject = async (req, res, next) => {
  try {
    const projectId = Number(req.params.projectId);
    const project = await client.projects.findUnique({
      where: { id: projectId },
    });
    if (!project) {
      throw createError(404, "Project not found");
    }
    const deletedProject = await client.projects.delete({
      where: { id: projectId },
    });
    res.status(200).json(deletedProject);
  } catch (err) {
    next(err);
  }
};

exports.updateProject = async (req, res, next) => {
  try {
    const projectId = Number(req.params.projectId);
    const { name, description, github_link, deployed_link } = req.body;
    const updatedProject = await client.projects.update({
      where: { id: projectId },
      data: {
        name,
        description,
        github_link,
        deployed_link,
      },
      include: {
        pictures: true,
        tech_lang: true,
        clients: true,
        teamates: true,
      },
    });
    res.status(200).json(updatedProject);
  } catch (err) {
    next(err);
  }
};
