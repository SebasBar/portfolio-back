const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createWorkExperience = async (req, res, next) => {
  try {
    const { company_name, position, description, time } = req.body;
    const newWorkExperience = await client.work_Experience.create({
      data: {
        company_name,
        position,
        description,
        time,
      },
    });
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { work_experience: { connect: { id: newWorkExperience.id } } },
    });
    res.status(200).json(newWorkExperience);
  } catch (err) {
    next(err);
  }
};

exports.getWorkExperience = async (req, res, next) => {
  try {
    const workExperience = await client.work_Experience.findMany({
      select: {
        id: true,
        company_name: true,
        position: true,
        description: true,
        time: true,
      },
    });
    if (!workExperience) {
      throw createError(404, "Information not found");
    }
    res.status(200).json(workExperience);
  } catch (err) {
    next(err);
  }
};

exports.deleteWorkExperience = async (req, res, next) => {
  try {
    const workExperienceId = Number(req.params.workexperienceId);
    const workExperience = await client.work_Experience.findUnique({
      where: { id: workExperienceId },
    });
    if (!workExperience) {
      throw createError(404, "Work Experience not found");
    }
    const deleteWorkExperience = await client.work_Experience.delete({
      where: { id: workExperienceId },
      select: {
        id: true,
        company_name: true,
        position: true,
        description: true,
        time: true,
      },
    });
    res.status(200).json(deleteWorkExperience);
  } catch (err) {
    next(err);
  }
};

exports.updateWorkexperience = async (req, res, next) => {
  try {
    const workExperienceId = Number(req.params.workexperienceId);
    const { company_name, position, description, time } = req.body;
    const updatedWorkExperience = await client.work_Experience.update({
      where: { id: workExperienceId },
      data: {
        company_name,
        position,
        description,
        time,
      },
    });
    res.status(200).json(updatedWorkExperience);
  } catch (err) {
    next(err);
  }
};
