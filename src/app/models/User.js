var db = require("../../config/dbConnection");
const crypto = require('crypto');

class UserModel {

  async getUsers() {
    var result;

    await db("usuarios")
      .select("*")
      .then(response => {
        result = response;
      })
      .catch(erro => {
        console.log("Erro getUsers Model => ", erro);
        return;
      });

    return result;
  }

  async storeUser(data) {
    var result;

    await db("usuarios")
      .insert(data)
      .then(response => {
        result = response;
      })
      .catch(erro => {
        console.log("Erro storeUser Model => ", erro);
        return;
      });

    return result;
  }

  async Autenticate(login, senha) {
    var result;

    senha = crypto.createHash('md5').update(senha).digest('hex')

    await db("usuarios")
      .select('*')
      .where({
        login: login,
        senha: senha
      })
      .then(response => {
        result = response;
      })
      .catch(erro => {
        console.log("Erro Autenticate Model => ", erro);
        return;
      });

    return result;
  }

  async AutenticateByCPF(cpf, senha) {
    var result;

    senha = crypto.createHash('md5').update(senha).digest('hex')

    await db("usuarios")
      .select('*')
      .where({
        cpf: cpf,
        senha: senha
      })
      .then(response => {
        result = response;
      })
      .catch(erro => {
        console.log("Erro AutenticateByCPF Model => ", erro);
        return;
      });

    return result;
  }

  async findByLogin(login) {
    var result;

    await db("usuarios")
      .select('*')
      .where({
        login
      })
      .then(response => {
        result = response;
      })
      .catch(erro => {
        console.log("Erro findByLogin Model => ", erro);
        return;
      });

    return result;
  }

  async findByCPF(cpf) {
    var result;

    await db("usuarios")
      .select('*')
      .where({
        cpf
      })
      .then(response => {
        result = response;
      })
      .catch(erro => {
        console.log("Erro findByCPF Model => ", erro);
        return;
      });

    return result;
  }

}

module.exports = new UserModel();
