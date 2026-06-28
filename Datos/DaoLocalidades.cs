using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoLocalidades
    {
        AccesoDatos datos = new AccesoDatos();

        public DaoLocalidades()
        {

        }

        public DataTable getTablaLocalidades()
        {
            DataTable tabla = datos.ObtenerTabla("Localidades", "SELECT Id_Localidad_Local, Id_Provincia_Local, Descripcion_Local FROM Localidades");
            return tabla;
        }
    }
}
