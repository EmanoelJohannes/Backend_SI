const Agendamento = require("../models/Agendamento");
const { startOfDay, endOfDay, setHours, setMinutes, setSeconds, format, isAfter, parseISO } = require('date-fns');

class AgendamentoController {

    async getHorarios(req, res) {
        const {date} = req.query;

        const searchDate = parseISO(date);

        const dateFormatted = format(new Date(date), 'yyyy/MM/dd');
            
        const agendamentos = await Agendamento.getAgendamentos(dateFormatted);

        const schedule = [
            '08:00', // 2018-06-23 08:00:00
            '09:00', // 2018-06-23 09:00:00
            '10:00',
            '11:00',
            '12:00',
            '13:00',
            '14:00',
            '15:00',
            '16:00',
            '17:00',
            '18:00'
        ];

        const available = schedule.map(time => {
            const [hour, minute] = time.split(':');
            const value = setSeconds(setMinutes(setHours(searchDate, hour), minute), 0);
            
            return {
                time, 
                value: format(value, "yyyy-MM-dd'T'HH:mm:ssxxx"),
                available: isAfter(value, new Date()) && !agendamentos.find(a => format(a.data_hora, 'HH:mm') == time)  
            };
        });
        
        return res.json(available);
    }


    async storeAgendamento(req, res) {
        const posto = await Agendamento.storeAgendamento(req.body);    

        return res.json({ok: true});
    }

    async getAgendamentos(req, res) {

        const agendamentos = await Agendamento.getAgendamentosByLogin(req.params.id);    


        agendamentos.forEach(agendamento => {
            agendamento.data_formatada = format(new Date(agendamento.data_hora), "dd/MM/yyyy 'às' HH:mm");
        });

        return res.json(agendamentos);
    }

}

module.exports = new AgendamentoController();
