using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoEstadoTurno
    {
        AccesoDatos datos = new AccesoDatos();
        public DaoEstadoTurno() 
        {
            // VACIO
        }

        public DataTable getEstadoTurnos()
        {
            DataTable tabla = datos.ObtenerTabla("EstadoTurno", "SELECT Id_Estado_EsTur, Descripcion_EsTur FROM EstadoTurno");
            return tabla;
        }
    }
}
