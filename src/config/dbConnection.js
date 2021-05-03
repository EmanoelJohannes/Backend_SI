require('dotenv/config');

var data = ({
    client: 'mysql',
    connection: {
        host: '151.106.96.151',
        user:  'u620317362_vacinacoes',
        password: 'Vacinacoes123',
        database: 'u620317362_vacinacoes',
        port: 3306
    }
});

var connection = require('knex')(data);

if (connection) console.log("Conectado ao MySQL - VacinAção!");

module.exports = connection;


// require('dotenv/config');

// var data = ({
//     client: 'mysql',
//     connection: {
//         host: 'localhost',
//         user:  'root',
//         password: '12345678',
//         database: 'vacinacao',
//         port: 3306
//     }
// });

// var connection = require('knex')(data);

// if (connection) console.log("Conectado ao MySQL - VacinAção!");

// module.exports = connection;