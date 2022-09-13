import Joi from "joi";

export const newUser = Joi.object({
  email: Joi.string().email().required(),
  password: Joi.string().min(4).required(),
  confirmPassword: Joi.ref("password"),
});
