import { prisma } from "../database";

export async function findById(disciplineId: number) {
  return await prisma.discipline.findFirst({ where: { id: disciplineId } });
}
