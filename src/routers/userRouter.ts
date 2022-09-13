import { Router } from "express";
import { validateSchema } from "../middlewares/schemaValidation";
import * as userController from "../controllers/userController";
import { newUser } from "../schemas/userSchema";

const userRouter = Router();

userRouter.post("/signup", validateSchema(newUser), userController.signup);
userRouter.post("/login", userController.login);

export default userRouter;
