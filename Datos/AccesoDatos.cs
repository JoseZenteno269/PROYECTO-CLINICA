using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Runtime.CompilerServices;

namespace Datos
{
    public class AccesoDatos
    {
        String Ruta = @"Data Source=localhost\sqlexpress;Initial Catalog=BDClinica;Integrated Security=True;Encrypt=False";

        private SqlConnection ObtenerConexion()
        {
            SqlConnection conexion; 

            try
            {
                conexion = new SqlConnection(Ruta); 
                conexion.Open();
                return conexion; 
            }
            catch (Exception ex)
            {
                throw new Exception("Error al conectar: " + ex.Message);
            }
        }

        private SqlDataAdapter ObtenerAdaptador(String consulta, SqlConnection conexion)
        {
            SqlDataAdapter adaptador;

            try
            {
                adaptador = new SqlDataAdapter(consulta, conexion);
                return adaptador;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public int? EjecutarEscalarInt(String consulta)
        { 
            SqlConnection conexion = ObtenerConexion();
            SqlCommand comando = new SqlCommand(consulta, conexion);
            object resultado = comando.ExecuteScalar(); 
            if(resultado != null)
                return Convert.ToInt32(resultado);
            return null;
        }

        public int? EjecutarEscalarInt(SqlCommand comando, String consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            comando.Connection = conexion;
            comando.CommandText = consulta; 
            object resutado = comando.ExecuteScalar();
            if (resutado != null)
                    return Convert.ToInt32(resutado);
            return null;
        }

        public String EjecutarEscalarString(SqlCommand comando, String consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            comando.Connection = conexion;
            comando.CommandText = consulta;
            object resultado = comando.ExecuteScalar();
            if (resultado != null)
            {
                return resultado.ToString();
            }
            return null;
        }

        //public String ObtenerIdUsuario(SqlCommand comando, String consulta)
        //{
        //    SqlConnection conexion = ObtenerConexion();
        //    comando.Connection = conexion;
        //    comando.CommandText = consulta; 
        //    SqlDataReader lectura = comando.ExecuteReader();
        //    if (lectura.Read())
        //    {
        //        return lectura["Id_Usuario_Usu"].ToString();
        //    }

        //    return null;
        //}

        //public String LoginMedicoAdministrador(SqlCommand comando, String consulta)
        //{
        //    String tipoUsuario = "ERROR - TIPO INEXISTENTE"; 
        //    SqlConnection conexion = ObtenerConexion();
        //    comando.Connection = conexion;
        //    comando.CommandText = consulta;
        //    SqlDataReader leer = comando.ExecuteReader();
        //    if (leer.Read())
        //    {
        //        tipoUsuario = leer["Tipousuario"].ToString();  
        //    }
        //    conexion.Close();
        //    return tipoUsuario; 
        //}

        public DataTable ObtenerTabla(String nombretabla, String consulta)
        {
            DataSet set = new DataSet();
            SqlConnection conexion = ObtenerConexion(); 
            SqlDataAdapter adaptador = ObtenerAdaptador(consulta, conexion);
            adaptador.Fill(set, nombretabla);
            conexion.Close();
            return set.Tables[nombretabla];
        }

        public Boolean Existe(SqlCommand comando, String consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            comando.Connection = conexion;
            comando.CommandText = consulta; 
            SqlDataReader leer = comando.ExecuteReader();
            bool existe = leer.Read();
            conexion.Close(); 
            return existe;
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand comando, String procedimiento)
        {
            SqlConnection conexion = ObtenerConexion();
            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = procedimiento;
            int filasafectadas = comando.ExecuteNonQuery();
            conexion.Close(); 
            return filasafectadas;
        }
    }
}
