const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createSpecialKnowledge = async (req, res, next) => {
  try {
    const { name, description } = req.body;
    const newSspecialKnowledge = await client.special_Knowledge.create({
      data: {
        name,
        description,
      },
    });
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { special_knowledge: { connect: { id: newSspecialKnowledge.id } } },
    });
    res.status(200).json(newSspecialKnowledge);
  } catch (err) {
    next(err);
  }
};

exports.getSpecialKnowledge = async (req, res, next) => {
  try {
    const specialknowledge = await client.special_Knowledge.findMany({
      select: {
        id: true,
        name: true,
        description: true,
      },
    });
    if (!specialknowledge) {
      throw createError(404, "Information not found");
    }
    res.status(200).json(specialknowledge);
  } catch (err) {
    next(err);
  }
};

exports.deleteSpecialKnowledge = async (req, res, next) => {
  try {
    const specialknowledgeId = Number(req.params.specialknowledgeId);
    const specialknowledge = await client.special_Knowledge.findUnique({
      where: { id: specialknowledgeId },
    });
    if (!specialknowledge) {
      throw createError(404, "Special knowledge not found");
    }
    const deleteSpecialKnowledge = await client.special_Knowledge.delete({
      where: { id: specialknowledgeId },
      select: { id: true, name: true, description: true },
    });
    res.status(200).json(deleteSpecialKnowledge);
  } catch (err) {
    next(err);
  }
};

exports.updateSpecialKnowledge = async (req, res, next) => {
  try {
    const specialknowledgeId = Number(req.params.specialknowledgeId);
    const { name, description } = req.body;
    const updatedSpecialKnowledge = await client.special_Knowledge.update({
      where: { id: specialknowledgeId },
      data: {
        name,
        description,
      },
    });
    res.status(200).json(updatedSpecialKnowledge);
  } catch (err) {
    next(err);
  }
};
