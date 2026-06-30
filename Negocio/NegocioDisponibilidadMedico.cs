using Datos;
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

        public DataTable getDropDownListDisponibilidadHoraria(int dia)
        {
            return daoDisponibilidadMedico.getTablaDisponibilidadMedica(dia);
        }

        public Boolean AgregarHorarios(int idmedico, int dia, TimeSpan hora)
        {
            int filasafectadas = daoDisponibilidadMedico.AgregarhoraXmedico(idmedico, dia, hora);

            return filasafectadas == 1;
        }
    }
}
