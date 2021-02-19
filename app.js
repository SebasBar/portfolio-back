const express = require("express");
const app = express();
const mainRouter = require("./routes");
const errorMiddleware = require("./middleware/error-handdling.middleware");
const error = require("http-errors");
const cors = require("cors");
const cookieParser = require("cookie-parser");
const path = require("path");

const PORT = process.env.PORT || 8000;

app.use(cors());
app.use(express.json());
app.use(cookieParser());
app.use(mainRouter);

app.use("*", (req, res, next) => {
  next(error(404, "Page not found"));
});

app.use(errorMiddleware);

app.listen(PORT, () => {
  console.log(`app is running on ${PORT}`);
});

module.exports = app;
