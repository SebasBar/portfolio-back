const { PrismaClient } = require("@prisma/client");
const client = new PrismaClient();
const createError = require("http-errors");

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
