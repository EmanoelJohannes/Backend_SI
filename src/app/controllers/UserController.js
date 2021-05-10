const User = require("../models/User");

var db = require("../../config/dbConnection");

const crypto = require('crypto');

class UserController {

  async storeUser(req, res) {
    const login = await User.findByLogin(req.body.login);

    if (login[0]) {
      return res.json({ error: "Login já cadastrado." });
    }

    else {
      req.body.senha = crypto.createHash('md5').update(req.body.senha).digest('hex');

      // Retira espaços do login
      req.body.login = req.body.login.replace(/\s/g, "");
      
      const newUser = await User.storeUser(req.body);

      if (newUser) {
        // Agora que sabemos que existe, pois foi cadastrado, buscamos as informações
        const user = await User.findByLogin(req.body.login);

        return res.json(user);

      } else {
        return res.json({error: "Usuário não adicionado." })
      }
    }
  }


  async updateUser(req, res) {

    var { nome, login } = req.body;

    const result = await User.updateUser(login, nome);

    return res.json({ok: true})
    
  } 
  
  
  async getUser(req, res) {

    const { login } = req.params;

    const result = await User.findByLogin(login);

    return res.json(result)
    
  }   

}

module.exports = new UserController();
