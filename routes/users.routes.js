const express = require("express");
const router = express.Router()
const usuariosControllers = require('../controllers/users.controllers');


router.post('/', usuariosControllers.newUser)

router.post('/login', usuariosControllers.loginUser)


module.exports = router