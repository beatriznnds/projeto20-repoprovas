import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

dotenv.config();

interface Id {
  userId: number;
}

export async function checkValidToken(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const authorization = req.headers.authorization;
  if (!authorization) {
    throw { type: "Unauthorized", message: `Authorization header not found!` };
  }
  const token = authorization?.replace("Bearer ", "").trim();
  if (!token) {
    throw { type: "Unauthorized", message: `Invalid authorization header!` };
  }
  const { userId } = jwt.verify(token, process.env.JWT_SECRET as string) as Id;
  res.locals.userId = userId;
  next();
}
