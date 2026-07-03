using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioEstadoPaciente
    {
       DaoEstadoPaciente dao = new DaoEstadoPaciente();   
        
        public NegocioEstadoPaciente()
        {
            /// Vacio
        }
        public DataTable getEstadoPaciente()
        {
            return dao.getEstadoPaciente();
        }
    }
}
