import { prisma } from "../database";

export async function findById(teacherId: number) {
  return await prisma.teacher.findFirst({ where: { id: teacherId } });
}
