using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turnos
    {
        private int IdTurno;
        private int IdMedicoTurno;
	    private int IdEspecialidadTurno;
        private int IdPacienteTurno;
	    private int IdEstadoPacienteTurno;
	    private int IdEstadoTurno;
        private DateTime FechaTurno;
	    private TimeSpan HorarioTurno;
        private String DescripcionTurno;
	    private Boolean ActivoTurno;


        public void setIdTurno(int idTurno)
        {
            IdTurno = idTurno;
        }

        public int getIdTurno()
        {
            return IdTurno;
        }

        public void setIdMedicoTurno(int idMedicoTurno) 
        {
            IdMedicoTurno = idMedicoTurno; 
        }

        public int getIdMedicoTurno()
        {
            return IdMedicoTurno; 
        }

        public void setIdEspecialidadTurno(int idEspecialidadTurno)
        {
            IdEspecialidadTurno = idEspecialidadTurno; 
        }

        public int getIdEspecialidadTurno()
        {
            return IdEspecialidadTurno; 
        }

        public void setIdPacienteTurno(int idPacienteTurno)
        {
            IdPacienteTurno = idPacienteTurno; 
        }

        public int getIdPacienteTurno()
        {
            return IdPacienteTurno;
        }

        public void setIdEstadoPacienteTurno(int idEstadoPacienteTurno)
        {
            IdEstadoPacienteTurno = idEstadoPacienteTurno;
        }

        public int getIdEstadoPacienteTurno()
        {
            return IdEstadoPacienteTurno; 
        }

        public void setIdEstadoTurno(int idEstadoTurno)
        {
            IdEstadoTurno = idEstadoTurno;
        }

        public int getIdEstadoTurno()
        {
            return IdEstadoTurno; 
        }

        public void setFechaTurno(DateTime fechaTurno)
        {
            FechaTurno = fechaTurno;
        }

        public DateTime getFechaTurno()
        {
            return FechaTurno;
        }

        public void setHorarioTurno(TimeSpan horarioTurno)
        {
            HorarioTurno = horarioTurno;
        }

        public TimeSpan getHorarioTurno()
        {
            return HorarioTurno;
        }

        public void setDescripcionTurno(String descripcionTurno)
        {
            DescripcionTurno = descripcionTurno; 
        }

        public String getDescripcionTurno()
        {
            return DescripcionTurno;
        }

        public void setActivoTurno(Boolean activoTurno)
        {
            ActivoTurno = activoTurno; 
        }

        public Boolean getActivoTurno()
        {
            return ActivoTurno;
        }
    }
}
