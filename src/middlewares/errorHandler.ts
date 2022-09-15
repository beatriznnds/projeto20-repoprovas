import { Request, Response, NextFunction } from "express";

interface error {
  type: "Not Found" | "Conflict" | "Unauthorized" | "ValidationError";
  message: string;
}

export default function errorHandler(
  error: error,
  req: Request,
  res: Response,
  next: NextFunction
) {
  const errorTypes = {
    "Not Found": 404,
    Conflict: 409,
    Unauthorized: 401,
    ValidationError: 422,
  };

  return res.status(errorTypes[error.type]).send({ message: error.message });

  console.log(error);
  res.sendStatus(500);
}
