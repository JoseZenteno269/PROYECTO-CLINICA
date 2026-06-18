using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioClinica
    {
        DaoDatos daoDatos = new DaoDatos();
        public NegocioClinica()
        {
            // Constructor Vacío
        }

        public DataTable getPacientes()
        {
            return daoDatos.getTablaPacientes();
        }

        public DataTable getMedicos()
        {
            return daoDatos.getTablaMedicos();
        }

        public DataTable getTurnos()
        {
            return daoDatos.getTablaTurno();
        }
    }
}
