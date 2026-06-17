using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace Datos
{
    class AccesoDatos
    {
        String Ruta = @"Data Source=R7ASUSROG\SQLEXPRESS;Initial Catalog=PROYECTO_CLINICA;Integrated Security=True;Encrypt=False";

        private SqlConnection ObtenerConexion()
        {
            SqlConnection conexion; 

            try
            {
                conexion = new SqlConnection(Ruta); 
                conexion.Open();
                return conexion; 
            }
            catch (Exception)
            {
                return null;
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

        public DataTable ObtenerTabla(String nombretabla, String consulta)
        {
            DataSet set = new DataSet();
            SqlConnection conexion = ObtenerConexion(); 
            SqlDataAdapter adaptador = ObtenerAdaptador(consulta, conexion);
            adaptador.Fill(set, nombretabla);
            conexion.Close();
            return set.Tables[nombretabla];
        }

        public Boolean Existe(String consulta)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand comando = new SqlCommand(consulta, conexion);
            SqlDataReader leer = comando.ExecuteReader();
            if (leer.Read())
            {
                conexion.Close(); 
                return true;
            }
            else
            {
                conexion.Close(); 
                return false;
            }
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
