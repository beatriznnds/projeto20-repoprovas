import app from "../src/app";
import supertest from "supertest";
import { prisma } from "../src/database";
import * as userFactory from "./factories/userFactory";
import * as testFactory from "./factories/testFactory";

beforeEach(async () => {
  await prisma.$executeRaw`TRUNCATE TABLE tests;`;
});

describe(`POST /tests`, () => {
  it(`should return 201 for valid params`, async () => {
    const token = await userFactory.createToken();
    console.log(token);
    const test = await testFactory.createTest();
    console.log(test);
    const result = await supertest(app)
      .post("/tests")
      .set("Authorization", `Bearer ${token}`)
      .send(test);
    expect(result.status).toEqual(201);
  });

  it(`should return 401 when token is invalid or not provided`, async () => {
    const test = await testFactory.createTest();
    const result = await supertest(app).post("/tests").send(test);
    expect(result.status).toEqual(401);
  });

  it(`should return 404 when category, teacher or discipline not found`, async () => {
    const token = await userFactory.createToken();
    const test = await testFactory.createWrongTest();
    const result = await supertest(app)
      .post("/tests")
      .set("Authorization", `Bearer ${token}`)
      .send(test);
    expect(result.status).toEqual(404);
  });

  it(`should return 422 when body format is wrong`, async () => {
    const token = await userFactory.createToken();
    const test = await testFactory.createWrongPdfTest();
    const result = await supertest(app)
      .post("/tests")
      .set("Authorization", `Bearer ${token}`)
      .send(test);
    expect(result.status).toEqual(422);
  });
});

afterAll(async () => {
  await prisma.$disconnect();
});
