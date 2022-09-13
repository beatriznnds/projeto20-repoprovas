import { prisma } from "../database";
import { TypeUserData } from "../types/userTypes";

export async function signup(user: TypeUserData) {
  return await prisma.user.create({ data: user });
}

export async function findByEmail(email: string) {
  return await prisma.user.findFirst({ where: { email } });
}

export async function findById(userId: number) {
  return await prisma.user.findFirst({ where: { id: userId } });
}
