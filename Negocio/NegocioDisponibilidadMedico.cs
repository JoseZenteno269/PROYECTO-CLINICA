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
    public class NegocioDisponibilidadMedico
    {
        DaoDisponibilidadMedico daoDisponibilidadMedico = new DaoDisponibilidadMedico(); 

        public NegocioDisponibilidadMedico()
        {

        }

        public String getDiasXMedico(int idmedico)
        {
            return daoDisponibilidadMedico.getDiasXMedico(idmedico);
        }

        public DataTable getDropDownListDisponibilidadHoraria(int dia)
        {
            return daoDisponibilidadMedico.getTablaDisponibilidadMedica(dia);
        }

        public Boolean AgregarHorarios(int idmedico, int dia, TimeSpan hora)
        {
            int filasafectadas = 0; 
            DisponibilidadMedico disponibilidadMedico = new DisponibilidadMedico();
            disponibilidadMedico.setIdMedico(idmedico);
            disponibilidadMedico.setDiaSemana(dia);
            disponibilidadMedico.setHorario(hora);

            if (daoDisponibilidadMedico.ExisteDisponibilidadMedico(disponibilidadMedico) == false)
            {
                filasafectadas = daoDisponibilidadMedico.AgregarDisponibilidadMedico(disponibilidadMedico);
            }
            
            return filasafectadas == 1;
        }
    }
}
