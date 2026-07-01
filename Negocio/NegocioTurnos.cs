using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioTurnos
    {
        DaoTurnos daoTurnos = new DaoTurnos(); 

        public NegocioTurnos()
        {

        }

        public DataTable getTurnos()
        {
            return daoTurnos.getTablaTurno();
        }

        public DataTable getTurnosCancelar()
        {
            return daoTurnos.getTablaCancelarTurno();
        }
        public Boolean AgregarTurno(int idEspecialidad, int idMedico, DateTime fecha, TimeSpan Hora, int idpaciente, int idestadoturno)
        {
            int filasafectadas = 0;

            Turnos turnos = new Turnos();
            turnos.setIdEspecialidadTurno(idEspecialidad);
            turnos.setIdMedicoTurno(idMedico);
            turnos.setFechaTurno(fecha);
            turnos.setIdPacienteTurno(idpaciente);
            turnos.setIdEstadoTurno(idestadoturno);
            turnos.setHorarioTurno(Hora);

            filasafectadas = daoTurnos.AgregarTurnos(turnos);
            return filasafectadas == 1;
        }

        public Boolean AgregarAsistenciaObservacion(int idTurno, int idEstadoPaciente, string descripcion)
        {
            int filasafectadas = 0;

            Turnos turnos = new Turnos();
            turnos.setIdTurno(idTurno);
            turnos.setIdEstadoPacienteTurno(idEstadoPaciente);
            turnos.setDescripcionTurno(descripcion);

            filasafectadas = daoTurnos.AgregarAsistenciaObservacion(turnos);
            return filasafectadas == 1;
        }

        public Boolean CancelarTurnos(int idTurno)
        {
            Turnos turnos = new Turnos();
            turnos.setIdTurno(idTurno);
            int filasafectadas = daoTurnos.CancelarTurnos(turnos);
            if (filasafectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
