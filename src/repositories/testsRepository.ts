import { prisma } from "../database";
import { TypeTestData } from "../types/testTypes";

export async function insert(test: TypeTestData) {
  return await prisma.test.create({ data: test });
}
