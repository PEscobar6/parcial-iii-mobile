"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const sequelize_1 = require("sequelize");
const db = new sequelize_1.Sequelize('parcial_electiva', 'root', '514853Pabl@', {
    host: 'localhost',
    dialect: 'mysql',
    logging: false
});
exports.default = db;
//# sourceMappingURL=connection.js.map