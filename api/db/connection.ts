import { Sequelize } from "sequelize";

const db = new Sequelize('parcial_electiva', 'root', '514853Pabl@', {
    host: 'localhost',
    dialect: 'mysql',
    logging: false
});

export default db;