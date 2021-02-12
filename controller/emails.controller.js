const client = require("../config/prisma-config");

exports.createEmail = async (req, res, next) => {
  try {
    const { address } = req.body;
    const newEmail = await client.emails.create({
      data: {
        address,
      },
    });
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { emails: { connect: { id: newEmail.id } } },
    });
    res.status(200).json(newEmail);
  } catch (err) {
    next(err);
  }
};

exports.getEmails = async (req, res, next) => {
  try {
    const emails = await client.emails.findMany({
      include: {
        address: true,
      },
    });
    if (!emails) {
      throw createError(404, "information not found");
    }
    res.status(200).json(emails);
  } catch (err) {
    next(err);
  }
};

exports.deleteEmail = async (req, res, next) => {
  try {
    const emailId = Number(req.params.emailId);
    const email = await client.emails.findUnique({
      where: { id: emailId },
    });
    if (!email) {
      throw createError(404, "email not found");
    }
    const deletedEmail = await client.emails.delete({
      where: { id: emailId },
    });
    res.status(200).json(deletedEmail);
  } catch (err) {
    next(err);
  }
};

exports.updateEmail = async (req, res, next) => {
  try {
    const emailId = Number(req.params.emailId);
    const { address } = req.body;
    const updatedEmail = await client.emails.update({
      where: { id: emailId },
      data: {
        address,
      },
    });
    res.status(200).json(updatedEmail);
  } catch (err) {
    next(err);
  }
};
