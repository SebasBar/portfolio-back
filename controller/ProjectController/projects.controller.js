const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createProject = async (req, res, next) => {
  try {
    const {
      name,
      description,
      description2,
      description3,
      github_link,
      deployed_link,
    } = req.body;
    const newProject = await client.projects.create({
      data: {
        name,
        description,
        description2,
        description3,
        github_link,
        deployed_link,
      },
    });
    await client.sebasBar.update({
      where: { id: 1 },
      data: { projects: { connect: { id: newProject.id } } },
    });
    res.status(200).json(newProject);
  } catch (err) {
    next(err);
  }
};

exports.createProjectNoConnected = async (req, res, next) => {
  try {
    const {
      name,
      description,
      description2,
      description3,
      github_link,
      deployed_link,
    } = req.body;
    const newProject = await client.projects.create({
      data: {
        name,
        description,
        description2,
        description3,
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
      // include: {
      //   pictures: true,
      //   tech_lang: true,
      //   clients: true,
      //   teamates: true,
      // },
    });
    if (!projectInfo) {
      throw createError(404, "information not found");
    }
    res.status(200).json(projectInfo);
  } catch (err) {
    next(err);
  }
};

exports.getOneProject = async (req, res, next) => {
  try {
    const projectId = Number(req.params.projectId);
    const project = await client.projects.findUnique({
      where: { id: projectId },
      include: {
        pictures: true,
        tech_lang: true,
        clients: true,
        teamates: true,
      },
    });
    if (!project) {
      throw createError(404, "information not found");
    }
    res.status(200).json(project);
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
    const {
      name,
      description,
      description2,
      description3,
      github_link,
      deployed_link,
    } = req.body;
    const updatedProject = await client.projects.update({
      where: { id: projectId },
      data: {
        name,
        description,
        description2,
        description3,
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

//connecy tables with the project

exports.connectTechLang = async (req, res, next) => {
  try {
    const projectId = Number(req.params.projectId);
    const techLangId = req.body.techLangId;
    const techLang = await client.tech_Lang.findUnique({
      where: { id: techLangId },
    });
    if (!techLang) {
      throw createError(404, "Technical language not found");
    }
    const updatedProject = await client.projects.update({
      where: { id: projectId },
      data: { tech_lang: { connect: { id: techLangId } } },
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

exports.connectClient = async (req, res, next) => {
  try {
    const projectId = Number(req.params.projectId);
    const clientId = req.body.clientId;
    console.log(`clientId: ${clientId}`);
    console.log(`projectId: ${projectId}`);
    const clients = await client.clients.findUnique({
      where: { id: clientId },
    });
    if (!clients) {
      throw createError(404, "Client not found");
    }
    const updatedProject = await client.projects.update({
      where: { id: projectId },
      data: { clients: { connect: { id: clientId } } },
      include: {
        clients: true,
      },
    });
    res.status(200).json(updatedProject);
  } catch (err) {
    next(err);
  }
};

exports.connectTeamate = async (req, res, next) => {
  try {
    const projectId = Number(req.params.projectId);
    const teamateId = req.body.teamateId;
    const teamate = await client.teamates.findUnique({
      where: { id: teamateId },
    });
    if (!teamate) {
      throw createError(404, "Teamate not found");
    }
    const updatedProject = await client.projects.update({
      where: { id: projectId },
      data: { teamates: { connect: { id: teamateId } } },
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

exports.connectPicture = async (req, res, next) => {
  try {
    const projectId = Number(req.params.projectId);
    const pictureId = req.body.pictureId;
    const picture = await client.pictures.findUnique({
      where: { id: pictureId },
    });
    if (!picture) {
      throw createError(404, "Picture not found");
    }
    const updatedProject = await client.projects.update({
      where: { id: projectId },
      data: { pictures: { connect: { id: pictureId } } },
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
