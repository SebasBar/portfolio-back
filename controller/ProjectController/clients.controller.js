const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createClient = async (req, res, next) => {
  try {
    const { name, industry, description } = req.body;
    const projectId = Number(req.params.projectId);
    const newClient = await client.clients.create({
      data: {
        name,
        industry,
        description,
      },
    });
    // const updatedProject = await client.projects.update({
    //   where: { id: projectId },
    //   data: { clients: { connect: { id: newClient.id } } },
    // });
    res.status(200).json(newClient);
  } catch (err) {
    next(err);
  }
};

exports.getClients = async (req, res, next) => {
  try {
    const clients = await client.clients.findMany({
      select: {
        id: true,
        name: true,
        industry: true,
        description: true,
        projects: true,
      },
    });
    if (!clients) {
      throw createError(404, "Information not found");
    }
    res.status(200).json(clients);
  } catch (err) {
    next(err);
  }
};

exports.getOneClient = async (req, res, next) => {
  try {
    const clientId = Number(req.params.clientId);
    const clients = await client.clients.findUnique({
      where: { id: clientId },
    });
    if (!clients) {
      throw createError(404, "Client not found");
    }
    res.status(200).json(clients);
  } catch (err) {
    next(err);
  }
};

exports.deleteClient = async (req, res, next) => {
  try {
    const clientId = Number(req.params.clientId);
    const clients = await client.clients.findUnique({
      where: { id: clientId },
    });
    if (!clients) {
      throw createError(404, "Client not found");
    }
    const deletedClient = await client.clients.delete({
      where: { id: clientId },
      select: {
        id: true,
        name: true,
        industry: true,
        description: true,
        projects: true,
      },
    });
    res.status(200).json(deletedClient);
  } catch (err) {
    next(err);
  }
};

exports.updateClient = async (req, res, next) => {
  try {
    const clientId = Number(req.params.clientId);
    const { name, industry, description } = req.body;
    const updatedClientId = await client.clients.update({
      where: { id: clientId },
      data: {
        name,
        industry,
        description,
      },
    });
    res.status(200).json(updatedClientId);
  } catch (err) {
    next(err);
  }
};
