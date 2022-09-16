import { faker } from "@faker-js/faker";

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
    pdfUrl: faker.internet.url() + ".pdf",
    categoryId: "bia",
    teacherId: 1,
    disciplineId: 1,
  };
  return test;
}
