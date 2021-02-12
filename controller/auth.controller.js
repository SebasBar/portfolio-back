const client = require("../config/prisma-config");
const prisma = require("../config/prisma-config");
const createError = require("http-errors");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

exports.login = async (req, res, next) => {
  try {
    const credentialId = Number(req.params.credentialId);
    const { user, password } = req.body;
    const credentials = await client.credentials.findUnique({
      where: { id: credentialId },
    });
    if (!credentials) {
      throw createError(401, "Problem with credentials on the DB");
    }
    const isUserEqual = user === credentials.user;
    if (!isUserEqual) {
      throw createError(401, "Wrong user");
    }
    bcrypt.compare(password, credentials.password, function (err, resp) {
      if (err) {
        throw createError(401, "Wrong password");
      }
      if (resp) {
        const token = jwt.sign({ id: credentials.id }, process.env.JWT_SECRET, {
          expiresIn: "1h",
        });
        res
          .status(200)
          .cookie("token", token, { httpOnly: true })
          .json({ login: true, token, credentialsId: credentials.id });
      } else {
        res.json({ success: false, message: "passwords do not match" });
      }
    });
  } catch (err) {
    next(err);
  }
};
