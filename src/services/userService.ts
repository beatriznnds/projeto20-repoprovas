import * as userRepo from "../repositories/userRepository";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";
import { TypeUserData } from "../types/userTypes";

dotenv.config();

export async function emailValidation(email: string) {
  const invalidEmail = await userRepo.findByEmail(email);
  if (invalidEmail) {
    throw { type: "Conflict", message: `This email is already in use!` };
  }
}

export async function passwordValidation(
  password: string,
  confirmPassword: string
) {
  if (password !== confirmPassword) {
    throw { type: "Unauthorized", message: `Passwords don't match!` };
  }
}

export async function signUp(user: TypeUserData, confirmPassword: string) {
  await emailValidation(user.email);
  await passwordValidation(user.password, confirmPassword);
  const encryptedPassword = bcrypt.hashSync(user.password, 10);
  const newUser = { email: user.email, password: encryptedPassword };
  await userRepo.signup(newUser);
}

export async function isUserValid(user: TypeUserData) {
  const validUser = await userRepo.findByEmail(user.email);
  if (!validUser) {
    throw { type: "Unauthorized", message: `Incorrect password or email!` };
  }
  const validPasssword = bcrypt.compareSync(user.password, validUser.password);
  if (!validPasssword) {
    throw { type: "Unauthorized", message: `Incorrect password or email!` };
  }
  return validUser;
}

export async function login(user: TypeUserData, confirmPassword: string) {
  const validUser = await isUserValid(user);
  await passwordValidation(user.password, confirmPassword);
}
