const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createPicture = async (req, res, next) => {
  try {
    const { picture } = req.body;
    const projectId = Number(req.params.projectId);
    const newPicture = await client.pictures.create({
      data: {
        picture,
      },
    });
    const updatedProject = await client.projects.update({
      where: { id: projectId },
      data: { pictures: { connect: { id: newPicture.id } } },
    });
    res.status(200).json(newPicture);
  } catch (err) {
    next(err);
  }
};

exports.getPictures = async (req, res, next) => {
  try {
    const pictures = await client.pictures.findMany({
      select: {
        picture: true,
        projectsId: true,
      },
    });
    if (!pictures) {
      throw createError(404, "Information not found");
    }
    res.status(200).json(pictures);
  } catch (err) {
    next(err);
  }
};

exports.deletePicture = async (req, res, next) => {
  try {
    const pictureId = Number(req.params.pictureId);
    const picture = await client.pictures.findUnique({
      where: { id: pictureId },
    });
    if (!picture) {
      throw createError(404, "Picture not found");
    }
    const deletedPicture = await client.pictures.delete({
      where: { id: pictureId },
      select: {
        id: true,
        picture: true,
      },
    });
    res.status(200).json(deletedPicture);
  } catch (err) {
    next(err);
  }
};

exports.updatePicture = async (req, res, next) => {
  try {
    const pictureId = Number(req.params.pictureId);
    const { picture } = req.body;
    const updatedPictureId = await client.pictures.update({
      where: { id: pictureId },
      data: {
        picture,
      },
    });
    res.status(200).json(updatedPictureId);
  } catch (err) {
    next(err);
  }
};
