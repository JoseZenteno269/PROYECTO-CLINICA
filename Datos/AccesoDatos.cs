using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    class AccesoDatos
    {
        String Ruta = @"Data Source=R7ASUSROG\SQLEXPRESS;Initial Catalog=PROYECTO_CLINICA;Integrated Security=True;Encrypt=False";

        private SqlConnection ObetenerConexion()
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

        private SqlDataAdapter ObtenerAdaptador(string consulta, SqlConnection conexion)
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
    }
}
