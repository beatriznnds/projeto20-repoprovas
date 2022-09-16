import { faker } from "@faker-js/faker";
import { prisma } from "../../src/database";

export async function populateTest() {
  await prisma.category.create({ data: { name: "Projeto" } });
  await prisma.teacher.create({ data: { name: "Caio Prado Júnior" } });
  await prisma.term.create({ data: { number: "1" } });
  await prisma.discipline.create({
    data: { name: "História do Brasil", termId: 1 },
  });
  await prisma.teachersDisciplines.create({
    data: { teacherId: 1, disciplineId: 1 },
  });
}

export async function createTest() {
  const test = {
    name: faker.lorem.sentence(),
    pdfUrl: faker.internet.url() + ".pdf",
    categoryId: 1,
    teacherId: 1,
    disciplineId: 1,
  };
  return test;
}

export async function createWrongTest() {
  const test = {
    name: faker.lorem.sentence(),
    pdfUrl: faker.internet.url() + ".pdf",
    categoryId: 90,
    teacherId: 100,
    disciplineId: 9,
  };
  return test;
}

export async function createWrongPdfTest() {
  const test = {
    name: faker.lorem.sentence(),
    pdfUrl: faker.internet.url(),
    categoryId: "bia",
    teacherId: 1,
    disciplineId: 1,
  };
  return test;
}
