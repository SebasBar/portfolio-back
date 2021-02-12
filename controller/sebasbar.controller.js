const { PrismaClient } = require("@prisma/client");
const client = new PrismaClient();
const createError = require("http-errors");
const { credentials } = require("../config/prisma-config");

exports.createSebasInfo = async (req, res, next) => {
  try {
    const { first_name, last_name, picture, github_page } = req.body;
    const newInfo = await client.sebasBar.create({
      data: {
        first_name,
        last_name,
        picture,
        github_page,
      },
    });
    res.status(200).json(newInfo);
  } catch (err) {
    next(err);
  }
};

exports.updateSebasInfo = async (req, res, next) => {
  try {
    const { first_name, last_name, picture, github_page } = req.body;
    const updatedSebasInfo = await client.sebasBar.update({
      where: { id: 1 },
      data: {
        first_name,
        last_name,
        picture,
        github_page,
      },
      include: {
        credentials: true,
        phones: true,
        emails: true,
        social_networks: true,
        documents: true,
        education: true,
        special_knowledge: true,
        work_experience: true,
        projects: true,
      },
    });
    res.status(200).json(updatedSebasInfo);
  } catch (err) {
    next(err);
  }
};

exports.getSebasInfo = async (req, res, next) => {
  try {
    const sebasInfo = await client.sebasBar.findUnique({
      where: { id: 1 },
      include: {
        phones: true,
        emails: true,
        social_networks: true,
        documents: true,
        special_knowledge: true,
        work_experience: true,
        projects: true,
      },
    });
    if (!sebasInfo) {
      throw createError(404, "information not found");
    }
    res.status(200).json(sebasInfo);
  } catch (err) {
    next(err);
  }
};

exports.getCredentials = async (req, res, next) => {
  try {
    const credentials = await client.credentials.findUnique({
      where: { id: 1 },
    });
    if (!credentials) {
      throw createError(404, "information not found");
    }
    res.status(200).json(credentials);
  } catch (err) {
    next(err);
  }
};

exports.deleteSebasInfo = async (req, res, next) => {
  try {
    const deletedSebasInfo = await client.sebasBar.delete({
      where: { id: 1 },
    });
    res.status(200).json(deletedSebasInfo);
  } catch (err) {
    next(err);
  }
};

//connect tables with the user

exports.connectProject = async (req, res, next) => {
  try {
    const projectId = Number(req.params.projectId);
    const project = await client.projects.findUnique({
      where: { id: projectId },
    });
    if (!project) {
      throw createError(404, "Project not found");
    }
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { projects: { connect: { id: projectId } } },
      include: { projects: true },
    });
    res.status(200).json(updatedSebasBar);
  } catch (err) {
    next(err);
  }
};

exports.connectPhone = async (req, res, next) => {
  try {
    const phoneId = Number(req.params.phoneId);
    const phone = await client.phones.findUnique({
      where: { id: phoneId },
    });
    if (!phone) {
      throw createError(404, "Phone not found");
    }
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { phones: { connect: { id: phoneId } } },
      include: { phones: true },
    });
    res.status(200).json(updatedSebasBar);
  } catch (err) {
    next(err);
  }
};

exports.connectEmail = async (req, res, next) => {
  try {
    const emailId = Number(req.params.emailId);
    const email = await client.emails.findUnique({
      where: { id: emailId },
    });
    if (!email) {
      throw createError(404, "Email not found");
    }
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { emails: { connect: { id: emailId } } },
      include: { emails: true },
    });
    res.status(200).json(updatedSebasBar);
  } catch (err) {
    next(err);
  }
};

exports.connectSocialNetwork = async (req, res, next) => {
  try {
    const socialNetworkId = Number(req.params.socialNetworkId);
    const socialNetwork = await client.social_Networks.findUnique({
      where: { id: socialNetworkId },
    });
    if (!socialNetwork) {
      throw createError(404, "SocialNetwork not found");
    }
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { social_networks: { connect: { id: socialNetworkId } } },
      include: { social_networks: true },
    });
    res.status(200).json(updatedSebasBar);
  } catch (err) {
    next(err);
  }
};

exports.connectDocument = async (req, res, next) => {
  try {
    const documentId = Number(req.params.documentId);
    const document = await client.documents.findUnique({
      where: { id: documentId },
    });
    if (!document) {
      throw createError(404, "Document not found");
    }
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { documents: { connect: { id: documentId } } },
      include: { documents: true },
    });
    res.status(200).json(updatedSebasBar);
  } catch (err) {
    next(err);
  }
};

exports.connectEducation = async (req, res, next) => {
  try {
    const educationId = Number(req.params.educationId);
    const education = await client.education.findUnique({
      where: { id: educationId },
    });
    if (!education) {
      throw createError(404, "Education not found");
    }
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { education: { connect: { id: educationId } } },
      include: { education: true },
    });
    res.status(200).json(updatedSebasBar);
  } catch (err) {
    next(err);
  }
};

exports.connectSpecialknowledge = async (req, res, next) => {
  try {
    const specialknowledgeId = Number(req.params.specialknowledgeId);
    const specialknowledge = await client.special_Knowledge.findUnique({
      where: { id: specialknowledgeId },
    });
    if (!specialknowledge) {
      throw createError(404, "Special_knowledge not found");
    }
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { special_knowledge: { connect: { id: specialknowledgeId } } },
      include: { special_knowledge: true },
    });
    res.status(200).json(updatedSebasBar);
  } catch (err) {
    next(err);
  }
};

exports.connectWorkExperience = async (req, res, next) => {
  try {
    const workexperienceId = Number(req.params.workexperienceId);
    const workexperience = await client.work_Experience.findUnique({
      where: { id: workexperienceId },
    });
    if (!workexperience) {
      throw createError(404, "Work experience not found");
    }
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { work_experience: { connect: { id: workexperienceId } } },
      include: { work_experience: true },
    });
    res.status(200).json(updatedSebasBar);
  } catch (err) {
    next(err);
  }
};
