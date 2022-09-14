import { prisma } from "../database";
import { TypeTestData } from "../types/testTypes";

export async function insert(test: TypeTestData) {
  return await prisma.test.create({ data: test });
}

export async function getTestsByDiscipline() {
  const result = prisma.term.findMany({
    include: {
      Discipline: {
        include: {
          teachersDisciplines: {
            include: { teachers: true, tests: { include: { category: true } } },
          },
        },
      },
    },
  });
  return result;
}

export async function getTestsByTeacher() {
  const result = prisma.teachersDisciplines.findMany({
    include: {
      teachers: true,
      disciplines: true,
      tests: { include: { category: true } },
    },
  });
  return result;
}
