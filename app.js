const express = require("express");
const app = express();
const client = require("./config/prisma-config");
const mainRouter = require("./routes");
const errorMiddleware = require("./middleware/error-handdling.middleware");
const error = require("http-errors");
const cors = require("cors");
const cookieParser = require("cookie-parser");
const bcrypt = require("bcryptjs");

const PORT = process.env.PORT || 8000;

app.use(cors());
app.use(express.json());
app.use(cookieParser());
app.use(mainRouter);

//to add the front end

// app.use(express.static(path.join(__dirname, "build")));

app.get("/*", function (req, res) {
  res.sendFile(path.join(__dirname, "build", "index.html"));
});

app.use("*", (req, res, next) => {
  next(error(404, "Page not found"));
});

app.use(errorMiddleware);

app.listen(PORT, () => {
  console.log(`app is running on ${PORT}`);
});

module.exports = app;
