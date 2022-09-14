import app from "../src/index";
import supertest from "supertest";
import { prisma } from "../src/database";
import { faker } from "@faker-js/faker";

beforeEach(async () => {
  await prisma.$executeRaw`TRUNCATE TABLE "User"`;
});

describe(`POST /signup`, () => {
  it(`should return a status 201 for valid params`, async () => {
    const email = faker.internet.email();
    const password = faker.internet.password(4);
    const user = { email, password };
    const result = await supertest(app).post("/signup").send(user);
    expect(result.status).toBe(201);
  });

  it(`should return a status 422 for valid params`, async () => {
    const email = faker.internet.email();
    const password = faker.internet.password(4);
    const user = { email, password };
    const result = await supertest(app).post("/signup").send(user);
    expect(result.status).toBe(422);
  });

  it(`should return 409 when email is already in use`, async () => {
    const email = faker.internet.email();
    const password = faker.internet.password(4);
    const user = { email, password };
    const result = await supertest(app).post("/signup").send(user);
    expect(result.status).toBe(409);
  });

  it(`should return 401 when passwords don't match`, async () => {
    const email = faker.internet.email();
    const password = faker.internet.password(4);
    const user = { email, password };
    const result = await supertest(app).post("/signup").send(user);
    expect(result.status).toBe(401);
  });
});

describe(`POST /login`, () => {
  it(`should return a status 201 and token for valid params`, async () => {
    const email = faker.internet.email();
    const password = faker.internet.password(4);
    const user = { email, password };
    const result = await supertest(app).post("/login").send(user);
    expect(result.status).toBe(201);
    expect(result.body).toHaveProperty("token");
  });

  it(`should return 401 when credentials don't match`, async () => {
    const email = faker.internet.email();
    const password = faker.internet.password(4);
    const user = { email, password };
    const result = await supertest(app).post("/login").send(user);
    expect(result.status).toBe(401);
  });
});
