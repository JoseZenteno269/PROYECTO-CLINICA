using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoAdministradores
    {
        AccesoDatos datos = new AccesoDatos();

        public DaoAdministradores()
        {

        }

        public int? getIdAdministrador(String usuario)
        {
            String consulta = "SELECT Id_Administrador_Admin FROM Administradores INNER JOIN Usuarios ON Id_Administrador_Usu = Id_Administrador_Admin WHERE Username_Usu = @USERNAME";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@USERNAME", usuario);
            return datos.EjecutarEscalarInt(comando, consulta);
        }
    }
}
