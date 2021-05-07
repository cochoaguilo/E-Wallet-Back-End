const express = require("express");
const router = express.Router()
const operationsController = require('../controllers/operations.controllers');
const middleware = require('../middleware')

router.get('/:id', middleware.autentificarUser, operationsController.getOperations);

router.post('/:id', middleware.autentificarUser,  operationsController.newOperation)

router.put('/:id', middleware.autentificarUser, operationsController.updateOperation)

router.delete('/:id',  middleware.autentificarUser, operationsController.deleteOperation)

module.exports = router;