import { prisma } from "../database";

export async function validTeacherDiscipline(
  teacherId: number,
  disciplineId: number
) {
  return await prisma.teachersDisciplines.findFirst({
    where: { teacherId, disciplineId },
  });
}
