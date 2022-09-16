-- RenameForeignKey
ALTER TABLE "teachersDisciplines" RENAME CONSTRAINT "teachersDiscipline_disciplineId_fkey" TO "teachersDisciplines_disciplineId_fkey";

-- RenameForeignKey
ALTER TABLE "teachersDisciplines" RENAME CONSTRAINT "teachersDiscipline_teacherId_fkey" TO "teachersDisciplines_teacherId_fkey";
