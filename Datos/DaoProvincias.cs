using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoProvincias
    {
        AccesoDatos datos = new AccesoDatos();

        public DaoProvincias()
        {

        }

        public DataTable getTablaProvincia()
        {
            DataTable tabla = datos.ObtenerTabla("Provincias", "SELECT Id_Provincia_Prov, Descripcion_Prov FROM Provincias");
            return tabla;
        }
    }
}
