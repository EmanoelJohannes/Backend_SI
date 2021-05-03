const jwt = require('jsonwebtoken');
const User = require('../models/User');

const authConfig = require('../../config/auth');

class SessionController {
    async store(req, res){
        var { login, senha } = req.body;

        if (!isNaN(login)){
            const cpf = await User.findByCPF(login);
            
            if (cpf.length > 0) {
                const user = await User.AutenticateByCPF(cpf[0].cpf, senha);

                if (user.length < 1) {
                    return res.json({ error: "Senha incorreta." });
                } else {                    
                    return res.json({user})
                }
            } else {
                return res.json({error: "CPF não encontrado."});
            }
        } else {
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
}

module.exports = new SessionController();
