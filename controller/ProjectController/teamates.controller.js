const client = require("../../config/prisma-config");
const createError = require("http-errors");

//is not adding the github link

exports.createTeamate = async (req, res, next) => {
  try {
    const { name, github_link } = req.body;
    const newTeamate = await client.teamates.create({
      data: {
        name,
        github_link,
      },
    });
    res.status(200).json(newTeamate);
  } catch (err) {
    next(err);
  }
};

exports.getTeamates = async (req, res, next) => {
  try {
    const teamates = await client.teamates.findMany({
      select: {
        id: true,
        name: true,
        github_link: true,
        projects: true,
      },
    });
    if (!teamates) {
      throw createError(404, "Information not found");
    }
    res.status(200).json(teamates);
  } catch (err) {
    next(err);
  }
};

exports.getOneTeamate = async (req, res, next) => {
  try {
    const teamateId = Number(req.params.teamateId);
    const teamate = await client.teamates.findUnique({
      where: { id: teamateId },
    });
    if (!teamate) {
      throw createError(404, "Teamate not found");
    }
    res.status(200).json(teamate);
  } catch (err) {
    next(err);
  }
};

exports.deleteTeamate = async (req, res, next) => {
  try {
    const teamateId = Number(req.params.teamateId);
    const teamates = await client.teamates.findUnique({
      where: { id: teamateId },
    });
    if (!teamates) {
      throw createError(404, "Teamate not found");
    }
    const deletedTeamate = await client.teamates.delete({
      where: { id: teamateId },
      select: {
        id: true,
        name: true,
        github_link: true,
        projects: true,
      },
    });
    res.status(200).json(deletedTeamate);
  } catch (err) {
    next(err);
  }
};

exports.updateTeamate = async (req, res, next) => {
  try {
    const teamateId = Number(req.params.teamateId);
    const { name, github_link } = req.body;
    const updatedTeamateId = await client.teamates.update({
      where: { id: teamateId },
      data: {
        name,
        github_link,
      },
    });
    res.status(200).json(updatedTeamateId);
  } catch (err) {
    next(err);
  }
};
