var db = require("../../config/dbConnection");
const crypto = require('crypto');

class PostoModel {

  async storePosto(data) {
    var result;

    await db("posto")
      .insert(data)
      .then(response => {
        result = response;
      })
      .catch(erro => {
        console.log("Erro storePosto Model => ", erro);
        return;
      });

    return result;
  }

  async getPostos() {
    var result;

    await db.raw(" SELECT *, (    3959 *    acos(cos(radians(-16.005806)) *     cos(radians(lat)) *     cos(radians(lng) -     radians(-47.9888555)) +     sin(radians(-16.005806)) *     sin(radians(lat )))    ) AS distance     FROM posto   HAVING distance < 6.21371     ORDER BY distance LIMIT 0, 20    ")
      .then(response => {
        result = response;
      })
      .catch(erro => {
        console.log("Erro getPostos Model => ", erro);
        return;
      });

    return result;
  }

}

module.exports = new PostoModel();
