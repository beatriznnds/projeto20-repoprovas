import Joi, { PartialSchemaMap } from "joi";

type TypeTestData = PartialSchemaMap;

export const newTest = Joi.object<TypeTestData>({
  name: Joi.string().required(),
  pdfUrl: Joi.string()
    .regex(
      /^http(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?(.pdf)$/
    )
    .required(),
  categoryId: Joi.number().required(),
  teacherId: Joi.number().required(),
  disciplineId: Joi.number().required(),
});
