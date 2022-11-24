import express, {Application} from 'express';
import userRoutes from '../routes/user';
import cors from "cors";
import db from '../db/connection';

class Server{
    private app: Application ;
    private port: string;
    private apiPaths = {
        users: '/api/users'
    }
    constructor() {
        this.app    = express();
        this.port   = process.env.PORT || '8000';

        this.dbConnection();
        this.middlewares();
        this.routes();
    }

    // TODO: conectar base de datos
    async dbConnection(){
        try {
            await db.authenticate();
            console.log('Database is online');
            
        } catch (error: any) {
            throw new Error(error);
        }
    }

    middlewares(){
        // CORS
        this.app.use(cors());

        // Lectura del body
        this.app.use(express.json());

        // Carpeta pública
        this.app.use(express.static('public'));
    }

    routes() {
        this.app.use(this.apiPaths.users, userRoutes);
    }

    listen() {
        this.app.listen(this.port, () => {
            console.log(`Server running on port ${this.port}`);
        })
    }
}

export default Server;