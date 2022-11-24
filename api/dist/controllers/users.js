"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteUser = exports.putUser = exports.postUser = exports.getUser = exports.getUsers = void 0;
const getUsers = (req, res) => {
    res.json({
        msg: 'getUsers'
    });
};
exports.getUsers = getUsers;
const getUser = (req, res) => {
    const { id } = req.params;
    res.json({
        msg: 'getUser',
        id
    });
};
exports.getUser = getUser;
const postUser = (req, res) => {
    const { body } = req;
    res.json({
        msg: 'createUser',
        body
    });
};
exports.postUser = postUser;
const putUser = (req, res) => {
    const { id } = req.params;
    const { body } = req;
    res.json({
        msg: 'updateUser',
        id,
        body
    });
};
exports.putUser = putUser;
const deleteUser = (req, res) => {
    const { id } = req.params;
    res.json({
        msg: 'deleteUser',
        id
    });
};
exports.deleteUser = deleteUser;
//# sourceMappingURL=users.js.map