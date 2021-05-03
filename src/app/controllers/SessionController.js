const jwt = require('jsonwebtoken');
const User = require('../models/User');

const authConfig = require('../../config/auth');

class SessionController {
    async store(req, res){
        var { login, senha } = req.body;

        var loginNoWhiteSpace = login.replace(/\s/g, "");

        const checkUser = await User.findByLogin(loginNoWhiteSpace);

        if (checkUser.length < 1) {
        
            return res.json({ error: "Login não encontrado." });
        
        } else {

            const user = await User.Autenticate(loginNoWhiteSpace, senha);

            if (user.length < 1) {
                return res.json({ error: "Senha incorreta." });
            } else {                    
                return res.json({user})
            }  
        }
    }              
    
}

module.exports = new SessionController();
