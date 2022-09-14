import app from "../src/app";
import supertest from "supertest";
import { prisma } from "../src/database";
import { faker } from "@faker-js/faker";

beforeEach(async () => {
  await prisma.$executeRaw`TRUNCATE TABLE users;`;
});

const user = { email: "beatriz@gmail.com", password: "1234" };

describe(`POST /signup`, () => {
  it(`should return a status 201 for valid params`, async () => {
    const result = await supertest(app).post("/signup").send(user);
    const createdUser = await prisma.user.findUnique({
      where: { email: user.email },
    });
    expect(result.status).toEqual(201);
    expect(createdUser).not.toBeNull();
  });

  it(`should return 409 when email is already in use`, async () => {
    const result = await supertest(app).post("/signup").send(user);
    expect(result.status).toEqual(409);
  });

  it(`should return 401 when passwords don't match`, async () => {
    const confirmPassword = faker.internet.password();
    if (user.password !== confirmPassword) {
      const result = await supertest(app).post("/signup").send(user);
      expect(result.status).toEqual(401);
    }
  });
});

describe(`POST /login`, () => {
  it(`should return a status 201 and token for valid params`, async () => {
    const result = await supertest(app).post("/login").send(user);
    expect(result.status).toEqual(201);
    const token: string = result.text;
    expect(token).not.toBeNull();
  });

  it(`should return 401 when credentials don't match`, async () => {
    const wrongUser = { email: "bia@gmail.com", password: "1235" };
    const result = await supertest(app).post("/login").send(wrongUser);
    expect(result.status).toEqual(401);
  });
});

afterAll(async () => {
  await prisma.$disconnect();
});
