import { Router } from "express";
import { validateSchema } from "../middlewares/schemaValidation";
import { newTest } from "../schemas/testSchema";
import { checkValidToken } from "../middlewares/tokenValidation";
import * as testController from "../controllers/testController";

const testRouter = Router();

testRouter.use(checkValidToken);
testRouter.post("/tests", validateSchema(newTest), testController.insert);
testRouter.get("/tests/disciplines", testController.getTestsByDiscipline);
testRouter.get("/tests/teachers", testController.getTestsByTeacher);

export default testRouter;
