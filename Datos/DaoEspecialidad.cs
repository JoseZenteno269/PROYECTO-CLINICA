using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoEspecialidad
    {
        AccesoDatos datos = new AccesoDatos(); 

        public DaoEspecialidad()
        {

        }

        public DataTable getTablaEspecialidad()
        {
            DataTable tabla = datos.ObtenerTabla("Especialidad", "SELECT Nombre_Espe, Id_Especialidad_Espe FROM Especialidad");
            return tabla;
        }
    }
}
