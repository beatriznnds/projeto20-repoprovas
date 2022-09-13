import { Test } from "@prisma/client";

export type TypeTestData = Omit<Test, "id">;

export type CreateTestData = Omit<Test, "id"> & {
  teacherId: number;
  disciplineId: number;
};
