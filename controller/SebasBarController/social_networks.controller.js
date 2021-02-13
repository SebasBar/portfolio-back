const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createSocialNetwork = async (req, res, next) => {
  try {
    const { name, address } = req.body;
    const newSocialNetwork = await client.social_Networks.create({
      data: {
        name,
        address,
      },
    });
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { social_networks: { connect: { id: newSocialNetwork.id } } },
    });
    res.status(200).json(newSocialNetwork);
  } catch (err) {
    next(err);
  }
};

exports.getSocialNetworks = async (req, res, next) => {
  try {
    const socialNetworks = await client.social_Networks.findMany({
      select: {
        id: true,
        name: true,
        address: true,
      },
    });
    if (!socialNetworks) {
      throw createError(404, "information not found");
    }
    res.status(200).json(socialNetworks);
  } catch (err) {
    next(err);
  }
};

exports.deleteSocialNetwork = async (req, res, next) => {
  try {
    const socialNetworkId = Number(req.params.socialNetworkId);
    const socialNetwork = await client.social_Networks.findUnique({
      where: { id: socialNetworkId },
    });
    if (!socialNetwork) {
      throw createError(404, "Social network not found");
    }
    const deletedSocialNetwork = await client.social_Networks.delete({
      where: { id: socialNetworkId },
      select: { name: true, address: true },
    });
    res.status(200).json(deletedSocialNetwork);
  } catch (err) {
    next(err);
  }
};

exports.updateSocialNetwork = async (req, res, next) => {
  try {
    const socialNetworkId = Number(req.params.socialNetworkId);
    const { name, address } = req.body;
    const updatedSocialNetwork = await client.social_Networks.update({
      where: { id: socialNetworkId },
      data: {
        name,
        address,
      },
    });
    res.status(200).json(updatedSocialNetwork);
  } catch (err) {
    next(err);
  }
};
