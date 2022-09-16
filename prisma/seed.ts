import { prisma } from "../src/database";
import { teachersDisciplines } from "@prisma/client";

type TeacherDiscipline = Omit<teachersDisciplines, "id">;

async function main() {
  const category = {
    name: "Projeto",
  };

  await prisma.category.upsert({
    where: { name: category.name },
    update: {},
    create: category,
  });

  const term = {
    number: "1",
  };

  await prisma.term.upsert({
    where: { number: term.number },
    update: {},
    create: term,
  });

  const teacher = {
    name: "Caio Prado Júnior",
  };

  await prisma.teacher.upsert({
    where: { name: teacher.name },
    update: {},
    create: teacher,
  });

  const discipline = {
    name: "História do Brasil",
    termId: 1,
  };

  await prisma.discipline.upsert({
    where: { name: discipline.name },
    update: {},
    create: discipline,
  });

  const teacherDiscipline = {
    teacherId: 1,
    disciplineId: 1,
  };

  await prisma.teachersDisciplines.upsert({
    where: {
      teacherId_disciplineId: {
        teacherId: teacherDiscipline.teacherId,
        disciplineId: teacherDiscipline.disciplineId,
      },
    },
    update: {},
    create: teacherDiscipline,
  });
}

main()
  .catch((e) => {
    console.log(e);
    process.exit(1);
  })
  .finally(() => {
    prisma.$disconnect();
  });
