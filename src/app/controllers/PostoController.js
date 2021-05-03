const Posto = require("../models/Posto");

class PostoController {

  async storePosto(req, res) {
      console.log(req.body);
      const posto = await Posto.storePosto(req.body);    
      
      return res.json(posto);
    
  }

  async getPostos(req, res) {

    const postos = await Posto.getPostos();    

    return res.json(postos[0]);
  
}


}

module.exports = new PostoController();
