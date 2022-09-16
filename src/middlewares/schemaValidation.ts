import Joi from "joi";
import { Request, Response, NextFunction } from "express";
import { ValidationError } from "joi";
export function validateSchema(schema: Joi.ObjectSchema) {
  return async (req: Request, res: Response, next: NextFunction) => {
    try {
      await schema.validateAsync(req.body, {
        abortEarly: false,
      });
    } catch (e) {
      if (e instanceof ValidationError)
        throw { type: "ValidationError", details: e.details };
    }
    next();
  };
}
