import { prisma } from "../database";

export async function validCategory(categoryId: number) {
  return await prisma.category.findFirst({ where: { id: categoryId } });
}
