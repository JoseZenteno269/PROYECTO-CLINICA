using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
        public DataTable FiltrarProvincia(int idProvincia)
        {
            string consulta = "SELECT P.DNI_Paci, P.Nombre_Paci, P.Apellido_Paci, PR.Descripcion_Prov FROM Pacientes P INNER JOIN Provincias PR ON P.Id_Provincia_Paci = PR.Id_Provincia_Prov WHERE PR.Id_Provincia_Prov = @PROVINCIA";

            SqlCommand cmd = new SqlCommand(consulta);
            cmd.Parameters.AddWithValue("@PROVINCIA", idProvincia);

            return datos.ObtenerTablaFiltros(cmd, "Provincias");
        }
    }
}
