using Datos;
using Entidades;
using Microsoft.Win32;
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

        // Informe 1
        public int? CantidadTurnos(String fechainicio, String fechafin)
        {
            return daoTurnos.CantidadTurnos(fechainicio, fechafin);
        }

        public String ConsultaPorcentajePresentes(String fechainicio, String fechafin)
        {
            return daoTurnos.ConsultaPorcentajePresentes(fechainicio, fechafin);
        }

        //------------------------------------------------------//

        // Informe 2

        public DataTable ConsultaTurnosXEspecialidad(String fechainicio, String fechafin)
        {
            return daoTurnos.ConsultaTurnosXEspecialidad(fechainicio, fechafin);
        }

        public DataTable ConsultaTurnosXEspecialidad(String fechainicio, String fechafin, String especialidad)
        {
            return daoTurnos.ConsultaTurnosXEspecialidad(fechainicio, fechafin, especialidad); 
        }

        public String ConsutaMaxEspecialidad()
        {
            return daoTurnos.ConsutaMaxEspecialidad(); 
        }

        //----------------------------------------------------------------//

        // Informe 3
        public DataTable ConsultaInforme3(string idmendico, string mes)
        {
            return daoTurnos.ConsultaInforme3(idmendico, mes);
        }

        //----------------------------------------------------------------//

        //Infomre 4 

        public int ConsultaInforme4(int mes, int anio, int diasemana)
        {
            return daoTurnos.ConsultaInforme4(mes, anio, diasemana); 
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

        public Boolean AgregarAsistenciaObservacion(int idTurno,int idestadoturno, int idEstadoPaciente, string descripcion)
        {
            int filasafectadas = 0;

            Turnos turnos = new Turnos();
            turnos.setIdTurno(idTurno);
            turnos.setIdEstadoTurno(idestadoturno); 
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
