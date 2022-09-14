import * as testRepo from "../repositories/testsRepository";
import * as categoryRepo from "../repositories/categoryRepository";
import * as teacherDRepo from "../repositories/teacherDisciplineRepository";
import { CreateTestData } from "../types/testTypes";
import * as disciplineRepo from "../repositories/disciplineRepository";
import * as teacherRepo from "../repositories/teacherRepository";

export async function insert(test: CreateTestData) {
  const validCategory = await categoryRepo.validCategory(test.categoryId);
  if (!validCategory) {
    throw { type: "Not Found", message: `Category not found!` };
  }

  const validDiscipline = await disciplineRepo.findById(test.disciplineId);
  if (!validDiscipline) {
    throw { type: "Not Found", message: `Discipline not found!` };
  }

  const validTeacher = await teacherRepo.findById(test.teacherId);
  if (!validTeacher) {
    throw { type: "Not Found", message: `Teacher not found!` };
  }

  const validTandDRelation = await teacherDRepo.validTeacherDiscipline(
    test.teacherId,
    test.disciplineId
  );
  if (!validTandDRelation) {
    throw {
      type: "Unauthorized",
      message: `Teacher doesn't teach this discipline!`,
    };
  }
  const newTest = {
    name: test.name,
    pdfUrl: test.pdfUrl,
    categoryId: test.categoryId,
    teacherDisciplineId: validTandDRelation.id,
  };
  await testRepo.insert(newTest);
}

export async function getTestsByDiscipline() {
  const result = await testRepo.getTestsByDiscipline();
  return result;
}

export async function getTestsByTeacher() {
  const result = await testRepo.getTestsByTeacher();
  return result;
}
