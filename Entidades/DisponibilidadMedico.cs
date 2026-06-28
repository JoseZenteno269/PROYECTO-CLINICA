using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DisponibilidadMedico
    {
        private int IdDisponibildad; 
        private int IdMedico;
	    private int DiaSemana;
        private TimeSpan Horario;

        public DisponibilidadMedico()
        {

        }

        public void setIdDisponibildiad(int idDisponibildad) 
        {
            IdDisponibildad = idDisponibildad;
        }

        public int getIdDisponibildiad()
        {
            return IdDisponibildad;
        }

        public void setIdMedico(int idMedico)
        {
            IdMedico = idMedico;
        }

        public int getIdMedico()
        {
            return IdMedico;
        }

        public void setDiaSemana(int diaSemana)
        {
            DiaSemana = diaSemana;
        }

        public int getDiaSemana()
        {
            return DiaSemana;
        }

        public void setHorario(TimeSpan horario)
        {
            Horario = horario;
        }

        public TimeSpan getHorario()
        {
            return Horario;
        }
    }
}
