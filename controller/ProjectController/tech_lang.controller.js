const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createTechLang = async (req, res, next) => {
  try {
    const { name, description } = req.body;
    const newTechLang = await client.tech_Lang.create({
      data: {
        name,
        description,
      },
    });
    res.status(200).json(newTechLang);
  } catch (err) {
    next(err);
  }
};

exports.getTechLang = async (req, res, next) => {
  try {
    const techLang = await client.tech_Lang.findMany({
      select: {
        id: true,
        name: true,
        description: true,
        projects: true,
      },
    });
    if (!techLang) {
      throw createError(404, "Information not found");
    }
    res.status(200).json(techLang);
  } catch (err) {
    next(err);
  }
};

exports.getOneTechLang = async (req, res, next) => {
  try {
    const techlangId = Number(req.params.techlangId);
    const techlang = await client.tech_Lang.findUnique({
      where: { id: techlangId },
    });
    if (!techlang) {
      throw createError(404, "Technology or Language not found");
    }
    res.status(200).json(techlang);
  } catch (err) {
    next(err);
  }
};

exports.deleteTechLang = async (req, res, next) => {
  try {
    const techLangId = Number(req.params.techlangId);
    const techLang = await client.tech_Lang.findUnique({
      where: { id: techLangId },
    });
    if (!techLang) {
      throw createError(404, "Tech or language not found");
    }
    const deletedTechLang = await client.tech_Lang.delete({
      where: { id: techLangId },
      select: { id: true, name: true, description: true },
    });
    res.status(200).json(deletedTechLang);
  } catch (err) {
    next(err);
  }
};

exports.updateTechLang = async (req, res, next) => {
  try {
    const techLangId = Number(req.params.techlangId);
    const { name, description } = req.body;
    const updatedTechLangId = await client.tech_Lang.update({
      where: { id: techLangId },
      data: {
        name,
        description,
      },
    });
    res.status(200).json(updatedTechLangId);
  } catch (err) {
    next(err);
  }
};
