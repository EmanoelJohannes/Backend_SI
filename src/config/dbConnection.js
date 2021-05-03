require('dotenv/config');

var data = ({
    client: 'mysql',
    connection: {
        host: 'localhost',
        user:  'root',
        password: '12345678',
        database: 'vacinacao',
        port: 3306
    }
});

var connection = require('knex')(data);

if (connection) console.log("Conectado ao MySQL - VacinAção!");

module.exports = connection;