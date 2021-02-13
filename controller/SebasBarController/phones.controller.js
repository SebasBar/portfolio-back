const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createPhone = async (req, res, next) => {
  try {
    const { number } = req.body;
    const newphone = await client.phones.create({
      data: {
        number,
      },
    });
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { phones: { connect: { id: newphone.id } } },
    });
    res.status(200).json(newphone);
  } catch (err) {
    next(err);
  }
};

exports.getPhones = async (req, res, next) => {
  try {
    const phones = await client.phones.findMany({
      select: {
        id: true,
        number: true,
      },
    });
    if (!phones) {
      throw createError(404, "information not found");
    }
    res.status(200).json(phones);
  } catch (err) {
    next(err);
  }
};

exports.deletePhone = async (req, res, next) => {
  try {
    const phoneId = Number(req.params.phoneId);
    const phone = await client.phones.findUnique({
      where: { id: phoneId },
    });
    if (!phone) {
      throw createError(404, "Phone not found");
    }
    const deletedphone = await client.phones.delete({
      where: { id: phoneId },
      select: { number: true },
    });
    res.status(200).json(deletedphone);
  } catch (err) {
    next(err);
  }
};

exports.updatePhone = async (req, res, next) => {
  try {
    const phoneId = Number(req.params.phoneId);
    const { number } = req.body;
    const updatedphone = await client.phones.update({
      where: { id: phoneId },
      data: {
        number,
      },
    });
    res.status(200).json(updatedphone);
  } catch (err) {
    next(err);
  }
};
