using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoUsuarios
    {
        AccesoDatos datos = new AccesoDatos();

        public DaoUsuarios()
        {

        }
        public int? getIdUsuario(String username)
        {
            String consulta = "SELECT Id_Usuario_Usu FROM Usuarios WHERE Username_Usu = @USERNAME AND Id_Administrador_Usu IS NULL AND Activo_Usu = 1";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@USERNAME", username);
            return datos.EjecutarEscalarInt(comando, consulta);
        }
        public String MedicoAdministrador(String usuario, String constrasena)
        {
            String consulta = "SELECT CASE WHEN Id_Administrador_Usu IS NOT NULL THEN 'Administrador' WHEN Id_Medico_Usu IS NOT NULL THEN 'Medico' END AS Tipousuario FROM Usuarios WHERE Username_Usu = @USUARIO AND Password_Usu = HASHBYTES('SHA2_256', CONVERT(VARCHAR, @PASSWORD)) AND Activo_Usu = 1";
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@USUARIO", usuario.ToString().Trim());
            //comando.Parameters.AddWithValue("@PASSWORD",System.Text.Encoding.ASCII.GetBytes(constrasena.ToString().Trim()));
            comando.Parameters.AddWithValue("@PASSWORD", constrasena.ToString().Trim());
            return datos.EjecutarEscalarString(comando, consulta);
        }

        //public Boolean ExisteUsuario(Usuarios usuario)
        //{
        //    String consulta = "SELECT * FROM Usuarios WHERE Username_Usu = @USERNAME";
        //    SqlCommand comando = new SqlCommand();
        //    comando.Parameters.AddWithValue("@USERNAME", usuario.getUsername()); 
        //    return datos.Existe(comando, consulta); 
        //}

        public int CambioContrasena(int idusuario, String contrasena)
        {
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@IDUSUARIO", idusuario);
            comando.Parameters.AddWithValue("@PASSWORD", contrasena);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spCambioContrasena");
        }

        public int AgregarUsuario(Usuarios usuarios)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosUsuarios(ref comando, usuarios);
            return datos.EjecutarProcedimientoAlmacenado(comando, "spGenerarUsuario");
        }

        public void ArmarParametrosUsuarios(ref SqlCommand comando, Usuarios usuarios)
        {
            SqlParameter parametros = new SqlParameter();

            parametros = comando.Parameters.Add("@IDMEDICO", SqlDbType.Int);
            parametros.Value = usuarios.getIdMedico();

            parametros = comando.Parameters.Add("@IDADMINISTRADOR", SqlDbType.Int);
            parametros.Value = (object)usuarios.getIdAdministrador() ?? DBNull.Value;

            parametros = comando.Parameters.Add("@USERNAME", SqlDbType.NVarChar);
            parametros.Value = usuarios.getUsername();

            parametros = comando.Parameters.Add("@PASSWORD", SqlDbType.NVarChar);
            parametros.Value = usuarios.getPassword();
        }
    }
}
