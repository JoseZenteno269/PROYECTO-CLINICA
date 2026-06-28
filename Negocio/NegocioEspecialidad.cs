using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioEspecialidad
    {
        DaoEspecialidad daoEspecialidad = new DaoEspecialidad();

        public NegocioEspecialidad()
        {

        }

        public DataTable getDropDownListEspecialidad()
        {
            return daoEspecialidad.getTablaEspecialidad();
        }
    }
}
