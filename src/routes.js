const express = require('express');

const routes = new express.Router();

// const authMiddleware = require('./app/middlewares/auth');

const userController = require('./app/controllers/UserController');
const sessionController = require('./app/controllers/SessionController');
const postoController = require('./app/controllers/PostoController');
const agendamentoController = require('./app/controllers/AgendamentoController');


routes.post('/users', userController.storeUser);
routes.post('/sessions', sessionController.store);

routes.post('/storePosto', postoController.storePosto);
routes.get('/getPostos/:lat/:lng', postoController.getPostos);
routes.get('/agendamento/:idposto/avaliable', agendamentoController.getHorarios);
routes.post('/storeAgendamento', agendamentoController.storeAgendamento);

// routes.use(authMiddleware);

module.exports = routes;