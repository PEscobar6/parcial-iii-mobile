import dotenv from "dotenv";
import Server from "./models/server";

// Configurar dotEnv
dotenv.config();

const server = new Server();
server.listen();