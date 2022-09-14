import Joi, { PartialSchemaMap } from "joi";

type TypeUserData = PartialSchemaMap;

export const newUser = Joi.object<TypeUserData>({
  email: Joi.string().email().required(),
  password: Joi.string().min(4).required(),
  confirmPassword: Joi.string().min(4).required(),
});
