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
    // const hashedPassword = await bcrypt.hash(password, 12);

    const isUserEqual = user === credentials.user;
    if (!isUserEqual) {
      throw createError(401, "Wrong user");
    }
    // const isPasswordEqual = password === credentials.password;
    const isPasswordEqual = await bcrypt.compare(
      password,
      credentials.password
    );
    // console.log(`Hashedpassword: ${credentials.password}`);
    // console.log(`password: ${password}`);
    // console.log(hashedPassword);

    if (!isPasswordEqual) {
      throw createError(401, "Wrong password");
    }

    const token = jwt.sign({ id: credentials.id }, process.env.JWT_SECRET, {
      expiresIn: "1h",
    });

    res
      .status(200)
      // .cookie("login", true, { httpOnly: true })
      // .json({ login: true, userId: credentials.user });
      .cookie("token", token, { httpOnly: true })
      .json({ token, credentialsId: credentials.id });
  } catch (err) {
    next(err);
  }
};
