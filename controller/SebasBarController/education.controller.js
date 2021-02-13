const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createEducation = async (req, res, next) => {
  try {
    const { degree, description, time } = req.body;
    const newEducation = await client.education.create({
      data: {
        degree,
        description,
        time,
      },
    });
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { education: { connect: { id: newEducation.id } } },
    });
    res.status(200).json(newEducation);
  } catch (err) {
    next(err);
  }
};

exports.getEducation = async (req, res, next) => {
  try {
    const education = await client.education.findMany({
      select: {
        id: true,
        degree: true,
        description: true,
        time: true,
      },
    });
    if (!education) {
      throw createError(404, "Information not found");
    }
    res.status(200).json(education);
  } catch (err) {
    next(err);
  }
};

exports.deleteEducation = async (req, res, next) => {
  try {
    const educationId = Number(req.params.educationId);
    const education = await client.education.findUnique({
      where: { id: educationId },
    });
    if (!education) {
      throw createError(404, "Education not found");
    }
    const deletedEducation = await client.education.delete({
      where: { id: educationId },
      select: { degree: true, description: true },
    });
    res.status(200).json(deletedEducation);
  } catch (err) {
    next(err);
  }
};

exports.updateEducation = async (req, res, next) => {
  try {
    const educationId = Number(req.params.educationId);
    const { degree, description, time } = req.body;
    const updatedEducation = await client.education.update({
      where: { id: educationId },
      data: {
        degree,
        description,
        time,
      },
    });
    res.status(200).json(updatedEducation);
  } catch (err) {
    next(err);
  }
};
