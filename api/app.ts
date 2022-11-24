import dotenv from "dotenv";
import Server from "./api/models/server";

// Configurar dotEnv
dotenv.config();

const server = new Server();
server.listen();