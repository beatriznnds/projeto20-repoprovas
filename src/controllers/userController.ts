import { Request, Response } from "express";
import * as userService from "../services/userService";

export async function signup(req: Request, res: Response) {
  const user = req.body;
  const { confirmPassword } = req.body;
  await userService.signUp(user, confirmPassword);
  res.status(201).send({ message: `User created!` });
}

export async function login(req: Request, res: Response) {
  const user = req.body;
  const { confirmPassword } = req.body;
  const token = await userService.login(user, confirmPassword);
  console.log(token);
  res.status(200).send({ token });
}
