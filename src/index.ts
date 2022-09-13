import express, { json } from "express";
import "express-async-errors";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config();

const app = express();
app.use(cors());
app.use(json());

const PORT = process.env.PORT || 4000;

app.listen(PORT, () => {
  console.log(`Server is up and running on port ${PORT}`);
});
