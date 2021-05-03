var db = require("../../config/dbConnection");
const crypto = require('crypto');

class AgendamentoModel {

    async getAgendamentos(date) {
        var result;
        
        const from = date + ' 00:00:00';
        const to = date + ' 23:59:59';
        
        await db("agendamento")
          .select("*")
          .whereBetween('data_hora', [from, to])          
          .then(response => {
            result = response;
          })
          .catch(erro => {
            console.log("Erro getAgentamentos Model => ", erro);
            return;
        });
        return result;

    }

    async storeAgendamento(data) {
      var result;
  
      await db("agendamento")
        .insert(data)
        .then(response => {
          result = response;
        })
        .catch(erro => {
          console.log("Erro storeAgendamento Model => ", erro);
          return;
        });
  
      return result;
    }

}

// Date=convert(datetime, '2016-12-25');

module.exports = new AgendamentoModel();
