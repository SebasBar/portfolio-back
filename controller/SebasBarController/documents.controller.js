const client = require("../../config/prisma-config");
const createError = require("http-errors");

exports.createDocument = async (req, res, next) => {
  try {
    const { name, document } = req.body;
    const newDocument = await client.documents.create({
      data: {
        name,
        document,
      },
    });
    const updatedSebasBar = await client.sebasBar.update({
      where: { id: 1 },
      data: { documents: { connect: { id: newDocument.id } } },
    });
    res.status(200).json(newDocument);
  } catch (err) {
    next(err);
  }
};

exports.getDocuments = async (req, res, next) => {
  try {
    const documents = await client.documents.findMany({
      select: {
        id: true,
        name: true,
        document: true,
        sebasBarId: true,
      },
    });
    if (!documents) {
      throw createError(404, "information not found");
    }
    res.status(200).json(documents);
  } catch (err) {
    next(err);
  }
};

exports.deleteDocument = async (req, res, next) => {
  try {
    const documentId = Number(req.params.documentId);
    const document = await client.documents.findUnique({
      where: { id: documentId },
    });
    if (!document) {
      throw createError(404, "Document not found");
    }
    const deletedDocument = await client.documents.delete({
      where: { id: documentId },
      select: { name: true, document: true },
    });
    res.status(200).json(deletedDocument);
  } catch (err) {
    next(err);
  }
};

exports.updateDocument = async (req, res, next) => {
  try {
    const documentId = Number(req.params.documentId);
    const { name, document } = req.body;
    const updatedDocument = await client.documents.update({
      where: { id: documentId },
      data: {
        name,
        document,
      },
    });
    res.status(200).json(updatedDocument);
  } catch (err) {
    next(err);
  }
};
