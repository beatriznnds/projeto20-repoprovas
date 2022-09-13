import { Request, Response } from "express";
import * as testServ from "../services/testService";

export async function insert(req: Request, res: Response) {
  const test = req.body;
  await testServ.insert(test);
  res.status(201).send({ message: `Test created!` });
}
