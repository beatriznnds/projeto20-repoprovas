import { faker } from "@faker-js/faker";
import { prisma } from "../../src/database";
import bcrypt from "bcrypt";
import { TypeUserData } from "../../src/types/userTypes";
import jwt from "jsonwebtoken";
import { User } from "@prisma/client";
import dotenv from "dotenv";

dotenv.config();

export async function createUser({
  persist = false,
}): Promise<User | TypeUserData> {
  const user = {
    email: faker.internet.email(),
    password: faker.internet.password(4),
  };

  if (persist) {
    const encryptedPassword = bcrypt.hashSync(user.password, 10);
    const insertedUser: User = await prisma.user.create({
      data: { ...user, password: encryptedPassword },
    });
    return { ...insertedUser, ...user };
  }

  return user;
}
